/**
 * AuthService — Encapsulates all authentication logic.
 *
 * OOP Concepts Used:
 *  - Encapsulation: All auth operations are bundled inside a single class.
 *    The calling code (UI) doesn't need to know HOW auth works—only WHAT to call.
 *  - Abstraction: The Supabase API details are hidden. Components only call
 *    simple methods like sendOtp() and verifyOtp().
 *  - Single Responsibility: This class is responsible ONLY for authentication.
 */

import { supabase } from '../supabaseClient'

class AuthService {
  /**
   * Sends an OTP to the given email using Supabase Auth magic-link/OTP.
   * @param {string} email
   */
  async sendOtp(email) {
    const { error } = await supabase.auth.signInWithOtp({
      email,
      options: { shouldCreateUser: true }
    })
    if (error) throw new Error(error.message)
    return true
  }

  /**
   * Verifies the OTP entered by the user.
   * @param {string} email
   * @param {string} token
   * @returns {object} Supabase session data
   */
  async verifyOtp(email, token) {
    const { data, error } = await supabase.auth.verifyOtp({
      email,
      token,
      type: 'email'
    })
    if (error) throw new Error(error.message)
    return data
  }

  /**
   * Returns the currently logged-in Supabase user.
   */
  async getCurrentUser() {
    const { data: { user } } = await supabase.auth.getUser()
    return user
  }

  /**
   * Signs out the current user.
   */
  async signOut() {
    const { error } = await supabase.auth.signOut()
    if (error) throw new Error(error.message)
  }
}

// Export a single shared instance — Singleton Pattern
export const authService = new AuthService()
