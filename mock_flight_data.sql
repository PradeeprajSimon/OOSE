-- ============================================================
--  SkyLink Airlines — Mock Flight Data
--  
--  STEP 1: Run this FIRST to add missing columns to your Flight table.
--  STEP 2: Then run the INSERT statements below.
--
--  Go to: Supabase Dashboard → SQL Editor → New Query → Paste → Run
-- ============================================================

-- ============ STEP 1: Add missing columns ============
-- These commands are safe to run even if the columns already exist.
-- If a column already exists, the command will produce a harmless error.

ALTER TABLE "Flight" ADD COLUMN IF NOT EXISTS airline TEXT;
ALTER TABLE "Flight" ADD COLUMN IF NOT EXISTS flight_no TEXT;
ALTER TABLE "Flight" ADD COLUMN IF NOT EXISTS arrival_time TIMESTAMP;
ALTER TABLE "Flight" ADD COLUMN IF NOT EXISTS class TEXT DEFAULT 'Economy';
ALTER TABLE "Flight" ADD COLUMN IF NOT EXISTS seats_available INT;

-- ============ STEP 2: Insert mock flight data ============
-- Note: departure_time and arrival_time are TIMESTAMPS (not text)
-- Source/destination use airport codes: DEL, BOM, BLR, MAA, CCU, HYD

-- ============================================================
-- ROUTE 1: Chennai (MAA) → Mumbai (BOM) — 20 March 2026
-- ============================================================
INSERT INTO "Flight" (source, destination, departure_time, arrival_time, fare, airline, flight_no, class, seats_available) VALUES
('MAA', 'BOM', '2026-03-20 05:55:00', '2026-03-20 08:45:00', 4299, 'IndiGo',    '6E 2228', 'Economy', 42),
('MAA', 'BOM', '2026-03-20 06:00:00', '2026-03-20 08:55:00', 5199, 'Air India',  'AI 2896', 'Economy', 18),
('MAA', 'BOM', '2026-03-20 09:15:00', '2026-03-20 12:10:00', 3899, 'SpiceJet',   'SG 8167', 'Economy', 65),
('MAA', 'BOM', '2026-03-20 14:30:00', '2026-03-20 17:20:00', 6799, 'Vistara',    'UK 872',  'Business', 8),
('MAA', 'BOM', '2026-03-20 19:45:00', '2026-03-20 22:35:00', 4999, 'Air India',  'AI 660',  'Economy', 31);

-- ============================================================
-- ROUTE 2: Delhi (DEL) → Mumbai (BOM)
-- ============================================================
INSERT INTO "Flight" (source, destination, departure_time, arrival_time, fare, airline, flight_no, class, seats_available) VALUES
('DEL', 'BOM', '2026-03-20 06:00:00', '2026-03-20 08:05:00', 3799, 'IndiGo',    '6E 444',  'Economy', 55),
('DEL', 'BOM', '2026-03-20 07:30:00', '2026-03-20 09:40:00', 5599, 'Air India',  'AI 101',  'Business', 12),
('DEL', 'BOM', '2026-03-20 10:20:00', '2026-03-20 12:25:00', 3499, 'SpiceJet',   'SG 161',  'Economy', 70),
('DEL', 'BOM', '2026-03-20 13:15:00', '2026-03-20 15:20:00', 7299, 'Vistara',    'UK 976',  'Business', 6),
('DEL', 'BOM', '2026-03-20 18:00:00', '2026-03-20 20:10:00', 3299, 'GoAir',      'G8 311',  'Economy', 48);

-- ============================================================
-- ROUTE 3: Delhi (DEL) → Bangalore (BLR)
-- ============================================================
INSERT INTO "Flight" (source, destination, departure_time, arrival_time, fare, airline, flight_no, class, seats_available) VALUES
('DEL', 'BLR', '2026-03-20 05:30:00', '2026-03-20 08:15:00', 4199, 'IndiGo',    '6E 2001', 'Economy', 60),
('DEL', 'BLR', '2026-03-20 07:00:00', '2026-03-20 09:50:00', 5899, 'Air India',  'AI 501',  'Economy', 22),
('DEL', 'BLR', '2026-03-20 12:00:00', '2026-03-20 14:45:00', 8499, 'Vistara',    'UK 810',  'Business', 5),
('DEL', 'BLR', '2026-03-20 15:30:00', '2026-03-20 18:20:00', 3799, 'SpiceJet',   'SG 233',  'Economy', 44),
('DEL', 'BLR', '2026-03-20 20:45:00', '2026-03-20 23:30:00', 4099, 'IndiGo',    '6E 2555', 'Economy', 33);

