-- Migration: Add PNR to Ticket table for professional booking references
-- This ensures PNRs are persisted and can be fetched in the My Reservations dashboard.

-- 1. Add the column (allowing NULL initially for existing rows)
ALTER TABLE "Ticket" ADD COLUMN IF NOT EXISTS pnr VARCHAR(10);

-- 2. Backfill existing rows with a mock PNR if any exist
UPDATE "Ticket" 
SET pnr = 'SL' || LPAD(FLOOR(RANDOM() * 1000000)::text, 6, '0')
WHERE pnr IS NULL;

-- 3. (Optional) Make it NOT NULL for future entries if preferred, 
-- but for now we'll keep it simple for the demo.
