/**
 * PassengerService — Manages all Passenger data operations.
 * OOP Concepts: Encapsulation, Abstraction, SRP, Data Validation.
 *
 * Column names match the actual Supabase 'passenger' table schema exactly.
 */

import { supabase } from '../supabaseClient'

const TABLE_NAME = 'passenger'

class PassengerService {
  /**
   * Looks up a passenger by email. Returns null if not found.
   */
  async getByEmail(email) {
    const { data, error } = await supabase
      .from(TABLE_NAME)
      .select('*')
      .eq('email', email)
      .maybeSingle()

    if (error) throw new Error(error.message)
    return data || null
  }

  /**
   * Validates passenger details before saving.
   */
  validate(details) {
    if (!details.name || details.name.trim().length < 2)
      throw new Error('Full name must be at least 2 characters.')
    if (!details.contact_no || details.contact_no.trim().length < 7)
      throw new Error('Please enter a valid contact number.')
    const age = parseInt(details.age)
    if (isNaN(age) || age < 1 || age > 120)
      throw new Error('Age must be between 1 and 120.')
  }

  /**
   * Creates a new passenger record using the exact Supabase column names:
   * Name, email, Contact_no, Age, Gender, Address
   */
  async create(email, details, userId = null) {
    this.validate(details)

    // Column names must exactly match your Supabase table
    const passengerData = {
      Name: details.name.trim(),
      email: email,
      Contact_no: details.contact_no.trim(),
      Age: parseInt(details.age),
      Gender: details.gender,
      Address: details.address?.trim() || '',
    }

    const { data, error } = await supabase
      .from(TABLE_NAME)
      .insert([passengerData])
      .select()
      .maybeSingle()

    if (error) throw new Error(error.message)
    // Return combined object so UI has all the details
    return data || { ...passengerData, email }
  }
}

// Singleton instance
export const passengerService = new PassengerService()