-- ============================================================
-- ROUTE 4: Bangalore (BLR) → Delhi (DEL)
-- ============================================================
INSERT INTO "Flight" (source, destination, departure_time, arrival_time, fare, airline, flight_no, class, seats_available) VALUES
('BLR', 'DEL', '2026-03-20 06:10:00', '2026-03-20 09:05:00', 4299, 'IndiGo',    '6E 2002', 'Economy', 50),
('BLR', 'DEL', '2026-03-20 09:00:00', '2026-03-20 12:00:00', 6199, 'Air India',  'AI 502',  'Economy', 15),
('BLR', 'DEL', '2026-03-20 13:00:00', '2026-03-20 16:00:00', 8799, 'Vistara',    'UK 811',  'Business', 4),
('BLR', 'DEL', '2026-03-20 16:45:00', '2026-03-20 19:40:00', 3999, 'SpiceJet',   'SG 234',  'Economy', 38),
('BLR', 'DEL', '2026-03-20 21:00:00', '2026-03-20 23:55:00', 3699, 'GoAir',      'G8 402',  'Economy', 55);

-- ============================================================
-- ROUTE 5: Mumbai (BOM) → Chennai (MAA)
-- ============================================================
INSERT INTO "Flight" (source, destination, departure_time, arrival_time, fare, airline, flight_no, class, seats_available) VALUES
('BOM', 'MAA', '2026-03-20 05:35:00', '2026-03-20 07:45:00', 3999, 'IndiGo',    '6E 341',  'Economy', 48),
('BOM', 'MAA', '2026-03-20 08:40:00', '2026-03-20 10:55:00', 5399, 'Air India',  'AI 543',  'Economy', 20),
('BOM', 'MAA', '2026-03-20 11:00:00', '2026-03-20 13:15:00', 3599, 'SpiceJet',   'SG 716',  'Economy', 72),
('BOM', 'MAA', '2026-03-20 15:20:00', '2026-03-20 17:35:00', 7199, 'Vistara',    'UK 890',  'Business', 7),
('BOM', 'MAA', '2026-03-20 20:00:00', '2026-03-20 22:10:00', 4499, 'IndiGo',    '6E 882',  'Economy', 29);

-- ============================================================
-- ROUTE 6: Hyderabad (HYD) → Delhi (DEL)
-- ============================================================
INSERT INTO "Flight" (source, destination, departure_time, arrival_time, fare, airline, flight_no, class, seats_available) VALUES
('HYD', 'DEL', '2026-03-20 06:00:00', '2026-03-20 08:25:00', 3899, 'IndiGo',    '6E 718',  'Economy', 62),
('HYD', 'DEL', '2026-03-20 09:30:00', '2026-03-20 11:55:00', 5799, 'Air India',  'AI 407',  'Economy', 17),
('HYD', 'DEL', '2026-03-20 12:45:00', '2026-03-20 15:10:00', 3499, 'SpiceJet',   'SG 119',  'Economy', 58),
('HYD', 'DEL', '2026-03-20 16:00:00', '2026-03-20 18:25:00', 8199, 'Vistara',    'UK 572',  'Business', 9),
('HYD', 'DEL', '2026-03-20 20:15:00', '2026-03-20 22:40:00', 3299, 'GoAir',      'G8 504',  'Economy', 41);

-- ============================================================
-- ROUTE 7: Kolkata (CCU) → Mumbai (BOM)
-- ============================================================
INSERT INTO "Flight" (source, destination, departure_time, arrival_time, fare, airline, flight_no, class, seats_available) VALUES
('CCU', 'BOM', '2026-03-20 06:45:00', '2026-03-20 09:35:00', 4599, 'IndiGo',    '6E 6098', 'Economy', 37),
('CCU', 'BOM', '2026-03-20 08:00:00', '2026-03-20 10:55:00', 6299, 'Air India',  'AI 761',  'Economy', 23),
('CCU', 'BOM', '2026-03-20 11:30:00', '2026-03-20 14:20:00', 3999, 'SpiceJet',   'SG 624',  'Economy', 50),
('CCU', 'BOM', '2026-03-20 15:00:00', '2026-03-20 17:55:00', 9199, 'Vistara',    'UK 765',  'Business', 3),
('CCU', 'BOM', '2026-03-20 19:30:00', '2026-03-20 22:20:00', 4799, 'IndiGo',    '6E 6102', 'Economy', 28);

-- ============================================================
-- Done! 35 flights across 7 routes, all on 2026-03-20.
-- Test in the app: From = Delhi, To = Mumbai, Date = 2026-03-20
-- ============================================================
