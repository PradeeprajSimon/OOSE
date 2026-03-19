    -- 1. Create a backup table of the existing Seat data
    CREATE TABLE "Seat_Backup_pre_lock" AS 
    SELECT * FROM "Seat";

    -- You can verify the backup was created successfully by running:
    -- SELECT count(*) FROM "Seat_Backup_pre_lock";

    -- 2. Add the locked_until column to the Seat table
    ALTER TABLE "Seat"
    ADD COLUMN IF NOT EXISTS "locked_until" TIMESTAMP WITH TIME ZONE NULL;

    -- 3. (Optional) If you ever need to restore the data, you would run:
    -- TRUNCATE TABLE "Seat";
    -- INSERT INTO "Seat" (seat_id, flight_id, seat_number, seat_class, is_booked)
    -- SELECT seat_id, flight_id, seat_number, seat_class, is_booked FROM "Seat_Backup_pre_lock";
