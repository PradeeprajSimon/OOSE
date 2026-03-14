# OOP Concepts in SkyLink Airlines

This document explains every Object-Oriented Programming concept used in the project, with references to specific files and code examples.

---

## Architecture Overview

```
App.jsx (Orchestrator)
│
├── Auth.jsx ──────────→ AuthService.js ──────────→ Supabase Auth
│                    └─→ PassengerService.js ─────→ Passenger Table
│
├── Hero.jsx ──────────→ FlightService.js ─────────→ Flight Table
│
└── FlightResultsPage.jsx
        └── FlightCard.jsx
```

---

## 1. Encapsulation

> **"Wrapping data and methods that work on that data within a single unit (class), and hiding the internal details."**

**Where used:** All three service classes.

In [AuthService.js](file:///d:/oose/src/services/AuthService.js), the raw Supabase calls (`supabase.auth.signInWithOtp`, `supabase.auth.verifyOtp`) are **hidden inside** the class. The Auth component never touches Supabase directly.

```js
// ✅ Auth.jsx only sees a clean interface:
await authService.sendOtp(email)
await authService.verifyOtp(email, otp)

// ❌ The complex Supabase call is hidden inside AuthService:
async sendOtp(email) {
  const { error } = await supabase.auth.signInWithOtp({ email, ... })
  if (error) throw new Error(error.message)
}
```

---

## 2. Abstraction

> **"Showing only what is necessary and hiding what is complex."**

**Where used:** [FlightService.js](file:///d:/oose/src/services/FlightService.js) → [_buildQuery()](file:///d:/oose/src/services/FlightService.js#15-39) method.

The [search()](file:///d:/oose/src/services/FlightService.js#40-58) method is the **public interface**. The [_buildQuery()](file:///d:/oose/src/services/FlightService.js#15-39) method is the **private implementation** (prefixed with `_` by convention). Components call [search()](file:///d:/oose/src/services/FlightService.js#40-58) and never know HOW the query is built.

```js
// Public (what components see):
const flights = await flightService.search('MAA', 'BOM', '2026-03-20', 'price')

// Private (hidden implementation):
_buildQuery(criteria) {
  let query = supabase.from('Flight').select('*')
    .eq('source', criteria.source)
    .eq('destination', criteria.destination)
    ...
}
```

---

## 3. Single Responsibility Principle (SRP)

> **"A class should have one, and only one, reason to change."**

| Class/Component | Its ONE Responsibility |
|---|---|
| [AuthService.js](file:///d:/oose/src/services/AuthService.js) | User sign-in, OTP, sign-out |
| [PassengerService.js](file:///d:/oose/src/services/PassengerService.js) | Read/write Passenger table |
| [FlightService.js](file:///d:/oose/src/services/FlightService.js) | Search flights, format duration |
| [Auth.jsx](file:///d:/oose/src/components/Auth.jsx) | Render the multi-step auth UI |
| [FlightResultsPage.jsx](file:///d:/oose/src/components/FlightResultsPage.jsx) | Render flight search results |
| [Hero.jsx](file:///d:/oose/src/components/Hero.jsx) | Render the search form widget |
| [Navbar.jsx](file:///d:/oose/src/components/Navbar.jsx) | Render the navigation bar |

Each class/component has **one job**. If the Flight table column names change, only [FlightService.js](file:///d:/oose/src/services/FlightService.js) needs to change — not the UI.

---

## 4. Dependency Inversion Principle (DIP)

> **"High-level modules should not depend on low-level modules. Both should depend on abstractions."**

**Where used:** Every UI component.

| ❌ Before (tightly coupled) | ✅ After (loosely coupled) |
|---|---|
| [Auth.jsx](file:///d:/oose/src/components/Auth.jsx) → `supabase.auth.signInWithOtp()` | [Auth.jsx](file:///d:/oose/src/components/Auth.jsx) → `authService.sendOtp()` |
| [Hero.jsx](file:///d:/oose/src/components/Hero.jsx) → `supabase.from('Flight')` | [Hero.jsx](file:///d:/oose/src/components/Hero.jsx) → `flightService.search()` |

If you switch from Supabase to Firebase, you only change the **service files**, never the UI components.

---

## 5. Composition

> **"Building complex objects by combining simpler ones."**

**Where used:** [FlightResultsPage.jsx](file:///d:/oose/src/components/FlightResultsPage.jsx) is composed of [FlightCard](file:///d:/oose/src/components/FlightResultsPage.jsx#20-70) sub-components and [Navbar](file:///d:/oose/src/components/Navbar.jsx#3-46).

```jsx
// FlightResultsPage is composed of:
<Navbar ... />         ← Composed component 1
<FlightCard ... />     ← Composed component 2 (rendered repeatedly)
```

[FlightCard](file:///d:/oose/src/components/FlightResultsPage.jsx#20-70) is a **pure component** — it takes props and renders UI. The page composes many [FlightCard](file:///d:/oose/src/components/FlightResultsPage.jsx#20-70)s together to build the list.

---

## 6. Singleton Pattern

> **"Ensure that a class has only one instance and provide a global point of access to it."**

**Where used:** All three service files.

```js
// ✅ Only ONE instance ever exists — shared across the whole app:
export const authService    = new AuthService()
export const flightService  = new FlightService()
export const passengerService = new PassengerService()
```

Because these are module-level exports, JavaScript's module system guarantees that exactly one instance is created and shared everywhere.

---

## 7. State Pattern

> **"Allow an object to alter its behaviour when its internal state changes."**

**Where used:** [App.jsx](file:///d:/oose/src/App.jsx) page navigation, [Auth.jsx](file:///d:/oose/src/components/Auth.jsx) multi-step form.

```js
// App.jsx — state controls which PAGE renders:
const [page, setPage] = useState('home') // 'home' | 'results'
if (page === 'results') return <FlightResultsPage />
return <HomePage />

// Auth.jsx — state controls which STEP renders:
const [step, setStep] = useState(1) // 1, 2, or 3
```

---

## 8. Template Method Pattern

> **"Define the skeleton of an algorithm in a base method, deferring some steps to subclasses (or inner methods)."**

**Where used:** `FlightService._buildQuery()`.

The [search()](file:///d:/oose/src/services/FlightService.js#40-58) method defines the overall algorithm (validate → build query → execute → return data). The [_buildQuery()](file:///d:/oose/src/services/FlightService.js#15-39) method provides the interchangeable "step" of the algorithm. Adding a new filter (e.g., `airline`) only changes [_buildQuery()](file:///d:/oose/src/services/FlightService.js#15-39), not [search()](file:///d:/oose/src/services/FlightService.js#40-58).

---

## 9. Data Validation (Contract Programming)

> **"Enforcing pre-conditions before executing business logic."**

**Where used:** `PassengerService.validate()`.

```js
validate(details) {
  if (!details.name || details.name.trim().length < 2)
    throw new Error('Full name must be at least 2 characters.')
  if (isNaN(age) || age < 1 || age > 120)
    throw new Error('Age must be between 1 and 120.')
}
```

This **validate()** method acts as a **contract**: the data must meet requirements before it is written to the database.

---

## Summary Table

| OOP Concept | Files |
|---|---|
| Encapsulation | [AuthService.js](file:///d:/oose/src/services/AuthService.js), [PassengerService.js](file:///d:/oose/src/services/PassengerService.js), [FlightService.js](file:///d:/oose/src/services/FlightService.js) |
| Abstraction | `FlightService._buildQuery()` |
| Single Responsibility | All services + all components |
| Dependency Inversion | [Auth.jsx](file:///d:/oose/src/components/Auth.jsx), [Hero.jsx](file:///d:/oose/src/components/Hero.jsx), [FlightResultsPage.jsx](file:///d:/oose/src/components/FlightResultsPage.jsx) |
| Composition | [FlightResultsPage.jsx](file:///d:/oose/src/components/FlightResultsPage.jsx) + [FlightCard](file:///d:/oose/src/components/FlightResultsPage.jsx#20-70) + [Navbar](file:///d:/oose/src/components/Navbar.jsx#3-46) |
| Singleton Pattern | All three service exports |
| State Pattern | [App.jsx](file:///d:/oose/src/App.jsx) (pages), [Auth.jsx](file:///d:/oose/src/components/Auth.jsx) (steps) |
| Template Method | `FlightService.search()` + [_buildQuery()](file:///d:/oose/src/services/FlightService.js#15-39) |
| Contract / Validation | `PassengerService.validate()` |
