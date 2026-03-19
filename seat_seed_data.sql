-- ============================================================
--  SkyLink Airlines — Realistic Seat Seed Data (114 seats/flight)
--
--  Run this in: Supabase Dashboard → SQL Editor → New Query
--
--  IMPORTANT: Run seat_lock_migration.sql FIRST if locked_until
--  column doesn't exist yet.
--
--  Cabin layout per flight:
--    Business (rows 1-3):  A, B | D, E  (4 seats × 3 rows = 12)
--    Economy  (rows 4-20): A, B, C | D, E, F  (6 seats × 17 rows = 102)
--    Total: 114 seats per flight
--
--  NOTE: This script will SKIP flights that already have seats seeded.
--        Safe to re-run.
-- ============================================================

DO $$
DECLARE
  flt RECORD;
  r INT;
  c TEXT;
  biz_cols TEXT[] := ARRAY['A', 'B', 'D', 'E'];
  eco_cols TEXT[]  := ARRAY['A', 'B', 'C', 'D', 'E', 'F'];
  existing_count INT;
BEGIN
  FOR flt IN SELECT flight_id FROM "Flight" LOOP
    -- Check if seats already seeded for this flight
    SELECT COUNT(*) INTO existing_count FROM "Seat" WHERE flight_id = flt.flight_id;

    IF existing_count = 0 THEN
      RAISE NOTICE 'Seeding seats for flight_id=%', flt.flight_id;

      -- Business class: rows 1-3, columns A B D E
      FOR r IN 1..3 LOOP
        FOREACH c IN ARRAY biz_cols LOOP
          INSERT INTO "Seat" (flight_id, seat_number, seat_class, is_booked)
          VALUES (flt.flight_id, r::TEXT || c, 'Business', FALSE);
        END LOOP;
      END LOOP;

      -- Economy class: rows 4-20, columns A B C D E F
      FOR r IN 4..20 LOOP
        FOREACH c IN ARRAY eco_cols LOOP
          INSERT INTO "Seat" (flight_id, seat_number, seat_class, is_booked)
          VALUES (flt.flight_id, r::TEXT || c, 'Economy', FALSE);
        END LOOP;
      END LOOP;

      RAISE NOTICE 'Seeded 114 seats for flight_id=%', flt.flight_id;
    ELSE
      RAISE NOTICE 'Skipping flight_id=% (already has % seats)', flt.flight_id, existing_count;
    END IF;
  END LOOP;
END;
$$;

-- ── Verification queries ──────────────────────────────────────────────────

-- Confirm total seat count per flight (should be 114):
-- SELECT flight_id, COUNT(*) as seat_count FROM "Seat" GROUP BY flight_id ORDER BY flight_id;

-- Confirm class distribution per flight (should be 12 Business, 102 Economy):
-- SELECT flight_id, seat_class, COUNT(*) FROM "Seat" GROUP BY flight_id, seat_class ORDER BY flight_id, seat_class;

-- Confirm locked_until column exists on Seat:
-- SELECT column_name FROM information_schema.columns WHERE table_name='Seat' AND column_name='locked_until';
-- ─────────────────────────────────────────────────────────────────────────
