# Supabase Integration Plan

Connect the SkyLink Airlines React + Vite frontend to a Supabase database to enable real user authentication, passenger detail storage, and live flight search.

> [!IMPORTANT]
> You will need to provide your **Supabase Project URL** and **Supabase Anon (Public) Key** before we can proceed. These can be found in your Supabase dashboard under **Settings → API**.

---

## Proposed Changes

### Step 1 — Install Supabase Client
```bash
npm install @supabase/supabase-js
```

---

### Step 2 — Create Supabase Client

#### [NEW] `src/supabaseClient.js`
A centralized file that initializes the Supabase client using environment variables:
```js
import { createClient } from '@supabase/supabase-js'
export const supabase = createClient(
  import.meta.env.VITE_SUPABASE_URL,
  import.meta.env.VITE_SUPABASE_ANON_KEY
)
```

#### [NEW] `.env`
Create this file in the project root (`d:\oose\.env`):
```
VITE_SUPABASE_URL=https://your-project.supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key-here
```

---

### Step 3 — Auth Flow (OTP via Supabase Auth)

#### [MODIFY] [src/components/Auth.jsx](file:///d:/oose/src/components/Auth.jsx)
Replace the mock OTP logic with real Supabase OTP calls:

| Step | Current (Mock) | After Integration |
|---|---|---|
| Get OTP | Go to step 2 | Call `supabase.auth.signInWithOtp({ email })` |
| Verify OTP | Check `=== '123456'` | Call `supabase.auth.verifyOtp({ email, token, type: 'email' })` |
| Save Details | `console.log(details)` | `supabase.from('Passenger').insert([details])` |

---

### Step 4 — Store Passenger Details to Supabase

When Sign Up is completed (Step 3), the form data is sent to Supabase:
```js
const { error } = await supabase.from('Passenger').insert([{
  email: email,
  name: details.name,
  contact_no: details.contact_no,
  age: details.age,
  gender: details.gender,
  address: details.address,
}])
```

> [!NOTE]
> Make sure your `Passenger` table in Supabase has Row Level Security (RLS) set to allow `INSERT` for authenticated users or turn it off for testing.

---

### Step 5 — Live Flight Search

#### [MODIFY] [src/components/Hero.jsx](file:///d:/oose/src/components/Hero.jsx)
When the "Search Flights" button is clicked, query the `Flight` or `Schedule` table:
```js
const { data, error } = await supabase
  .from('Flight')
  .select('*')
  .eq('source', from.code)
  .eq('destination', to.code)
  .eq('date', departureDate)
```

#### [NEW] `src/components/FlightResults.jsx`
A new component to display the fetched flight list with details like flight number, time, airline, and price.

---

## Verification Plan
1. Sign up with a real email and receive an OTP.
2. Verify the OTP and complete passenger details.
3. Check the Supabase `Passenger` table in the dashboard to confirm the record was created.
4. Search for a flight and confirm results appear from the `Flight` table.
