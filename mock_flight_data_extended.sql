-- Extended mock flight data: 2026-03-27 to 2026-04-10
-- 7 routes x 5 flights x 15 days = 525 rows

-- ---- 2026-03-27 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-03-27 05:55:00','2026-03-27 08:45:00',4653,'IndiGo','6E 2228','Economy',35),
('MAA','BOM','2026-03-27 06:00:00','2026-03-27 08:55:00',4924,'Air India','AI 2896','Economy',16),
('MAA','BOM','2026-03-27 09:15:00','2026-03-27 12:10:00',3849,'SpiceJet','SG 8167','Economy',62),
('MAA','BOM','2026-03-27 14:30:00','2026-03-27 17:20:00',6641,'Vistara','UK 872','Business',1),
('MAA','BOM','2026-03-27 19:45:00','2026-03-27 22:35:00',5391,'Air India','AI 660','Economy',38);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-03-27 06:00:00','2026-03-27 08:05:00',3588,'IndiGo','6E 444','Economy',63),
('DEL','BOM','2026-03-27 07:30:00','2026-03-27 09:40:00',5731,'Air India','AI 101','Business',3),
('DEL','BOM','2026-03-27 10:20:00','2026-03-27 12:25:00',3229,'SpiceJet','SG 161','Economy',62),
('DEL','BOM','2026-03-27 13:15:00','2026-03-27 15:20:00',7222,'Vistara','UK 976','Business',3),
('DEL','BOM','2026-03-27 18:00:00','2026-03-27 20:10:00',3516,'GoAir','G8 311','Economy',57);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-03-27 05:30:00','2026-03-27 08:15:00',3926,'IndiGo','6E 2001','Economy',67),
('DEL','BLR','2026-03-27 07:00:00','2026-03-27 09:50:00',5802,'Air India','AI 501','Economy',32),
('DEL','BLR','2026-03-27 12:00:00','2026-03-27 14:45:00',8757,'Vistara','UK 810','Business',8),
('DEL','BLR','2026-03-27 15:30:00','2026-03-27 18:20:00',3724,'SpiceJet','SG 233','Economy',48),
('DEL','BLR','2026-03-27 20:45:00','2026-03-27 23:30:00',4402,'IndiGo','6E 2555','Economy',31);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-03-27 06:10:00','2026-03-27 09:05:00',4005,'IndiGo','6E 2002','Economy',45),
('BLR','DEL','2026-03-27 09:00:00','2026-03-27 12:00:00',6331,'Air India','AI 502','Economy',15),
('BLR','DEL','2026-03-27 13:00:00','2026-03-27 16:00:00',8783,'Vistara','UK 811','Business',1),
('BLR','DEL','2026-03-27 16:45:00','2026-03-27 19:40:00',3919,'SpiceJet','SG 234','Economy',38),
('BLR','DEL','2026-03-27 21:00:00','2026-03-27 23:55:00',3503,'GoAir','G8 402','Economy',47);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-03-27 05:35:00','2026-03-27 07:45:00',4088,'IndiGo','6E 341','Economy',41),
('BOM','MAA','2026-03-27 08:40:00','2026-03-27 10:55:00',5466,'Air India','AI 543','Economy',21),
('BOM','MAA','2026-03-27 11:00:00','2026-03-27 13:15:00',3917,'SpiceJet','SG 716','Economy',70),
('BOM','MAA','2026-03-27 15:20:00','2026-03-27 17:35:00',6943,'Vistara','UK 890','Business',11),
('BOM','MAA','2026-03-27 20:00:00','2026-03-27 22:10:00',4748,'IndiGo','6E 882','Economy',22);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-03-27 06:00:00','2026-03-27 08:25:00',3986,'IndiGo','6E 718','Economy',54),
('HYD','DEL','2026-03-27 09:30:00','2026-03-27 11:55:00',6064,'Air India','AI 407','Economy',16),
('HYD','DEL','2026-03-27 12:45:00','2026-03-27 15:10:00',3842,'SpiceJet','SG 119','Economy',67),
('HYD','DEL','2026-03-27 16:00:00','2026-03-27 18:25:00',8269,'Vistara','UK 572','Business',17),
('HYD','DEL','2026-03-27 20:15:00','2026-03-27 22:40:00',3195,'GoAir','G8 504','Economy',33);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-03-27 06:45:00','2026-03-27 09:35:00',4345,'IndiGo','6E 6098','Economy',34),
('CCU','BOM','2026-03-27 08:00:00','2026-03-27 10:55:00',6295,'Air India','AI 761','Economy',15),
('CCU','BOM','2026-03-27 11:30:00','2026-03-27 14:20:00',3937,'SpiceJet','SG 624','Economy',43),
('CCU','BOM','2026-03-27 15:00:00','2026-03-27 17:55:00',9288,'Vistara','UK 765','Business',1),
('CCU','BOM','2026-03-27 19:30:00','2026-03-27 22:20:00',4963,'IndiGo','6E 6102','Economy',38);
-- ---- 2026-03-28 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-03-28 05:55:00','2026-03-28 08:45:00',4372,'IndiGo','6E 2228','Economy',37),
('MAA','BOM','2026-03-28 06:00:00','2026-03-28 08:55:00',5278,'Air India','AI 2896','Economy',19),
('MAA','BOM','2026-03-28 09:15:00','2026-03-28 12:10:00',3813,'SpiceJet','SG 8167','Economy',63),
('MAA','BOM','2026-03-28 14:30:00','2026-03-28 17:20:00',7198,'Vistara','UK 872','Business',18),
('MAA','BOM','2026-03-28 19:45:00','2026-03-28 22:35:00',4772,'Air India','AI 660','Economy',40);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-03-28 06:00:00','2026-03-28 08:05:00',4149,'IndiGo','6E 444','Economy',50),
('DEL','BOM','2026-03-28 07:30:00','2026-03-28 09:40:00',5845,'Air India','AI 101','Business',9),
('DEL','BOM','2026-03-28 10:20:00','2026-03-28 12:25:00',3366,'SpiceJet','SG 161','Economy',74),
('DEL','BOM','2026-03-28 13:15:00','2026-03-28 15:20:00',7387,'Vistara','UK 976','Business',4),
('DEL','BOM','2026-03-28 18:00:00','2026-03-28 20:10:00',3654,'GoAir','G8 311','Economy',55);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-03-28 05:30:00','2026-03-28 08:15:00',4123,'IndiGo','6E 2001','Economy',60),
('DEL','BLR','2026-03-28 07:00:00','2026-03-28 09:50:00',5656,'Air India','AI 501','Economy',19),
('DEL','BLR','2026-03-28 12:00:00','2026-03-28 14:45:00',8231,'Vistara','UK 810','Business',5),
('DEL','BLR','2026-03-28 15:30:00','2026-03-28 18:20:00',3909,'SpiceJet','SG 233','Economy',42),
('DEL','BLR','2026-03-28 20:45:00','2026-03-28 23:30:00',3866,'IndiGo','6E 2555','Economy',29);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-03-28 06:10:00','2026-03-28 09:05:00',4579,'IndiGo','6E 2002','Economy',50),
('BLR','DEL','2026-03-28 09:00:00','2026-03-28 12:00:00',6116,'Air India','AI 502','Economy',25),
('BLR','DEL','2026-03-28 13:00:00','2026-03-28 16:00:00',9010,'Vistara','UK 811','Business',6),
('BLR','DEL','2026-03-28 16:45:00','2026-03-28 19:40:00',4357,'SpiceJet','SG 234','Economy',42),
('BLR','DEL','2026-03-28 21:00:00','2026-03-28 23:55:00',3545,'GoAir','G8 402','Economy',53);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-03-28 05:35:00','2026-03-28 07:45:00',3841,'IndiGo','6E 341','Economy',45),
('BOM','MAA','2026-03-28 08:40:00','2026-03-28 10:55:00',5673,'Air India','AI 543','Economy',27),
('BOM','MAA','2026-03-28 11:00:00','2026-03-28 13:15:00',3568,'SpiceJet','SG 716','Economy',80),
('BOM','MAA','2026-03-28 15:20:00','2026-03-28 17:35:00',7337,'Vistara','UK 890','Business',15),
('BOM','MAA','2026-03-28 20:00:00','2026-03-28 22:10:00',4607,'IndiGo','6E 882','Economy',30);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-03-28 06:00:00','2026-03-28 08:25:00',3823,'IndiGo','6E 718','Economy',56),
('HYD','DEL','2026-03-28 09:30:00','2026-03-28 11:55:00',6020,'Air India','AI 407','Economy',22),
('HYD','DEL','2026-03-28 12:45:00','2026-03-28 15:10:00',3292,'SpiceJet','SG 119','Economy',49),
('HYD','DEL','2026-03-28 16:00:00','2026-03-28 18:25:00',8011,'Vistara','UK 572','Business',3),
('HYD','DEL','2026-03-28 20:15:00','2026-03-28 22:40:00',3641,'GoAir','G8 504','Economy',36);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-03-28 06:45:00','2026-03-28 09:35:00',4995,'IndiGo','6E 6098','Economy',40),
('CCU','BOM','2026-03-28 08:00:00','2026-03-28 10:55:00',6609,'Air India','AI 761','Economy',15),
('CCU','BOM','2026-03-28 11:30:00','2026-03-28 14:20:00',4093,'SpiceJet','SG 624','Economy',52),
('CCU','BOM','2026-03-28 15:00:00','2026-03-28 17:55:00',9509,'Vistara','UK 765','Business',7),
('CCU','BOM','2026-03-28 19:30:00','2026-03-28 22:20:00',5040,'IndiGo','6E 6102','Economy',26);
-- ---- 2026-03-29 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-03-29 05:55:00','2026-03-29 08:45:00',4565,'IndiGo','6E 2228','Economy',32),
('MAA','BOM','2026-03-29 06:00:00','2026-03-29 08:55:00',5595,'Air India','AI 2896','Economy',11),
('MAA','BOM','2026-03-29 09:15:00','2026-03-29 12:10:00',4297,'SpiceJet','SG 8167','Economy',72),
('MAA','BOM','2026-03-29 14:30:00','2026-03-29 17:20:00',6772,'Vistara','UK 872','Business',18),
('MAA','BOM','2026-03-29 19:45:00','2026-03-29 22:35:00',5047,'Air India','AI 660','Economy',24);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-03-29 06:00:00','2026-03-29 08:05:00',3799,'IndiGo','6E 444','Economy',58),
('DEL','BOM','2026-03-29 07:30:00','2026-03-29 09:40:00',5460,'Air India','AI 101','Business',16),
('DEL','BOM','2026-03-29 10:20:00','2026-03-29 12:25:00',3202,'SpiceJet','SG 161','Economy',68),
('DEL','BOM','2026-03-29 13:15:00','2026-03-29 15:20:00',7511,'Vistara','UK 976','Business',1),
('DEL','BOM','2026-03-29 18:00:00','2026-03-29 20:10:00',3518,'GoAir','G8 311','Economy',41);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-03-29 05:30:00','2026-03-29 08:15:00',4539,'IndiGo','6E 2001','Economy',59),
('DEL','BLR','2026-03-29 07:00:00','2026-03-29 09:50:00',6253,'Air India','AI 501','Economy',28),
('DEL','BLR','2026-03-29 12:00:00','2026-03-29 14:45:00',8822,'Vistara','UK 810','Business',1),
('DEL','BLR','2026-03-29 15:30:00','2026-03-29 18:20:00',3655,'SpiceJet','SG 233','Economy',45),
('DEL','BLR','2026-03-29 20:45:00','2026-03-29 23:30:00',3964,'IndiGo','6E 2555','Economy',40);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-03-29 06:10:00','2026-03-29 09:05:00',4542,'IndiGo','6E 2002','Economy',40),
('BLR','DEL','2026-03-29 09:00:00','2026-03-29 12:00:00',6512,'Air India','AI 502','Economy',15),
('BLR','DEL','2026-03-29 13:00:00','2026-03-29 16:00:00',8999,'Vistara','UK 811','Business',1),
('BLR','DEL','2026-03-29 16:45:00','2026-03-29 19:40:00',3813,'SpiceJet','SG 234','Economy',39),
('BLR','DEL','2026-03-29 21:00:00','2026-03-29 23:55:00',3713,'GoAir','G8 402','Economy',52);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-03-29 05:35:00','2026-03-29 07:45:00',3758,'IndiGo','6E 341','Economy',45),
('BOM','MAA','2026-03-29 08:40:00','2026-03-29 10:55:00',5679,'Air India','AI 543','Economy',12),
('BOM','MAA','2026-03-29 11:00:00','2026-03-29 13:15:00',3386,'SpiceJet','SG 716','Economy',77),
('BOM','MAA','2026-03-29 15:20:00','2026-03-29 17:35:00',6969,'Vistara','UK 890','Business',14),
('BOM','MAA','2026-03-29 20:00:00','2026-03-29 22:10:00',4327,'IndiGo','6E 882','Economy',23);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-03-29 06:00:00','2026-03-29 08:25:00',4274,'IndiGo','6E 718','Economy',67),
('HYD','DEL','2026-03-29 09:30:00','2026-03-29 11:55:00',6061,'Air India','AI 407','Economy',12),
('HYD','DEL','2026-03-29 12:45:00','2026-03-29 15:10:00',3470,'SpiceJet','SG 119','Economy',64),
('HYD','DEL','2026-03-29 16:00:00','2026-03-29 18:25:00',8520,'Vistara','UK 572','Business',12),
('HYD','DEL','2026-03-29 20:15:00','2026-03-29 22:40:00',3215,'GoAir','G8 504','Economy',48);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-03-29 06:45:00','2026-03-29 09:35:00',4504,'IndiGo','6E 6098','Economy',36),
('CCU','BOM','2026-03-29 08:00:00','2026-03-29 10:55:00',6407,'Air India','AI 761','Economy',33),
('CCU','BOM','2026-03-29 11:30:00','2026-03-29 14:20:00',4081,'SpiceJet','SG 624','Economy',54),
('CCU','BOM','2026-03-29 15:00:00','2026-03-29 17:55:00',9428,'Vistara','UK 765','Business',7),
('CCU','BOM','2026-03-29 19:30:00','2026-03-29 22:20:00',4622,'IndiGo','6E 6102','Economy',25);
-- ---- 2026-03-30 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-03-30 05:55:00','2026-03-30 08:45:00',4229,'IndiGo','6E 2228','Economy',34),
('MAA','BOM','2026-03-30 06:00:00','2026-03-30 08:55:00',5245,'Air India','AI 2896','Economy',8),
('MAA','BOM','2026-03-30 09:15:00','2026-03-30 12:10:00',4201,'SpiceJet','SG 8167','Economy',72),
('MAA','BOM','2026-03-30 14:30:00','2026-03-30 17:20:00',6734,'Vistara','UK 872','Business',16),
('MAA','BOM','2026-03-30 19:45:00','2026-03-30 22:35:00',4924,'Air India','AI 660','Economy',21);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-03-30 06:00:00','2026-03-30 08:05:00',3571,'IndiGo','6E 444','Economy',65),
('DEL','BOM','2026-03-30 07:30:00','2026-03-30 09:40:00',5359,'Air India','AI 101','Business',9),
('DEL','BOM','2026-03-30 10:20:00','2026-03-30 12:25:00',3268,'SpiceJet','SG 161','Economy',61),
('DEL','BOM','2026-03-30 13:15:00','2026-03-30 15:20:00',7337,'Vistara','UK 976','Business',1),
('DEL','BOM','2026-03-30 18:00:00','2026-03-30 20:10:00',3525,'GoAir','G8 311','Economy',45);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-03-30 05:30:00','2026-03-30 08:15:00',4184,'IndiGo','6E 2001','Economy',65),
('DEL','BLR','2026-03-30 07:00:00','2026-03-30 09:50:00',5818,'Air India','AI 501','Economy',29),
('DEL','BLR','2026-03-30 12:00:00','2026-03-30 14:45:00',8334,'Vistara','UK 810','Business',13),
('DEL','BLR','2026-03-30 15:30:00','2026-03-30 18:20:00',4089,'SpiceJet','SG 233','Economy',49),
('DEL','BLR','2026-03-30 20:45:00','2026-03-30 23:30:00',4047,'IndiGo','6E 2555','Economy',38);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-03-30 06:10:00','2026-03-30 09:05:00',4415,'IndiGo','6E 2002','Economy',46),
('BLR','DEL','2026-03-30 09:00:00','2026-03-30 12:00:00',5995,'Air India','AI 502','Economy',8),
('BLR','DEL','2026-03-30 13:00:00','2026-03-30 16:00:00',9173,'Vistara','UK 811','Business',7),
('BLR','DEL','2026-03-30 16:45:00','2026-03-30 19:40:00',4061,'SpiceJet','SG 234','Economy',41),
('BLR','DEL','2026-03-30 21:00:00','2026-03-30 23:55:00',3819,'GoAir','G8 402','Economy',59);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-03-30 05:35:00','2026-03-30 07:45:00',3754,'IndiGo','6E 341','Economy',58),
('BOM','MAA','2026-03-30 08:40:00','2026-03-30 10:55:00',5760,'Air India','AI 543','Economy',13),
('BOM','MAA','2026-03-30 11:00:00','2026-03-30 13:15:00',3361,'SpiceJet','SG 716','Economy',74),
('BOM','MAA','2026-03-30 15:20:00','2026-03-30 17:35:00',7246,'Vistara','UK 890','Business',1),
('BOM','MAA','2026-03-30 20:00:00','2026-03-30 22:10:00',4453,'IndiGo','6E 882','Economy',25);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-03-30 06:00:00','2026-03-30 08:25:00',3793,'IndiGo','6E 718','Economy',69),
('HYD','DEL','2026-03-30 09:30:00','2026-03-30 11:55:00',5958,'Air India','AI 407','Economy',11),
('HYD','DEL','2026-03-30 12:45:00','2026-03-30 15:10:00',3631,'SpiceJet','SG 119','Economy',53),
('HYD','DEL','2026-03-30 16:00:00','2026-03-30 18:25:00',8184,'Vistara','UK 572','Business',13),
('HYD','DEL','2026-03-30 20:15:00','2026-03-30 22:40:00',3254,'GoAir','G8 504','Economy',33);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-03-30 06:45:00','2026-03-30 09:35:00',4752,'IndiGo','6E 6098','Economy',44),
('CCU','BOM','2026-03-30 08:00:00','2026-03-30 10:55:00',6099,'Air India','AI 761','Economy',14),
('CCU','BOM','2026-03-30 11:30:00','2026-03-30 14:20:00',4366,'SpiceJet','SG 624','Economy',57),
('CCU','BOM','2026-03-30 15:00:00','2026-03-30 17:55:00',8914,'Vistara','UK 765','Business',1),
('CCU','BOM','2026-03-30 19:30:00','2026-03-30 22:20:00',4741,'IndiGo','6E 6102','Economy',23);
-- ---- 2026-03-31 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-03-31 05:55:00','2026-03-31 08:45:00',4415,'IndiGo','6E 2228','Economy',47),
('MAA','BOM','2026-03-31 06:00:00','2026-03-31 08:55:00',5391,'Air India','AI 2896','Economy',14),
('MAA','BOM','2026-03-31 09:15:00','2026-03-31 12:10:00',4009,'SpiceJet','SG 8167','Economy',56),
('MAA','BOM','2026-03-31 14:30:00','2026-03-31 17:20:00',6667,'Vistara','UK 872','Business',10),
('MAA','BOM','2026-03-31 19:45:00','2026-03-31 22:35:00',4701,'Air India','AI 660','Economy',33);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-03-31 06:00:00','2026-03-31 08:05:00',3770,'IndiGo','6E 444','Economy',59),
('DEL','BOM','2026-03-31 07:30:00','2026-03-31 09:40:00',5591,'Air India','AI 101','Business',15),
('DEL','BOM','2026-03-31 10:20:00','2026-03-31 12:25:00',3768,'SpiceJet','SG 161','Economy',75),
('DEL','BOM','2026-03-31 13:15:00','2026-03-31 15:20:00',7157,'Vistara','UK 976','Business',2),
('DEL','BOM','2026-03-31 18:00:00','2026-03-31 20:10:00',3302,'GoAir','G8 311','Economy',44);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-03-31 05:30:00','2026-03-31 08:15:00',3958,'IndiGo','6E 2001','Economy',68),
('DEL','BLR','2026-03-31 07:00:00','2026-03-31 09:50:00',6154,'Air India','AI 501','Economy',13),
('DEL','BLR','2026-03-31 12:00:00','2026-03-31 14:45:00',8520,'Vistara','UK 810','Business',1),
('DEL','BLR','2026-03-31 15:30:00','2026-03-31 18:20:00',3550,'SpiceJet','SG 233','Economy',52),
('DEL','BLR','2026-03-31 20:45:00','2026-03-31 23:30:00',4287,'IndiGo','6E 2555','Economy',39);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-03-31 06:10:00','2026-03-31 09:05:00',4542,'IndiGo','6E 2002','Economy',45),
('BLR','DEL','2026-03-31 09:00:00','2026-03-31 12:00:00',5957,'Air India','AI 502','Economy',21),
('BLR','DEL','2026-03-31 13:00:00','2026-03-31 16:00:00',8581,'Vistara','UK 811','Business',1),
('BLR','DEL','2026-03-31 16:45:00','2026-03-31 19:40:00',3769,'SpiceJet','SG 234','Economy',47),
('BLR','DEL','2026-03-31 21:00:00','2026-03-31 23:55:00',3468,'GoAir','G8 402','Economy',52);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-03-31 05:35:00','2026-03-31 07:45:00',4112,'IndiGo','6E 341','Economy',41),
('BOM','MAA','2026-03-31 08:40:00','2026-03-31 10:55:00',5682,'Air India','AI 543','Economy',17),
('BOM','MAA','2026-03-31 11:00:00','2026-03-31 13:15:00',3891,'SpiceJet','SG 716','Economy',81),
('BOM','MAA','2026-03-31 15:20:00','2026-03-31 17:35:00',6939,'Vistara','UK 890','Business',16),
('BOM','MAA','2026-03-31 20:00:00','2026-03-31 22:10:00',4282,'IndiGo','6E 882','Economy',32);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-03-31 06:00:00','2026-03-31 08:25:00',4272,'IndiGo','6E 718','Economy',70),
('HYD','DEL','2026-03-31 09:30:00','2026-03-31 11:55:00',6077,'Air India','AI 407','Economy',23),
('HYD','DEL','2026-03-31 12:45:00','2026-03-31 15:10:00',3522,'SpiceJet','SG 119','Economy',56),
('HYD','DEL','2026-03-31 16:00:00','2026-03-31 18:25:00',8108,'Vistara','UK 572','Business',9),
('HYD','DEL','2026-03-31 20:15:00','2026-03-31 22:40:00',3243,'GoAir','G8 504','Economy',39);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-03-31 06:45:00','2026-03-31 09:35:00',4704,'IndiGo','6E 6098','Economy',31),
('CCU','BOM','2026-03-31 08:00:00','2026-03-31 10:55:00',6686,'Air India','AI 761','Economy',33),
('CCU','BOM','2026-03-31 11:30:00','2026-03-31 14:20:00',4006,'SpiceJet','SG 624','Economy',54),
('CCU','BOM','2026-03-31 15:00:00','2026-03-31 17:55:00',9222,'Vistara','UK 765','Business',1),
('CCU','BOM','2026-03-31 19:30:00','2026-03-31 22:20:00',4508,'IndiGo','6E 6102','Economy',32);
-- ---- 2026-04-01 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-01 05:55:00','2026-04-01 08:45:00',4635,'IndiGo','6E 2228','Economy',50),
('MAA','BOM','2026-04-01 06:00:00','2026-04-01 08:55:00',5001,'Air India','AI 2896','Economy',10),
('MAA','BOM','2026-04-01 09:15:00','2026-04-01 12:10:00',4149,'SpiceJet','SG 8167','Economy',61),
('MAA','BOM','2026-04-01 14:30:00','2026-04-01 17:20:00',7017,'Vistara','UK 872','Business',6),
('MAA','BOM','2026-04-01 19:45:00','2026-04-01 22:35:00',4834,'Air India','AI 660','Economy',32);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-01 06:00:00','2026-04-01 08:05:00',3569,'IndiGo','6E 444','Economy',52),
('DEL','BOM','2026-04-01 07:30:00','2026-04-01 09:40:00',5677,'Air India','AI 101','Business',11),
('DEL','BOM','2026-04-01 10:20:00','2026-04-01 12:25:00',3360,'SpiceJet','SG 161','Economy',74),
('DEL','BOM','2026-04-01 13:15:00','2026-04-01 15:20:00',7555,'Vistara','UK 976','Business',5),
('DEL','BOM','2026-04-01 18:00:00','2026-04-01 20:10:00',3625,'GoAir','G8 311','Economy',58);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-01 05:30:00','2026-04-01 08:15:00',4440,'IndiGo','6E 2001','Economy',50),
('DEL','BLR','2026-04-01 07:00:00','2026-04-01 09:50:00',6282,'Air India','AI 501','Economy',29),
('DEL','BLR','2026-04-01 12:00:00','2026-04-01 14:45:00',8505,'Vistara','UK 810','Business',1),
('DEL','BLR','2026-04-01 15:30:00','2026-04-01 18:20:00',3636,'SpiceJet','SG 233','Economy',42),
('DEL','BLR','2026-04-01 20:45:00','2026-04-01 23:30:00',3917,'IndiGo','6E 2555','Economy',26);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-01 06:10:00','2026-04-01 09:05:00',4565,'IndiGo','6E 2002','Economy',44),
('BLR','DEL','2026-04-01 09:00:00','2026-04-01 12:00:00',6177,'Air India','AI 502','Economy',14),
('BLR','DEL','2026-04-01 13:00:00','2026-04-01 16:00:00',9118,'Vistara','UK 811','Business',1),
('BLR','DEL','2026-04-01 16:45:00','2026-04-01 19:40:00',4050,'SpiceJet','SG 234','Economy',34),
('BLR','DEL','2026-04-01 21:00:00','2026-04-01 23:55:00',4048,'GoAir','G8 402','Economy',53);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-01 05:35:00','2026-04-01 07:45:00',4216,'IndiGo','6E 341','Economy',53),
('BOM','MAA','2026-04-01 08:40:00','2026-04-01 10:55:00',5356,'Air India','AI 543','Economy',11),
('BOM','MAA','2026-04-01 11:00:00','2026-04-01 13:15:00',3393,'SpiceJet','SG 716','Economy',82),
('BOM','MAA','2026-04-01 15:20:00','2026-04-01 17:35:00',7332,'Vistara','UK 890','Business',5),
('BOM','MAA','2026-04-01 20:00:00','2026-04-01 22:10:00',4244,'IndiGo','6E 882','Economy',19);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-01 06:00:00','2026-04-01 08:25:00',3940,'IndiGo','6E 718','Economy',56),
('HYD','DEL','2026-04-01 09:30:00','2026-04-01 11:55:00',6151,'Air India','AI 407','Economy',15),
('HYD','DEL','2026-04-01 12:45:00','2026-04-01 15:10:00',3364,'SpiceJet','SG 119','Economy',62),
('HYD','DEL','2026-04-01 16:00:00','2026-04-01 18:25:00',8463,'Vistara','UK 572','Business',12),
('HYD','DEL','2026-04-01 20:15:00','2026-04-01 22:40:00',3573,'GoAir','G8 504','Economy',31);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-01 06:45:00','2026-04-01 09:35:00',4413,'IndiGo','6E 6098','Economy',29),
('CCU','BOM','2026-04-01 08:00:00','2026-04-01 10:55:00',6151,'Air India','AI 761','Economy',30),
('CCU','BOM','2026-04-01 11:30:00','2026-04-01 14:20:00',3735,'SpiceJet','SG 624','Economy',51),
('CCU','BOM','2026-04-01 15:00:00','2026-04-01 17:55:00',9495,'Vistara','UK 765','Business',10),
('CCU','BOM','2026-04-01 19:30:00','2026-04-01 22:20:00',4650,'IndiGo','6E 6102','Economy',31);
-- ---- 2026-04-02 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-02 05:55:00','2026-04-02 08:45:00',4129,'IndiGo','6E 2228','Economy',33),
('MAA','BOM','2026-04-02 06:00:00','2026-04-02 08:55:00',5214,'Air India','AI 2896','Economy',19),
('MAA','BOM','2026-04-02 09:15:00','2026-04-02 12:10:00',3639,'SpiceJet','SG 8167','Economy',66),
('MAA','BOM','2026-04-02 14:30:00','2026-04-02 17:20:00',6714,'Vistara','UK 872','Business',5),
('MAA','BOM','2026-04-02 19:45:00','2026-04-02 22:35:00',5381,'Air India','AI 660','Economy',24);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-02 06:00:00','2026-04-02 08:05:00',3861,'IndiGo','6E 444','Economy',62),
('DEL','BOM','2026-04-02 07:30:00','2026-04-02 09:40:00',5715,'Air India','AI 101','Business',21),
('DEL','BOM','2026-04-02 10:20:00','2026-04-02 12:25:00',3357,'SpiceJet','SG 161','Economy',67),
('DEL','BOM','2026-04-02 13:15:00','2026-04-02 15:20:00',7165,'Vistara','UK 976','Business',1),
('DEL','BOM','2026-04-02 18:00:00','2026-04-02 20:10:00',3421,'GoAir','G8 311','Economy',38);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-02 05:30:00','2026-04-02 08:15:00',4082,'IndiGo','6E 2001','Economy',60),
('DEL','BLR','2026-04-02 07:00:00','2026-04-02 09:50:00',6020,'Air India','AI 501','Economy',19),
('DEL','BLR','2026-04-02 12:00:00','2026-04-02 14:45:00',8472,'Vistara','UK 810','Business',1),
('DEL','BLR','2026-04-02 15:30:00','2026-04-02 18:20:00',3609,'SpiceJet','SG 233','Economy',46),
('DEL','BLR','2026-04-02 20:45:00','2026-04-02 23:30:00',3838,'IndiGo','6E 2555','Economy',38);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-02 06:10:00','2026-04-02 09:05:00',4226,'IndiGo','6E 2002','Economy',46),
('BLR','DEL','2026-04-02 09:00:00','2026-04-02 12:00:00',6370,'Air India','AI 502','Economy',16),
('BLR','DEL','2026-04-02 13:00:00','2026-04-02 16:00:00',8811,'Vistara','UK 811','Business',1),
('BLR','DEL','2026-04-02 16:45:00','2026-04-02 19:40:00',3927,'SpiceJet','SG 234','Economy',28),
('BLR','DEL','2026-04-02 21:00:00','2026-04-02 23:55:00',4074,'GoAir','G8 402','Economy',51);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-02 05:35:00','2026-04-02 07:45:00',4107,'IndiGo','6E 341','Economy',48),
('BOM','MAA','2026-04-02 08:40:00','2026-04-02 10:55:00',5384,'Air India','AI 543','Economy',12),
('BOM','MAA','2026-04-02 11:00:00','2026-04-02 13:15:00',3584,'SpiceJet','SG 716','Economy',73),
('BOM','MAA','2026-04-02 15:20:00','2026-04-02 17:35:00',7555,'Vistara','UK 890','Business',13),
('BOM','MAA','2026-04-02 20:00:00','2026-04-02 22:10:00',4608,'IndiGo','6E 882','Economy',36);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-02 06:00:00','2026-04-02 08:25:00',3938,'IndiGo','6E 718','Economy',52),
('HYD','DEL','2026-04-02 09:30:00','2026-04-02 11:55:00',5617,'Air India','AI 407','Economy',15),
('HYD','DEL','2026-04-02 12:45:00','2026-04-02 15:10:00',3381,'SpiceJet','SG 119','Economy',66),
('HYD','DEL','2026-04-02 16:00:00','2026-04-02 18:25:00',8170,'Vistara','UK 572','Business',1),
('HYD','DEL','2026-04-02 20:15:00','2026-04-02 22:40:00',3110,'GoAir','G8 504','Economy',50);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-02 06:45:00','2026-04-02 09:35:00',4743,'IndiGo','6E 6098','Economy',38),
('CCU','BOM','2026-04-02 08:00:00','2026-04-02 10:55:00',6320,'Air India','AI 761','Economy',26),
('CCU','BOM','2026-04-02 11:30:00','2026-04-02 14:20:00',4319,'SpiceJet','SG 624','Economy',56),
('CCU','BOM','2026-04-02 15:00:00','2026-04-02 17:55:00',9017,'Vistara','UK 765','Business',5),
('CCU','BOM','2026-04-02 19:30:00','2026-04-02 22:20:00',5089,'IndiGo','6E 6102','Economy',24);
-- ---- 2026-04-03 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-03 05:55:00','2026-04-03 08:45:00',4259,'IndiGo','6E 2228','Economy',33),
('MAA','BOM','2026-04-03 06:00:00','2026-04-03 08:55:00',5345,'Air India','AI 2896','Economy',8),
('MAA','BOM','2026-04-03 09:15:00','2026-04-03 12:10:00',4131,'SpiceJet','SG 8167','Economy',72),
('MAA','BOM','2026-04-03 14:30:00','2026-04-03 17:20:00',7185,'Vistara','UK 872','Business',4),
('MAA','BOM','2026-04-03 19:45:00','2026-04-03 22:35:00',5071,'Air India','AI 660','Economy',34);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-03 06:00:00','2026-04-03 08:05:00',3570,'IndiGo','6E 444','Economy',55),
('DEL','BOM','2026-04-03 07:30:00','2026-04-03 09:40:00',5937,'Air India','AI 101','Business',12),
('DEL','BOM','2026-04-03 10:20:00','2026-04-03 12:25:00',3878,'SpiceJet','SG 161','Economy',63),
('DEL','BOM','2026-04-03 13:15:00','2026-04-03 15:20:00',7306,'Vistara','UK 976','Business',12),
('DEL','BOM','2026-04-03 18:00:00','2026-04-03 20:10:00',3315,'GoAir','G8 311','Economy',51);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-03 05:30:00','2026-04-03 08:15:00',4233,'IndiGo','6E 2001','Economy',62),
('DEL','BLR','2026-04-03 07:00:00','2026-04-03 09:50:00',5901,'Air India','AI 501','Economy',29),
('DEL','BLR','2026-04-03 12:00:00','2026-04-03 14:45:00',8329,'Vistara','UK 810','Business',1),
('DEL','BLR','2026-04-03 15:30:00','2026-04-03 18:20:00',3929,'SpiceJet','SG 233','Economy',46),
('DEL','BLR','2026-04-03 20:45:00','2026-04-03 23:30:00',4492,'IndiGo','6E 2555','Economy',28);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-03 06:10:00','2026-04-03 09:05:00',4629,'IndiGo','6E 2002','Economy',58),
('BLR','DEL','2026-04-03 09:00:00','2026-04-03 12:00:00',6207,'Air India','AI 502','Economy',17),
('BLR','DEL','2026-04-03 13:00:00','2026-04-03 16:00:00',9060,'Vistara','UK 811','Business',1),
('BLR','DEL','2026-04-03 16:45:00','2026-04-03 19:40:00',4010,'SpiceJet','SG 234','Economy',37),
('BLR','DEL','2026-04-03 21:00:00','2026-04-03 23:55:00',3614,'GoAir','G8 402','Economy',58);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-03 05:35:00','2026-04-03 07:45:00',4292,'IndiGo','6E 341','Economy',57),
('BOM','MAA','2026-04-03 08:40:00','2026-04-03 10:55:00',5769,'Air India','AI 543','Economy',20),
('BOM','MAA','2026-04-03 11:00:00','2026-04-03 13:15:00',3775,'SpiceJet','SG 716','Economy',76),
('BOM','MAA','2026-04-03 15:20:00','2026-04-03 17:35:00',7351,'Vistara','UK 890','Business',3),
('BOM','MAA','2026-04-03 20:00:00','2026-04-03 22:10:00',4722,'IndiGo','6E 882','Economy',34);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-03 06:00:00','2026-04-03 08:25:00',3772,'IndiGo','6E 718','Economy',54),
('HYD','DEL','2026-04-03 09:30:00','2026-04-03 11:55:00',5789,'Air India','AI 407','Economy',23),
('HYD','DEL','2026-04-03 12:45:00','2026-04-03 15:10:00',3878,'SpiceJet','SG 119','Economy',68),
('HYD','DEL','2026-04-03 16:00:00','2026-04-03 18:25:00',8533,'Vistara','UK 572','Business',9),
('HYD','DEL','2026-04-03 20:15:00','2026-04-03 22:40:00',3094,'GoAir','G8 504','Economy',38);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-03 06:45:00','2026-04-03 09:35:00',4987,'IndiGo','6E 6098','Economy',36),
('CCU','BOM','2026-04-03 08:00:00','2026-04-03 10:55:00',6229,'Air India','AI 761','Economy',19),
('CCU','BOM','2026-04-03 11:30:00','2026-04-03 14:20:00',3849,'SpiceJet','SG 624','Economy',40),
('CCU','BOM','2026-04-03 15:00:00','2026-04-03 17:55:00',8946,'Vistara','UK 765','Business',1),
('CCU','BOM','2026-04-03 19:30:00','2026-04-03 22:20:00',4985,'IndiGo','6E 6102','Economy',37);
-- ---- 2026-04-04 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-04 05:55:00','2026-04-04 08:45:00',4073,'IndiGo','6E 2228','Economy',46),
('MAA','BOM','2026-04-04 06:00:00','2026-04-04 08:55:00',5323,'Air India','AI 2896','Economy',28),
('MAA','BOM','2026-04-04 09:15:00','2026-04-04 12:10:00',4188,'SpiceJet','SG 8167','Economy',61),
('MAA','BOM','2026-04-04 14:30:00','2026-04-04 17:20:00',6892,'Vistara','UK 872','Business',13),
('MAA','BOM','2026-04-04 19:45:00','2026-04-04 22:35:00',5108,'Air India','AI 660','Economy',28);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-04 06:00:00','2026-04-04 08:05:00',3650,'IndiGo','6E 444','Economy',65),
('DEL','BOM','2026-04-04 07:30:00','2026-04-04 09:40:00',5304,'Air India','AI 101','Business',5),
('DEL','BOM','2026-04-04 10:20:00','2026-04-04 12:25:00',3634,'SpiceJet','SG 161','Economy',67),
('DEL','BOM','2026-04-04 13:15:00','2026-04-04 15:20:00',7179,'Vistara','UK 976','Business',12),
('DEL','BOM','2026-04-04 18:00:00','2026-04-04 20:10:00',3474,'GoAir','G8 311','Economy',39);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-04 05:30:00','2026-04-04 08:15:00',4469,'IndiGo','6E 2001','Economy',57),
('DEL','BLR','2026-04-04 07:00:00','2026-04-04 09:50:00',5723,'Air India','AI 501','Economy',26),
('DEL','BLR','2026-04-04 12:00:00','2026-04-04 14:45:00',8335,'Vistara','UK 810','Business',9),
('DEL','BLR','2026-04-04 15:30:00','2026-04-04 18:20:00',4182,'SpiceJet','SG 233','Economy',50),
('DEL','BLR','2026-04-04 20:45:00','2026-04-04 23:30:00',4371,'IndiGo','6E 2555','Economy',42);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-04 06:10:00','2026-04-04 09:05:00',4323,'IndiGo','6E 2002','Economy',54),
('BLR','DEL','2026-04-04 09:00:00','2026-04-04 12:00:00',6526,'Air India','AI 502','Economy',21),
('BLR','DEL','2026-04-04 13:00:00','2026-04-04 16:00:00',8935,'Vistara','UK 811','Business',11),
('BLR','DEL','2026-04-04 16:45:00','2026-04-04 19:40:00',4155,'SpiceJet','SG 234','Economy',33),
('BLR','DEL','2026-04-04 21:00:00','2026-04-04 23:55:00',3885,'GoAir','G8 402','Economy',59);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-04 05:35:00','2026-04-04 07:45:00',3964,'IndiGo','6E 341','Economy',45),
('BOM','MAA','2026-04-04 08:40:00','2026-04-04 10:55:00',5751,'Air India','AI 543','Economy',18),
('BOM','MAA','2026-04-04 11:00:00','2026-04-04 13:15:00',3832,'SpiceJet','SG 716','Economy',77),
('BOM','MAA','2026-04-04 15:20:00','2026-04-04 17:35:00',7540,'Vistara','UK 890','Business',4),
('BOM','MAA','2026-04-04 20:00:00','2026-04-04 22:10:00',4480,'IndiGo','6E 882','Economy',33);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-04 06:00:00','2026-04-04 08:25:00',3678,'IndiGo','6E 718','Economy',61),
('HYD','DEL','2026-04-04 09:30:00','2026-04-04 11:55:00',5739,'Air India','AI 407','Economy',15),
('HYD','DEL','2026-04-04 12:45:00','2026-04-04 15:10:00',3542,'SpiceJet','SG 119','Economy',58),
('HYD','DEL','2026-04-04 16:00:00','2026-04-04 18:25:00',8452,'Vistara','UK 572','Business',1),
('HYD','DEL','2026-04-04 20:15:00','2026-04-04 22:40:00',3140,'GoAir','G8 504','Economy',35);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-04 06:45:00','2026-04-04 09:35:00',4535,'IndiGo','6E 6098','Economy',39),
('CCU','BOM','2026-04-04 08:00:00','2026-04-04 10:55:00',6155,'Air India','AI 761','Economy',19),
('CCU','BOM','2026-04-04 11:30:00','2026-04-04 14:20:00',3764,'SpiceJet','SG 624','Economy',53),
('CCU','BOM','2026-04-04 15:00:00','2026-04-04 17:55:00',9316,'Vistara','UK 765','Business',3),
('CCU','BOM','2026-04-04 19:30:00','2026-04-04 22:20:00',5054,'IndiGo','6E 6102','Economy',32);
-- ---- 2026-04-05 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-05 05:55:00','2026-04-05 08:45:00',4424,'IndiGo','6E 2228','Economy',33),
('MAA','BOM','2026-04-05 06:00:00','2026-04-05 08:55:00',5110,'Air India','AI 2896','Economy',21),
('MAA','BOM','2026-04-05 09:15:00','2026-04-05 12:10:00',3997,'SpiceJet','SG 8167','Economy',73),
('MAA','BOM','2026-04-05 14:30:00','2026-04-05 17:20:00',6519,'Vistara','UK 872','Business',16),
('MAA','BOM','2026-04-05 19:45:00','2026-04-05 22:35:00',5088,'Air India','AI 660','Economy',36);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-05 06:00:00','2026-04-05 08:05:00',3505,'IndiGo','6E 444','Economy',56),
('DEL','BOM','2026-04-05 07:30:00','2026-04-05 09:40:00',5604,'Air India','AI 101','Business',14),
('DEL','BOM','2026-04-05 10:20:00','2026-04-05 12:25:00',3628,'SpiceJet','SG 161','Economy',77),
('DEL','BOM','2026-04-05 13:15:00','2026-04-05 15:20:00',7558,'Vistara','UK 976','Business',15),
('DEL','BOM','2026-04-05 18:00:00','2026-04-05 20:10:00',3224,'GoAir','G8 311','Economy',53);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-05 05:30:00','2026-04-05 08:15:00',4123,'IndiGo','6E 2001','Economy',58),
('DEL','BLR','2026-04-05 07:00:00','2026-04-05 09:50:00',6045,'Air India','AI 501','Economy',27),
('DEL','BLR','2026-04-05 12:00:00','2026-04-05 14:45:00',8228,'Vistara','UK 810','Business',7),
('DEL','BLR','2026-04-05 15:30:00','2026-04-05 18:20:00',3843,'SpiceJet','SG 233','Economy',46),
('DEL','BLR','2026-04-05 20:45:00','2026-04-05 23:30:00',3968,'IndiGo','6E 2555','Economy',37);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-05 06:10:00','2026-04-05 09:05:00',4129,'IndiGo','6E 2002','Economy',59),
('BLR','DEL','2026-04-05 09:00:00','2026-04-05 12:00:00',6445,'Air India','AI 502','Economy',5),
('BLR','DEL','2026-04-05 13:00:00','2026-04-05 16:00:00',8902,'Vistara','UK 811','Business',12),
('BLR','DEL','2026-04-05 16:45:00','2026-04-05 19:40:00',4276,'SpiceJet','SG 234','Economy',28),
('BLR','DEL','2026-04-05 21:00:00','2026-04-05 23:55:00',3484,'GoAir','G8 402','Economy',65);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-05 05:35:00','2026-04-05 07:45:00',4137,'IndiGo','6E 341','Economy',42),
('BOM','MAA','2026-04-05 08:40:00','2026-04-05 10:55:00',5571,'Air India','AI 543','Economy',15),
('BOM','MAA','2026-04-05 11:00:00','2026-04-05 13:15:00',3350,'SpiceJet','SG 716','Economy',70),
('BOM','MAA','2026-04-05 15:20:00','2026-04-05 17:35:00',7287,'Vistara','UK 890','Business',7),
('BOM','MAA','2026-04-05 20:00:00','2026-04-05 22:10:00',4415,'IndiGo','6E 882','Economy',33);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-05 06:00:00','2026-04-05 08:25:00',3933,'IndiGo','6E 718','Economy',62),
('HYD','DEL','2026-04-05 09:30:00','2026-04-05 11:55:00',5887,'Air India','AI 407','Economy',15),
('HYD','DEL','2026-04-05 12:45:00','2026-04-05 15:10:00',3630,'SpiceJet','SG 119','Economy',56),
('HYD','DEL','2026-04-05 16:00:00','2026-04-05 18:25:00',7982,'Vistara','UK 572','Business',14),
('HYD','DEL','2026-04-05 20:15:00','2026-04-05 22:40:00',3018,'GoAir','G8 504','Economy',48);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-05 06:45:00','2026-04-05 09:35:00',4352,'IndiGo','6E 6098','Economy',38),
('CCU','BOM','2026-04-05 08:00:00','2026-04-05 10:55:00',6228,'Air India','AI 761','Economy',33),
('CCU','BOM','2026-04-05 11:30:00','2026-04-05 14:20:00',3769,'SpiceJet','SG 624','Economy',60),
('CCU','BOM','2026-04-05 15:00:00','2026-04-05 17:55:00',8940,'Vistara','UK 765','Business',1),
('CCU','BOM','2026-04-05 19:30:00','2026-04-05 22:20:00',4752,'IndiGo','6E 6102','Economy',24);
-- ---- 2026-04-06 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-06 05:55:00','2026-04-06 08:45:00',4019,'IndiGo','6E 2228','Economy',51),
('MAA','BOM','2026-04-06 06:00:00','2026-04-06 08:55:00',5055,'Air India','AI 2896','Economy',15),
('MAA','BOM','2026-04-06 09:15:00','2026-04-06 12:10:00',3728,'SpiceJet','SG 8167','Economy',70),
('MAA','BOM','2026-04-06 14:30:00','2026-04-06 17:20:00',7184,'Vistara','UK 872','Business',1),
('MAA','BOM','2026-04-06 19:45:00','2026-04-06 22:35:00',5276,'Air India','AI 660','Economy',27);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-06 06:00:00','2026-04-06 08:05:00',3975,'IndiGo','6E 444','Economy',53),
('DEL','BOM','2026-04-06 07:30:00','2026-04-06 09:40:00',5676,'Air India','AI 101','Business',7),
('DEL','BOM','2026-04-06 10:20:00','2026-04-06 12:25:00',3819,'SpiceJet','SG 161','Economy',79),
('DEL','BOM','2026-04-06 13:15:00','2026-04-06 15:20:00',7116,'Vistara','UK 976','Business',1),
('DEL','BOM','2026-04-06 18:00:00','2026-04-06 20:10:00',3317,'GoAir','G8 311','Economy',41);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-06 05:30:00','2026-04-06 08:15:00',4491,'IndiGo','6E 2001','Economy',50),
('DEL','BLR','2026-04-06 07:00:00','2026-04-06 09:50:00',5918,'Air India','AI 501','Economy',30),
('DEL','BLR','2026-04-06 12:00:00','2026-04-06 14:45:00',8892,'Vistara','UK 810','Business',7),
('DEL','BLR','2026-04-06 15:30:00','2026-04-06 18:20:00',3905,'SpiceJet','SG 233','Economy',40),
('DEL','BLR','2026-04-06 20:45:00','2026-04-06 23:30:00',3876,'IndiGo','6E 2555','Economy',41);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-06 06:10:00','2026-04-06 09:05:00',4641,'IndiGo','6E 2002','Economy',47),
('BLR','DEL','2026-04-06 09:00:00','2026-04-06 12:00:00',6003,'Air India','AI 502','Economy',14),
('BLR','DEL','2026-04-06 13:00:00','2026-04-06 16:00:00',9199,'Vistara','UK 811','Business',13),
('BLR','DEL','2026-04-06 16:45:00','2026-04-06 19:40:00',3822,'SpiceJet','SG 234','Economy',46),
('BLR','DEL','2026-04-06 21:00:00','2026-04-06 23:55:00',3441,'GoAir','G8 402','Economy',56);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-06 05:35:00','2026-04-06 07:45:00',4244,'IndiGo','6E 341','Economy',51),
('BOM','MAA','2026-04-06 08:40:00','2026-04-06 10:55:00',5776,'Air India','AI 543','Economy',21),
('BOM','MAA','2026-04-06 11:00:00','2026-04-06 13:15:00',3369,'SpiceJet','SG 716','Economy',78),
('BOM','MAA','2026-04-06 15:20:00','2026-04-06 17:35:00',7562,'Vistara','UK 890','Business',7),
('BOM','MAA','2026-04-06 20:00:00','2026-04-06 22:10:00',4211,'IndiGo','6E 882','Economy',32);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-06 06:00:00','2026-04-06 08:25:00',4100,'IndiGo','6E 718','Economy',55),
('HYD','DEL','2026-04-06 09:30:00','2026-04-06 11:55:00',5942,'Air India','AI 407','Economy',18),
('HYD','DEL','2026-04-06 12:45:00','2026-04-06 15:10:00',3849,'SpiceJet','SG 119','Economy',62),
('HYD','DEL','2026-04-06 16:00:00','2026-04-06 18:25:00',8055,'Vistara','UK 572','Business',12),
('HYD','DEL','2026-04-06 20:15:00','2026-04-06 22:40:00',3179,'GoAir','G8 504','Economy',47);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-06 06:45:00','2026-04-06 09:35:00',4965,'IndiGo','6E 6098','Economy',35),
('CCU','BOM','2026-04-06 08:00:00','2026-04-06 10:55:00',6629,'Air India','AI 761','Economy',30),
('CCU','BOM','2026-04-06 11:30:00','2026-04-06 14:20:00',4194,'SpiceJet','SG 624','Economy',54),
('CCU','BOM','2026-04-06 15:00:00','2026-04-06 17:55:00',9345,'Vistara','UK 765','Business',11),
('CCU','BOM','2026-04-06 19:30:00','2026-04-06 22:20:00',4773,'IndiGo','6E 6102','Economy',28);
-- ---- 2026-04-07 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-07 05:55:00','2026-04-07 08:45:00',4250,'IndiGo','6E 2228','Economy',34),
('MAA','BOM','2026-04-07 06:00:00','2026-04-07 08:55:00',5184,'Air India','AI 2896','Economy',22),
('MAA','BOM','2026-04-07 09:15:00','2026-04-07 12:10:00',3848,'SpiceJet','SG 8167','Economy',69),
('MAA','BOM','2026-04-07 14:30:00','2026-04-07 17:20:00',7082,'Vistara','UK 872','Business',17),
('MAA','BOM','2026-04-07 19:45:00','2026-04-07 22:35:00',5383,'Air India','AI 660','Economy',33);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-07 06:00:00','2026-04-07 08:05:00',3843,'IndiGo','6E 444','Economy',45),
('DEL','BOM','2026-04-07 07:30:00','2026-04-07 09:40:00',5805,'Air India','AI 101','Business',12),
('DEL','BOM','2026-04-07 10:20:00','2026-04-07 12:25:00',3385,'SpiceJet','SG 161','Economy',75),
('DEL','BOM','2026-04-07 13:15:00','2026-04-07 15:20:00',7216,'Vistara','UK 976','Business',7),
('DEL','BOM','2026-04-07 18:00:00','2026-04-07 20:10:00',3263,'GoAir','G8 311','Economy',48);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-07 05:30:00','2026-04-07 08:15:00',4185,'IndiGo','6E 2001','Economy',69),
('DEL','BLR','2026-04-07 07:00:00','2026-04-07 09:50:00',5881,'Air India','AI 501','Economy',29),
('DEL','BLR','2026-04-07 12:00:00','2026-04-07 14:45:00',8209,'Vistara','UK 810','Business',11),
('DEL','BLR','2026-04-07 15:30:00','2026-04-07 18:20:00',3694,'SpiceJet','SG 233','Economy',36),
('DEL','BLR','2026-04-07 20:45:00','2026-04-07 23:30:00',4046,'IndiGo','6E 2555','Economy',36);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-07 06:10:00','2026-04-07 09:05:00',4499,'IndiGo','6E 2002','Economy',57),
('BLR','DEL','2026-04-07 09:00:00','2026-04-07 12:00:00',6145,'Air India','AI 502','Economy',20),
('BLR','DEL','2026-04-07 13:00:00','2026-04-07 16:00:00',9160,'Vistara','UK 811','Business',9),
('BLR','DEL','2026-04-07 16:45:00','2026-04-07 19:40:00',4157,'SpiceJet','SG 234','Economy',28),
('BLR','DEL','2026-04-07 21:00:00','2026-04-07 23:55:00',3494,'GoAir','G8 402','Economy',54);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-07 05:35:00','2026-04-07 07:45:00',3925,'IndiGo','6E 341','Economy',50),
('BOM','MAA','2026-04-07 08:40:00','2026-04-07 10:55:00',5348,'Air India','AI 543','Economy',19),
('BOM','MAA','2026-04-07 11:00:00','2026-04-07 13:15:00',3978,'SpiceJet','SG 716','Economy',80),
('BOM','MAA','2026-04-07 15:20:00','2026-04-07 17:35:00',7276,'Vistara','UK 890','Business',12),
('BOM','MAA','2026-04-07 20:00:00','2026-04-07 22:10:00',4765,'IndiGo','6E 882','Economy',35);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-07 06:00:00','2026-04-07 08:25:00',3951,'IndiGo','6E 718','Economy',65),
('HYD','DEL','2026-04-07 09:30:00','2026-04-07 11:55:00',6062,'Air India','AI 407','Economy',17),
('HYD','DEL','2026-04-07 12:45:00','2026-04-07 15:10:00',3559,'SpiceJet','SG 119','Economy',62),
('HYD','DEL','2026-04-07 16:00:00','2026-04-07 18:25:00',8176,'Vistara','UK 572','Business',8),
('HYD','DEL','2026-04-07 20:15:00','2026-04-07 22:40:00',3256,'GoAir','G8 504','Economy',38);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-07 06:45:00','2026-04-07 09:35:00',4422,'IndiGo','6E 6098','Economy',33),
('CCU','BOM','2026-04-07 08:00:00','2026-04-07 10:55:00',6322,'Air India','AI 761','Economy',16),
('CCU','BOM','2026-04-07 11:30:00','2026-04-07 14:20:00',4247,'SpiceJet','SG 624','Economy',45),
('CCU','BOM','2026-04-07 15:00:00','2026-04-07 17:55:00',9095,'Vistara','UK 765','Business',1),
('CCU','BOM','2026-04-07 19:30:00','2026-04-07 22:20:00',4994,'IndiGo','6E 6102','Economy',26);
-- ---- 2026-04-08 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-08 05:55:00','2026-04-08 08:45:00',4602,'IndiGo','6E 2228','Economy',48),
('MAA','BOM','2026-04-08 06:00:00','2026-04-08 08:55:00',5510,'Air India','AI 2896','Economy',17),
('MAA','BOM','2026-04-08 09:15:00','2026-04-08 12:10:00',3701,'SpiceJet','SG 8167','Economy',61),
('MAA','BOM','2026-04-08 14:30:00','2026-04-08 17:20:00',6802,'Vistara','UK 872','Business',5),
('MAA','BOM','2026-04-08 19:45:00','2026-04-08 22:35:00',5068,'Air India','AI 660','Economy',26);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-08 06:00:00','2026-04-08 08:05:00',3808,'IndiGo','6E 444','Economy',45),
('DEL','BOM','2026-04-08 07:30:00','2026-04-08 09:40:00',5845,'Air India','AI 101','Business',6),
('DEL','BOM','2026-04-08 10:20:00','2026-04-08 12:25:00',3479,'SpiceJet','SG 161','Economy',61),
('DEL','BOM','2026-04-08 13:15:00','2026-04-08 15:20:00',7054,'Vistara','UK 976','Business',13),
('DEL','BOM','2026-04-08 18:00:00','2026-04-08 20:10:00',3298,'GoAir','G8 311','Economy',42);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-08 05:30:00','2026-04-08 08:15:00',4552,'IndiGo','6E 2001','Economy',65),
('DEL','BLR','2026-04-08 07:00:00','2026-04-08 09:50:00',5704,'Air India','AI 501','Economy',12),
('DEL','BLR','2026-04-08 12:00:00','2026-04-08 14:45:00',8786,'Vistara','UK 810','Business',4),
('DEL','BLR','2026-04-08 15:30:00','2026-04-08 18:20:00',3979,'SpiceJet','SG 233','Economy',49),
('DEL','BLR','2026-04-08 20:45:00','2026-04-08 23:30:00',4250,'IndiGo','6E 2555','Economy',33);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-08 06:10:00','2026-04-08 09:05:00',4187,'IndiGo','6E 2002','Economy',41),
('BLR','DEL','2026-04-08 09:00:00','2026-04-08 12:00:00',6157,'Air India','AI 502','Economy',20),
('BLR','DEL','2026-04-08 13:00:00','2026-04-08 16:00:00',8615,'Vistara','UK 811','Business',1),
('BLR','DEL','2026-04-08 16:45:00','2026-04-08 19:40:00',4109,'SpiceJet','SG 234','Economy',43),
('BLR','DEL','2026-04-08 21:00:00','2026-04-08 23:55:00',3474,'GoAir','G8 402','Economy',63);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-08 05:35:00','2026-04-08 07:45:00',4343,'IndiGo','6E 341','Economy',39),
('BOM','MAA','2026-04-08 08:40:00','2026-04-08 10:55:00',5254,'Air India','AI 543','Economy',14),
('BOM','MAA','2026-04-08 11:00:00','2026-04-08 13:15:00',3875,'SpiceJet','SG 716','Economy',71),
('BOM','MAA','2026-04-08 15:20:00','2026-04-08 17:35:00',6986,'Vistara','UK 890','Business',4),
('BOM','MAA','2026-04-08 20:00:00','2026-04-08 22:10:00',4320,'IndiGo','6E 882','Economy',36);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-08 06:00:00','2026-04-08 08:25:00',4025,'IndiGo','6E 718','Economy',71),
('HYD','DEL','2026-04-08 09:30:00','2026-04-08 11:55:00',6109,'Air India','AI 407','Economy',26),
('HYD','DEL','2026-04-08 12:45:00','2026-04-08 15:10:00',3430,'SpiceJet','SG 119','Economy',64),
('HYD','DEL','2026-04-08 16:00:00','2026-04-08 18:25:00',8288,'Vistara','UK 572','Business',13),
('HYD','DEL','2026-04-08 20:15:00','2026-04-08 22:40:00',3452,'GoAir','G8 504','Economy',40);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-08 06:45:00','2026-04-08 09:35:00',4901,'IndiGo','6E 6098','Economy',40),
('CCU','BOM','2026-04-08 08:00:00','2026-04-08 10:55:00',6311,'Air India','AI 761','Economy',31),
('CCU','BOM','2026-04-08 11:30:00','2026-04-08 14:20:00',4334,'SpiceJet','SG 624','Economy',41),
('CCU','BOM','2026-04-08 15:00:00','2026-04-08 17:55:00',9523,'Vistara','UK 765','Business',1),
('CCU','BOM','2026-04-08 19:30:00','2026-04-08 22:20:00',4711,'IndiGo','6E 6102','Economy',38);
-- ---- 2026-04-09 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-09 05:55:00','2026-04-09 08:45:00',4215,'IndiGo','6E 2228','Economy',40),
('MAA','BOM','2026-04-09 06:00:00','2026-04-09 08:55:00',5575,'Air India','AI 2896','Economy',10),
('MAA','BOM','2026-04-09 09:15:00','2026-04-09 12:10:00',3759,'SpiceJet','SG 8167','Economy',62),
('MAA','BOM','2026-04-09 14:30:00','2026-04-09 17:20:00',6676,'Vistara','UK 872','Business',15),
('MAA','BOM','2026-04-09 19:45:00','2026-04-09 22:35:00',4775,'Air India','AI 660','Economy',26);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-09 06:00:00','2026-04-09 08:05:00',3501,'IndiGo','6E 444','Economy',58),
('DEL','BOM','2026-04-09 07:30:00','2026-04-09 09:40:00',5760,'Air India','AI 101','Business',21),
('DEL','BOM','2026-04-09 10:20:00','2026-04-09 12:25:00',3680,'SpiceJet','SG 161','Economy',69),
('DEL','BOM','2026-04-09 13:15:00','2026-04-09 15:20:00',7032,'Vistara','UK 976','Business',3),
('DEL','BOM','2026-04-09 18:00:00','2026-04-09 20:10:00',3294,'GoAir','G8 311','Economy',47);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-09 05:30:00','2026-04-09 08:15:00',4363,'IndiGo','6E 2001','Economy',52),
('DEL','BLR','2026-04-09 07:00:00','2026-04-09 09:50:00',5838,'Air India','AI 501','Economy',20),
('DEL','BLR','2026-04-09 12:00:00','2026-04-09 14:45:00',8839,'Vistara','UK 810','Business',13),
('DEL','BLR','2026-04-09 15:30:00','2026-04-09 18:20:00',4176,'SpiceJet','SG 233','Economy',40),
('DEL','BLR','2026-04-09 20:45:00','2026-04-09 23:30:00',4234,'IndiGo','6E 2555','Economy',26);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-09 06:10:00','2026-04-09 09:05:00',4556,'IndiGo','6E 2002','Economy',47),
('BLR','DEL','2026-04-09 09:00:00','2026-04-09 12:00:00',6562,'Air India','AI 502','Economy',9),
('BLR','DEL','2026-04-09 13:00:00','2026-04-09 16:00:00',8771,'Vistara','UK 811','Business',1),
('BLR','DEL','2026-04-09 16:45:00','2026-04-09 19:40:00',3772,'SpiceJet','SG 234','Economy',29),
('BLR','DEL','2026-04-09 21:00:00','2026-04-09 23:55:00',3568,'GoAir','G8 402','Economy',54);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-09 05:35:00','2026-04-09 07:45:00',4308,'IndiGo','6E 341','Economy',56),
('BOM','MAA','2026-04-09 08:40:00','2026-04-09 10:55:00',5394,'Air India','AI 543','Economy',24),
('BOM','MAA','2026-04-09 11:00:00','2026-04-09 13:15:00',3426,'SpiceJet','SG 716','Economy',76),
('BOM','MAA','2026-04-09 15:20:00','2026-04-09 17:35:00',7210,'Vistara','UK 890','Business',9),
('BOM','MAA','2026-04-09 20:00:00','2026-04-09 22:10:00',4477,'IndiGo','6E 882','Economy',35);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-09 06:00:00','2026-04-09 08:25:00',4151,'IndiGo','6E 718','Economy',67),
('HYD','DEL','2026-04-09 09:30:00','2026-04-09 11:55:00',5947,'Air India','AI 407','Economy',9),
('HYD','DEL','2026-04-09 12:45:00','2026-04-09 15:10:00',3811,'SpiceJet','SG 119','Economy',49),
('HYD','DEL','2026-04-09 16:00:00','2026-04-09 18:25:00',8341,'Vistara','UK 572','Business',9),
('HYD','DEL','2026-04-09 20:15:00','2026-04-09 22:40:00',3617,'GoAir','G8 504','Economy',39);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-09 06:45:00','2026-04-09 09:35:00',4325,'IndiGo','6E 6098','Economy',29),
('CCU','BOM','2026-04-09 08:00:00','2026-04-09 10:55:00',6233,'Air India','AI 761','Economy',31),
('CCU','BOM','2026-04-09 11:30:00','2026-04-09 14:20:00',4300,'SpiceJet','SG 624','Economy',40),
('CCU','BOM','2026-04-09 15:00:00','2026-04-09 17:55:00',9587,'Vistara','UK 765','Business',1),
('CCU','BOM','2026-04-09 19:30:00','2026-04-09 22:20:00',5089,'IndiGo','6E 6102','Economy',19);
-- ---- 2026-04-10 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-10 05:55:00','2026-04-10 08:45:00',4178,'IndiGo','6E 2228','Economy',47),
('MAA','BOM','2026-04-10 06:00:00','2026-04-10 08:55:00',5430,'Air India','AI 2896','Economy',28),
('MAA','BOM','2026-04-10 09:15:00','2026-04-10 12:10:00',4051,'SpiceJet','SG 8167','Economy',63),
('MAA','BOM','2026-04-10 14:30:00','2026-04-10 17:20:00',6684,'Vistara','UK 872','Business',16),
('MAA','BOM','2026-04-10 19:45:00','2026-04-10 22:35:00',5145,'Air India','AI 660','Economy',41);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-10 06:00:00','2026-04-10 08:05:00',4002,'IndiGo','6E 444','Economy',47),
('DEL','BOM','2026-04-10 07:30:00','2026-04-10 09:40:00',5780,'Air India','AI 101','Business',13),
('DEL','BOM','2026-04-10 10:20:00','2026-04-10 12:25:00',3617,'SpiceJet','SG 161','Economy',70),
('DEL','BOM','2026-04-10 13:15:00','2026-04-10 15:20:00',7327,'Vistara','UK 976','Business',1),
('DEL','BOM','2026-04-10 18:00:00','2026-04-10 20:10:00',3163,'GoAir','G8 311','Economy',48);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-10 05:30:00','2026-04-10 08:15:00',4320,'IndiGo','6E 2001','Economy',65),
('DEL','BLR','2026-04-10 07:00:00','2026-04-10 09:50:00',5894,'Air India','AI 501','Economy',24),
('DEL','BLR','2026-04-10 12:00:00','2026-04-10 14:45:00',8762,'Vistara','UK 810','Business',1),
('DEL','BLR','2026-04-10 15:30:00','2026-04-10 18:20:00',3964,'SpiceJet','SG 233','Economy',36),
('DEL','BLR','2026-04-10 20:45:00','2026-04-10 23:30:00',4121,'IndiGo','6E 2555','Economy',31);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-10 06:10:00','2026-04-10 09:05:00',4330,'IndiGo','6E 2002','Economy',43),
('BLR','DEL','2026-04-10 09:00:00','2026-04-10 12:00:00',6312,'Air India','AI 502','Economy',21),
('BLR','DEL','2026-04-10 13:00:00','2026-04-10 16:00:00',8500,'Vistara','UK 811','Business',11),
('BLR','DEL','2026-04-10 16:45:00','2026-04-10 19:40:00',4172,'SpiceJet','SG 234','Economy',41),
('BLR','DEL','2026-04-10 21:00:00','2026-04-10 23:55:00',3454,'GoAir','G8 402','Economy',51);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-10 05:35:00','2026-04-10 07:45:00',4229,'IndiGo','6E 341','Economy',49),
('BOM','MAA','2026-04-10 08:40:00','2026-04-10 10:55:00',5736,'Air India','AI 543','Economy',25),
('BOM','MAA','2026-04-10 11:00:00','2026-04-10 13:15:00',3939,'SpiceJet','SG 716','Economy',76),
('BOM','MAA','2026-04-10 15:20:00','2026-04-10 17:35:00',6951,'Vistara','UK 890','Business',3),
('BOM','MAA','2026-04-10 20:00:00','2026-04-10 22:10:00',4472,'IndiGo','6E 882','Economy',36);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-10 06:00:00','2026-04-10 08:25:00',3733,'IndiGo','6E 718','Economy',61),
('HYD','DEL','2026-04-10 09:30:00','2026-04-10 11:55:00',5947,'Air India','AI 407','Economy',22),
('HYD','DEL','2026-04-10 12:45:00','2026-04-10 15:10:00',3323,'SpiceJet','SG 119','Economy',48),
('HYD','DEL','2026-04-10 16:00:00','2026-04-10 18:25:00',8544,'Vistara','UK 572','Business',18),
('HYD','DEL','2026-04-10 20:15:00','2026-04-10 22:40:00',3244,'GoAir','G8 504','Economy',36);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-10 06:45:00','2026-04-10 09:35:00',4617,'IndiGo','6E 6098','Economy',44),
('CCU','BOM','2026-04-10 08:00:00','2026-04-10 10:55:00',6013,'Air India','AI 761','Economy',30),
('CCU','BOM','2026-04-10 11:30:00','2026-04-10 14:20:00',4116,'SpiceJet','SG 624','Economy',42),
('CCU','BOM','2026-04-10 15:00:00','2026-04-10 17:55:00',9129,'Vistara','UK 765','Business',1),
('CCU','BOM','2026-04-10 19:30:00','2026-04-10 22:20:00',4971,'IndiGo','6E 6102','Economy',21);
-- ---- 2026-04-17 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-17 05:55:00','2026-04-17 08:45:00',4389,'IndiGo','6E 2228','Economy',44),
('MAA','BOM','2026-04-17 06:00:00','2026-04-17 08:55:00',5312,'Air India','AI 2896','Economy',18),
('MAA','BOM','2026-04-17 09:15:00','2026-04-17 12:10:00',3971,'SpiceJet','SG 8167','Economy',67),
('MAA','BOM','2026-04-17 14:30:00','2026-04-17 17:20:00',6855,'Vistara','UK 872','Business',9),
('MAA','BOM','2026-04-17 19:45:00','2026-04-17 22:35:00',5014,'Air India','AI 660','Economy',31);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-17 06:00:00','2026-04-17 08:05:00',3742,'IndiGo','6E 444','Economy',55),
('DEL','BOM','2026-04-17 07:30:00','2026-04-17 09:40:00',5817,'Air India','AI 101','Business',8),
('DEL','BOM','2026-04-17 10:20:00','2026-04-17 12:25:00',3453,'SpiceJet','SG 161','Economy',70),
('DEL','BOM','2026-04-17 13:15:00','2026-04-17 15:20:00',7241,'Vistara','UK 976','Business',4),
('DEL','BOM','2026-04-17 18:00:00','2026-04-17 20:10:00',3384,'GoAir','G8 311','Economy',46);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-17 05:30:00','2026-04-17 08:15:00',4278,'IndiGo','6E 2001','Economy',61),
('DEL','BLR','2026-04-17 07:00:00','2026-04-17 09:50:00',5935,'Air India','AI 501','Economy',28),
('DEL','BLR','2026-04-17 12:00:00','2026-04-17 14:45:00',8614,'Vistara','UK 810','Business',6),
('DEL','BLR','2026-04-17 15:30:00','2026-04-17 18:20:00',3817,'SpiceJet','SG 233','Economy',47),
('DEL','BLR','2026-04-17 20:45:00','2026-04-17 23:30:00',4103,'IndiGo','6E 2555','Economy',34);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-17 06:10:00','2026-04-17 09:05:00',4412,'IndiGo','6E 2002','Economy',49),
('BLR','DEL','2026-04-17 09:00:00','2026-04-17 12:00:00',6284,'Air India','AI 502','Economy',17),
('BLR','DEL','2026-04-17 13:00:00','2026-04-17 16:00:00',8743,'Vistara','UK 811','Business',5),
('BLR','DEL','2026-04-17 16:45:00','2026-04-17 19:40:00',3994,'SpiceJet','SG 234','Economy',39),
('BLR','DEL','2026-04-17 21:00:00','2026-04-17 23:55:00',3521,'GoAir','G8 402','Economy',57);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-17 05:35:00','2026-04-17 07:45:00',4175,'IndiGo','6E 341','Economy',52),
('BOM','MAA','2026-04-17 08:40:00','2026-04-17 10:55:00',5491,'Air India','AI 543','Economy',16),
('BOM','MAA','2026-04-17 11:00:00','2026-04-17 13:15:00',3702,'SpiceJet','SG 716','Economy',73),
('BOM','MAA','2026-04-17 15:20:00','2026-04-17 17:35:00',7118,'Vistara','UK 890','Business',8),
('BOM','MAA','2026-04-17 20:00:00','2026-04-17 22:10:00',4539,'IndiGo','6E 882','Economy',30);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-17 06:00:00','2026-04-17 08:25:00',3865,'IndiGo','6E 718','Economy',59),
('HYD','DEL','2026-04-17 09:30:00','2026-04-17 11:55:00',6031,'Air India','AI 407','Economy',20),
('HYD','DEL','2026-04-17 12:45:00','2026-04-17 15:10:00',3588,'SpiceJet','SG 119','Economy',55),
('HYD','DEL','2026-04-17 16:00:00','2026-04-17 18:25:00',8213,'Vistara','UK 572','Business',11),
('HYD','DEL','2026-04-17 20:15:00','2026-04-17 22:40:00',3307,'GoAir','G8 504','Economy',42);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-17 06:45:00','2026-04-17 09:35:00',4683,'IndiGo','6E 6098','Economy',37),
('CCU','BOM','2026-04-17 08:00:00','2026-04-17 10:55:00',6184,'Air India','AI 761','Economy',22),
('CCU','BOM','2026-04-17 11:30:00','2026-04-17 14:20:00',4052,'SpiceJet','SG 624','Economy',48),
('CCU','BOM','2026-04-17 15:00:00','2026-04-17 17:55:00',9241,'Vistara','UK 765','Business',4),
('CCU','BOM','2026-04-17 19:30:00','2026-04-17 22:20:00',4838,'IndiGo','6E 6102','Economy',29);
-- ---- 2026-04-18 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-18 05:55:00','2026-04-18 08:45:00',4512,'IndiGo','6E 2228','Economy',36),
('MAA','BOM','2026-04-18 06:00:00','2026-04-18 08:55:00',5198,'Air India','AI 2896','Economy',23),
('MAA','BOM','2026-04-18 09:15:00','2026-04-18 12:10:00',4087,'SpiceJet','SG 8167','Economy',65),
('MAA','BOM','2026-04-18 14:30:00','2026-04-18 17:20:00',7023,'Vistara','UK 872','Business',12),
('MAA','BOM','2026-04-18 19:45:00','2026-04-18 22:35:00',4891,'Air India','AI 660','Economy',28);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-18 06:00:00','2026-04-18 08:05:00',3619,'IndiGo','6E 444','Economy',62),
('DEL','BOM','2026-04-18 07:30:00','2026-04-18 09:40:00',5753,'Air India','AI 101','Business',14),
('DEL','BOM','2026-04-18 10:20:00','2026-04-18 12:25:00',3328,'SpiceJet','SG 161','Economy',73),
('DEL','BOM','2026-04-18 13:15:00','2026-04-18 15:20:00',7409,'Vistara','UK 976','Business',2),
('DEL','BOM','2026-04-18 18:00:00','2026-04-18 20:10:00',3558,'GoAir','G8 311','Economy',50);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-18 05:30:00','2026-04-18 08:15:00',4391,'IndiGo','6E 2001','Economy',57),
('DEL','BLR','2026-04-18 07:00:00','2026-04-18 09:50:00',6071,'Air India','AI 501','Economy',31),
('DEL','BLR','2026-04-18 12:00:00','2026-04-18 14:45:00',8449,'Vistara','UK 810','Business',8),
('DEL','BLR','2026-04-18 15:30:00','2026-04-18 18:20:00',3756,'SpiceJet','SG 233','Economy',43),
('DEL','BLR','2026-04-18 20:45:00','2026-04-18 23:30:00',3989,'IndiGo','6E 2555','Economy',35);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-18 06:10:00','2026-04-18 09:05:00',4538,'IndiGo','6E 2002','Economy',46),
('BLR','DEL','2026-04-18 09:00:00','2026-04-18 12:00:00',6118,'Air India','AI 502','Economy',22),
('BLR','DEL','2026-04-18 13:00:00','2026-04-18 16:00:00',8978,'Vistara','UK 811','Business',7),
('BLR','DEL','2026-04-18 16:45:00','2026-04-18 19:40:00',4063,'SpiceJet','SG 234','Economy',35),
('BLR','DEL','2026-04-18 21:00:00','2026-04-18 23:55:00',3607,'GoAir','G8 402','Economy',60);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-18 05:35:00','2026-04-18 07:45:00',4092,'IndiGo','6E 341','Economy',44),
('BOM','MAA','2026-04-18 08:40:00','2026-04-18 10:55:00',5619,'Air India','AI 543','Economy',19),
('BOM','MAA','2026-04-18 11:00:00','2026-04-18 13:15:00',3518,'SpiceJet','SG 716','Economy',78),
('BOM','MAA','2026-04-18 15:20:00','2026-04-18 17:35:00',7234,'Vistara','UK 890','Business',6),
('BOM','MAA','2026-04-18 20:00:00','2026-04-18 22:10:00',4386,'IndiGo','6E 882','Economy',27);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-18 06:00:00','2026-04-18 08:25:00',4019,'IndiGo','6E 718','Economy',63),
('HYD','DEL','2026-04-18 09:30:00','2026-04-18 11:55:00',5873,'Air India','AI 407','Economy',14),
('HYD','DEL','2026-04-18 12:45:00','2026-04-18 15:10:00',3714,'SpiceJet','SG 119','Economy',52),
('HYD','DEL','2026-04-18 16:00:00','2026-04-18 18:25:00',8397,'Vistara','UK 572','Business',7),
('HYD','DEL','2026-04-18 20:15:00','2026-04-18 22:40:00',3183,'GoAir','G8 504','Economy',44);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-18 06:45:00','2026-04-18 09:35:00',4559,'IndiGo','6E 6098','Economy',41),
('CCU','BOM','2026-04-18 08:00:00','2026-04-18 10:55:00',6351,'Air India','AI 761','Economy',27),
('CCU','BOM','2026-04-18 11:30:00','2026-04-18 14:20:00',3918,'SpiceJet','SG 624','Economy',55),
('CCU','BOM','2026-04-18 15:00:00','2026-04-18 17:55:00',9078,'Vistara','UK 765','Business',6),
('CCU','BOM','2026-04-18 19:30:00','2026-04-18 22:20:00',4722,'IndiGo','6E 6102','Economy',33);
-- ---- 2026-04-19 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-19 05:55:00','2026-04-19 08:45:00',4307,'IndiGo','6E 2228','Economy',50),
('MAA','BOM','2026-04-19 06:00:00','2026-04-19 08:55:00',5451,'Air India','AI 2896','Economy',12),
('MAA','BOM','2026-04-19 09:15:00','2026-04-19 12:10:00',3823,'SpiceJet','SG 8167','Economy',71),
('MAA','BOM','2026-04-19 14:30:00','2026-04-19 17:20:00',6791,'Vistara','UK 872','Business',14),
('MAA','BOM','2026-04-19 19:45:00','2026-04-19 22:35:00',5237,'Air India','AI 660','Economy',35);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-19 06:00:00','2026-04-19 08:05:00',3897,'IndiGo','6E 444','Economy',48),
('DEL','BOM','2026-04-19 07:30:00','2026-04-19 09:40:00',5684,'Air India','AI 101','Business',10),
('DEL','BOM','2026-04-19 10:20:00','2026-04-19 12:25:00',3541,'SpiceJet','SG 161','Economy',66),
('DEL','BOM','2026-04-19 13:15:00','2026-04-19 15:20:00',7153,'Vistara','UK 976','Business',6),
('DEL','BOM','2026-04-19 18:00:00','2026-04-19 20:10:00',3476,'GoAir','G8 311','Economy',43);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-19 05:30:00','2026-04-19 08:15:00',4155,'IndiGo','6E 2001','Economy',64),
('DEL','BLR','2026-04-19 07:00:00','2026-04-19 09:50:00',5999,'Air India','AI 501','Economy',26),
('DEL','BLR','2026-04-19 12:00:00','2026-04-19 14:45:00',8573,'Vistara','UK 810','Business',3),
('DEL','BLR','2026-04-19 15:30:00','2026-04-19 18:20:00',3881,'SpiceJet','SG 233','Economy',44),
('DEL','BLR','2026-04-19 20:45:00','2026-04-19 23:30:00',4218,'IndiGo','6E 2555','Economy',29);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-19 06:10:00','2026-04-19 09:05:00',4301,'IndiGo','6E 2002','Economy',53),
('BLR','DEL','2026-04-19 09:00:00','2026-04-19 12:00:00',6437,'Air India','AI 502','Economy',11),
('BLR','DEL','2026-04-19 13:00:00','2026-04-19 16:00:00',8822,'Vistara','UK 811','Business',1),
('BLR','DEL','2026-04-19 16:45:00','2026-04-19 19:40:00',3935,'SpiceJet','SG 234','Economy',42),
('BLR','DEL','2026-04-19 21:00:00','2026-04-19 23:55:00',3679,'GoAir','G8 402','Economy',55);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-19 05:35:00','2026-04-19 07:45:00',4261,'IndiGo','6E 341','Economy',40),
('BOM','MAA','2026-04-19 08:40:00','2026-04-19 10:55:00',5383,'Air India','AI 543','Economy',21),
('BOM','MAA','2026-04-19 11:00:00','2026-04-19 13:15:00',3647,'SpiceJet','SG 716','Economy',75),
('BOM','MAA','2026-04-19 15:20:00','2026-04-19 17:35:00',7072,'Vistara','UK 890','Business',10),
('BOM','MAA','2026-04-19 20:00:00','2026-04-19 22:10:00',4614,'IndiGo','6E 882','Economy',34);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-19 06:00:00','2026-04-19 08:25:00',4083,'IndiGo','6E 718','Economy',58),
('HYD','DEL','2026-04-19 09:30:00','2026-04-19 11:55:00',6114,'Air India','AI 407','Economy',18),
('HYD','DEL','2026-04-19 12:45:00','2026-04-19 15:10:00',3443,'SpiceJet','SG 119','Economy',61),
('HYD','DEL','2026-04-19 16:00:00','2026-04-19 18:25:00',8109,'Vistara','UK 572','Business',15),
('HYD','DEL','2026-04-19 20:15:00','2026-04-19 22:40:00',3372,'GoAir','G8 504','Economy',37);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-19 06:45:00','2026-04-19 09:35:00',4811,'IndiGo','6E 6098','Economy',35),
('CCU','BOM','2026-04-19 08:00:00','2026-04-19 10:55:00',6092,'Air India','AI 761','Economy',24),
('CCU','BOM','2026-04-19 11:30:00','2026-04-19 14:20:00',4173,'SpiceJet','SG 624','Economy',51),
('CCU','BOM','2026-04-19 15:00:00','2026-04-19 17:55:00',9362,'Vistara','UK 765','Business',9),
('CCU','BOM','2026-04-19 19:30:00','2026-04-19 22:20:00',4903,'IndiGo','6E 6102','Economy',26);
-- ---- 2026-04-20 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-20 05:55:00','2026-04-20 08:45:00',4461,'IndiGo','6E 2228','Economy',38),
('MAA','BOM','2026-04-20 06:00:00','2026-04-20 08:55:00',5274,'Air India','AI 2896','Economy',14),
('MAA','BOM','2026-04-20 09:15:00','2026-04-20 12:10:00',4128,'SpiceJet','SG 8167','Economy',68),
('MAA','BOM','2026-04-20 14:30:00','2026-04-20 17:20:00',7091,'Vistara','UK 872','Business',7),
('MAA','BOM','2026-04-20 19:45:00','2026-04-20 22:35:00',4967,'Air India','AI 660','Economy',39);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-20 06:00:00','2026-04-20 08:05:00',3714,'IndiGo','6E 444','Economy',59),
('DEL','BOM','2026-04-20 07:30:00','2026-04-20 09:40:00',5901,'Air India','AI 101','Business',16),
('DEL','BOM','2026-04-20 10:20:00','2026-04-20 12:25:00',3289,'SpiceJet','SG 161','Economy',72),
('DEL','BOM','2026-04-20 13:15:00','2026-04-20 15:20:00',7488,'Vistara','UK 976','Business',3),
('DEL','BOM','2026-04-20 18:00:00','2026-04-20 20:10:00',3612,'GoAir','G8 311','Economy',49);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-20 05:30:00','2026-04-20 08:15:00',4502,'IndiGo','6E 2001','Economy',53),
('DEL','BLR','2026-04-20 07:00:00','2026-04-20 09:50:00',5862,'Air India','AI 501','Economy',22),
('DEL','BLR','2026-04-20 12:00:00','2026-04-20 14:45:00',8318,'Vistara','UK 810','Business',11),
('DEL','BLR','2026-04-20 15:30:00','2026-04-20 18:20:00',4038,'SpiceJet','SG 233','Economy',45),
('DEL','BLR','2026-04-20 20:45:00','2026-04-20 23:30:00',4076,'IndiGo','6E 2555','Economy',31);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-20 06:10:00','2026-04-20 09:05:00',4478,'IndiGo','6E 2002','Economy',44),
('BLR','DEL','2026-04-20 09:00:00','2026-04-20 12:00:00',6213,'Air India','AI 502','Economy',19),
('BLR','DEL','2026-04-20 13:00:00','2026-04-20 16:00:00',9041,'Vistara','UK 811','Business',2),
('BLR','DEL','2026-04-20 16:45:00','2026-04-20 19:40:00',4131,'SpiceJet','SG 234','Economy',37),
('BLR','DEL','2026-04-20 21:00:00','2026-04-20 23:55:00',3543,'GoAir','G8 402','Economy',58);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-20 05:35:00','2026-04-20 07:45:00',4338,'IndiGo','6E 341','Economy',47),
('BOM','MAA','2026-04-20 08:40:00','2026-04-20 10:55:00',5527,'Air India','AI 543','Economy',13),
('BOM','MAA','2026-04-20 11:00:00','2026-04-20 13:15:00',3793,'SpiceJet','SG 716','Economy',79),
('BOM','MAA','2026-04-20 15:20:00','2026-04-20 17:35:00',7309,'Vistara','UK 890','Business',5),
('BOM','MAA','2026-04-20 20:00:00','2026-04-20 22:10:00',4461,'IndiGo','6E 882','Economy',31);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-20 06:00:00','2026-04-20 08:25:00',3947,'IndiGo','6E 718','Economy',66),
('HYD','DEL','2026-04-20 09:30:00','2026-04-20 11:55:00',5981,'Air India','AI 407','Economy',21),
('HYD','DEL','2026-04-20 12:45:00','2026-04-20 15:10:00',3669,'SpiceJet','SG 119','Economy',57),
('HYD','DEL','2026-04-20 16:00:00','2026-04-20 18:25:00',8276,'Vistara','UK 572','Business',10),
('HYD','DEL','2026-04-20 20:15:00','2026-04-20 22:40:00',3251,'GoAir','G8 504','Economy',40);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-20 06:45:00','2026-04-20 09:35:00',4729,'IndiGo','6E 6098','Economy',43),
('CCU','BOM','2026-04-20 08:00:00','2026-04-20 10:55:00',6267,'Air India','AI 761','Economy',28),
('CCU','BOM','2026-04-20 11:30:00','2026-04-20 14:20:00',4088,'SpiceJet','SG 624','Economy',49),
('CCU','BOM','2026-04-20 15:00:00','2026-04-20 17:55:00',9184,'Vistara','UK 765','Business',8),
('CCU','BOM','2026-04-20 19:30:00','2026-04-20 22:20:00',4845,'IndiGo','6E 6102','Economy',22);
-- ---- 2026-04-21 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-21 05:55:00','2026-04-21 08:45:00',4198,'IndiGo','6E 2228','Economy',42),
('MAA','BOM','2026-04-21 06:00:00','2026-04-21 08:55:00',5387,'Air India','AI 2896','Economy',9),
('MAA','BOM','2026-04-21 09:15:00','2026-04-21 12:10:00',3912,'SpiceJet','SG 8167','Economy',69),
('MAA','BOM','2026-04-21 14:30:00','2026-04-21 17:20:00',6943,'Vistara','UK 872','Business',11),
('MAA','BOM','2026-04-21 19:45:00','2026-04-21 22:35:00',5128,'Air India','AI 660','Economy',33);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-21 06:00:00','2026-04-21 08:05:00',3825,'IndiGo','6E 444','Economy',51),
('DEL','BOM','2026-04-21 07:30:00','2026-04-21 09:40:00',5638,'Air India','AI 101','Business',7),
('DEL','BOM','2026-04-21 10:20:00','2026-04-21 12:25:00',3417,'SpiceJet','SG 161','Economy',78),
('DEL','BOM','2026-04-21 13:15:00','2026-04-21 15:20:00',7303,'Vistara','UK 976','Business',5),
('DEL','BOM','2026-04-21 18:00:00','2026-04-21 20:10:00',3341,'GoAir','G8 311','Economy',54);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-21 05:30:00','2026-04-21 08:15:00',4317,'IndiGo','6E 2001','Economy',60),
('DEL','BLR','2026-04-21 07:00:00','2026-04-21 09:50:00',6138,'Air India','AI 501','Economy',25),
('DEL','BLR','2026-04-21 12:00:00','2026-04-21 14:45:00',8692,'Vistara','UK 810','Business',5),
('DEL','BLR','2026-04-21 15:30:00','2026-04-21 18:20:00',3714,'SpiceJet','SG 233','Economy',48),
('DEL','BLR','2026-04-21 20:45:00','2026-04-21 23:30:00',4156,'IndiGo','6E 2555','Economy',27);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-21 06:10:00','2026-04-21 09:05:00',4621,'IndiGo','6E 2002','Economy',55),
('BLR','DEL','2026-04-21 09:00:00','2026-04-21 12:00:00',6079,'Air India','AI 502','Economy',16),
('BLR','DEL','2026-04-21 13:00:00','2026-04-21 16:00:00',8894,'Vistara','UK 811','Business',10),
('BLR','DEL','2026-04-21 16:45:00','2026-04-21 19:40:00',3877,'SpiceJet','SG 234','Economy',30),
('BLR','DEL','2026-04-21 21:00:00','2026-04-21 23:55:00',3712,'GoAir','G8 402','Economy',62);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-21 05:35:00','2026-04-21 07:45:00',4056,'IndiGo','6E 341','Economy',53),
('BOM','MAA','2026-04-21 08:40:00','2026-04-21 10:55:00',5712,'Air India','AI 543','Economy',20),
('BOM','MAA','2026-04-21 11:00:00','2026-04-21 13:15:00',3561,'SpiceJet','SG 716','Economy',72),
('BOM','MAA','2026-04-21 15:20:00','2026-04-21 17:35:00',7145,'Vistara','UK 890','Business',3),
('BOM','MAA','2026-04-21 20:00:00','2026-04-21 22:10:00',4529,'IndiGo','6E 882','Economy',38);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-21 06:00:00','2026-04-21 08:25:00',4138,'IndiGo','6E 718','Economy',60),
('HYD','DEL','2026-04-21 09:30:00','2026-04-21 11:55:00',5824,'Air India','AI 407','Economy',17),
('HYD','DEL','2026-04-21 12:45:00','2026-04-21 15:10:00',3531,'SpiceJet','SG 119','Economy',65),
('HYD','DEL','2026-04-21 16:00:00','2026-04-21 18:25:00',8452,'Vistara','UK 572','Business',6),
('HYD','DEL','2026-04-21 20:15:00','2026-04-21 22:40:00',3419,'GoAir','G8 504','Economy',45);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-21 06:45:00','2026-04-21 09:35:00',4608,'IndiGo','6E 6098','Economy',36),
('CCU','BOM','2026-04-21 08:00:00','2026-04-21 10:55:00',6478,'Air India','AI 761','Economy',20),
('CCU','BOM','2026-04-21 11:30:00','2026-04-21 14:20:00',4031,'SpiceJet','SG 624','Economy',46),
('CCU','BOM','2026-04-21 15:00:00','2026-04-21 17:55:00',9307,'Vistara','UK 765','Business',2),
('CCU','BOM','2026-04-21 19:30:00','2026-04-21 22:20:00',4967,'IndiGo','6E 6102','Economy',30);
-- ---- 2026-04-22 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-22 05:55:00','2026-04-22 08:45:00',4553,'IndiGo','6E 2228','Economy',35),
('MAA','BOM','2026-04-22 06:00:00','2026-04-22 08:55:00',5119,'Air India','AI 2896','Economy',20),
('MAA','BOM','2026-04-22 09:15:00','2026-04-22 12:10:00',4043,'SpiceJet','SG 8167','Economy',64),
('MAA','BOM','2026-04-22 14:30:00','2026-04-22 17:20:00',6718,'Vistara','UK 872','Business',16),
('MAA','BOM','2026-04-22 19:45:00','2026-04-22 22:35:00',4879,'Air India','AI 660','Economy',29);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-22 06:00:00','2026-04-22 08:05:00',3673,'IndiGo','6E 444','Economy',64),
('DEL','BOM','2026-04-22 07:30:00','2026-04-22 09:40:00',5792,'Air India','AI 101','Business',12),
('DEL','BOM','2026-04-22 10:20:00','2026-04-22 12:25:00',3392,'SpiceJet','SG 161','Economy',71),
('DEL','BOM','2026-04-22 13:15:00','2026-04-22 15:20:00',7194,'Vistara','UK 976','Business',8),
('DEL','BOM','2026-04-22 18:00:00','2026-04-22 20:10:00',3509,'GoAir','G8 311','Economy',45);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-22 05:30:00','2026-04-22 08:15:00',4419,'IndiGo','6E 2001','Economy',56),
('DEL','BLR','2026-04-22 07:00:00','2026-04-22 09:50:00',5778,'Air India','AI 501','Economy',33),
('DEL','BLR','2026-04-22 12:00:00','2026-04-22 14:45:00',8521,'Vistara','UK 810','Business',9),
('DEL','BLR','2026-04-22 15:30:00','2026-04-22 18:20:00',3952,'SpiceJet','SG 233','Economy',41),
('DEL','BLR','2026-04-22 20:45:00','2026-04-22 23:30:00',4039,'IndiGo','6E 2555','Economy',38);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-22 06:10:00','2026-04-22 09:05:00',4347,'IndiGo','6E 2002','Economy',48),
('BLR','DEL','2026-04-22 09:00:00','2026-04-22 12:00:00',6391,'Air India','AI 502','Economy',23),
('BLR','DEL','2026-04-22 13:00:00','2026-04-22 16:00:00',8763,'Vistara','UK 811','Business',4),
('BLR','DEL','2026-04-22 16:45:00','2026-04-22 19:40:00',4089,'SpiceJet','SG 234','Economy',34),
('BLR','DEL','2026-04-22 21:00:00','2026-04-22 23:55:00',3588,'GoAir','G8 402','Economy',59);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-22 05:35:00','2026-04-22 07:45:00',4192,'IndiGo','6E 341','Economy',43),
('BOM','MAA','2026-04-22 08:40:00','2026-04-22 10:55:00',5449,'Air India','AI 543','Economy',17),
('BOM','MAA','2026-04-22 11:00:00','2026-04-22 13:15:00',3836,'SpiceJet','SG 716','Economy',77),
('BOM','MAA','2026-04-22 15:20:00','2026-04-22 17:35:00',7071,'Vistara','UK 890','Business',7),
('BOM','MAA','2026-04-22 20:00:00','2026-04-22 22:10:00',4306,'IndiGo','6E 882','Economy',28);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-22 06:00:00','2026-04-22 08:25:00',4014,'IndiGo','6E 718','Economy',62),
('HYD','DEL','2026-04-22 09:30:00','2026-04-22 11:55:00',6078,'Air India','AI 407','Economy',13),
('HYD','DEL','2026-04-22 12:45:00','2026-04-22 15:10:00',3724,'SpiceJet','SG 119','Economy',54),
('HYD','DEL','2026-04-22 16:00:00','2026-04-22 18:25:00',8329,'Vistara','UK 572','Business',14),
('HYD','DEL','2026-04-22 20:15:00','2026-04-22 22:40:00',3198,'GoAir','G8 504','Economy',41);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-22 06:45:00','2026-04-22 09:35:00',4871,'IndiGo','6E 6098','Economy',39),
('CCU','BOM','2026-04-22 08:00:00','2026-04-22 10:55:00',6139,'Air India','AI 761','Economy',26),
('CCU','BOM','2026-04-22 11:30:00','2026-04-22 14:20:00',4217,'SpiceJet','SG 624','Economy',53),
('CCU','BOM','2026-04-22 15:00:00','2026-04-22 17:55:00',9418,'Vistara','UK 765','Business',5),
('CCU','BOM','2026-04-22 19:30:00','2026-04-22 22:20:00',4784,'IndiGo','6E 6102','Economy',24);
-- ---- 2026-04-23 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-23 05:55:00','2026-04-23 08:45:00',4341,'IndiGo','6E 2228','Economy',46),
('MAA','BOM','2026-04-23 06:00:00','2026-04-23 08:55:00',5503,'Air India','AI 2896','Economy',11),
('MAA','BOM','2026-04-23 09:15:00','2026-04-23 12:10:00',3787,'SpiceJet','SG 8167','Economy',70),
('MAA','BOM','2026-04-23 14:30:00','2026-04-23 17:20:00',7127,'Vistara','UK 872','Business',13),
('MAA','BOM','2026-04-23 19:45:00','2026-04-23 22:35:00',5059,'Air India','AI 660','Economy',36);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-23 06:00:00','2026-04-23 08:05:00',3948,'IndiGo','6E 444','Economy',53),
('DEL','BOM','2026-04-23 07:30:00','2026-04-23 09:40:00',5871,'Air India','AI 101','Business',9),
('DEL','BOM','2026-04-23 10:20:00','2026-04-23 12:25:00',3573,'SpiceJet','SG 161','Economy',68),
('DEL','BOM','2026-04-23 13:15:00','2026-04-23 15:20:00',7361,'Vistara','UK 976','Business',4),
('DEL','BOM','2026-04-23 18:00:00','2026-04-23 20:10:00',3437,'GoAir','G8 311','Economy',52);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-23 05:30:00','2026-04-23 08:15:00',4231,'IndiGo','6E 2001','Economy',63),
('DEL','BLR','2026-04-23 07:00:00','2026-04-23 09:50:00',6022,'Air India','AI 501','Economy',27),
('DEL','BLR','2026-04-23 12:00:00','2026-04-23 14:45:00',8395,'Vistara','UK 810','Business',7),
('DEL','BLR','2026-04-23 15:30:00','2026-04-23 18:20:00',3893,'SpiceJet','SG 233','Economy',44),
('DEL','BLR','2026-04-23 20:45:00','2026-04-23 23:30:00',4112,'IndiGo','6E 2555','Economy',32);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-23 06:10:00','2026-04-23 09:05:00',4518,'IndiGo','6E 2002','Economy',51),
('BLR','DEL','2026-04-23 09:00:00','2026-04-23 12:00:00',6247,'Air India','AI 502','Economy',18),
('BLR','DEL','2026-04-23 13:00:00','2026-04-23 16:00:00',9113,'Vistara','UK 811','Business',6),
('BLR','DEL','2026-04-23 16:45:00','2026-04-23 19:40:00',4002,'SpiceJet','SG 234','Economy',40),
('BLR','DEL','2026-04-23 21:00:00','2026-04-23 23:55:00',3643,'GoAir','G8 402','Economy',56);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-23 05:35:00','2026-04-23 07:45:00',4117,'IndiGo','6E 341','Economy',50),
('BOM','MAA','2026-04-23 08:40:00','2026-04-23 10:55:00',5682,'Air India','AI 543','Economy',22),
('BOM','MAA','2026-04-23 11:00:00','2026-04-23 13:15:00',3621,'SpiceJet','SG 716','Economy',74),
('BOM','MAA','2026-04-23 15:20:00','2026-04-23 17:35:00',7283,'Vistara','UK 890','Business',9),
('BOM','MAA','2026-04-23 20:00:00','2026-04-23 22:10:00',4398,'IndiGo','6E 882','Economy',32);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-23 06:00:00','2026-04-23 08:25:00',3881,'IndiGo','6E 718','Economy',57),
('HYD','DEL','2026-04-23 09:30:00','2026-04-23 11:55:00',5916,'Air India','AI 407','Economy',19),
('HYD','DEL','2026-04-23 12:45:00','2026-04-23 15:10:00',3607,'SpiceJet','SG 119','Economy',59),
('HYD','DEL','2026-04-23 16:00:00','2026-04-23 18:25:00',8164,'Vistara','UK 572','Business',12),
('HYD','DEL','2026-04-23 20:15:00','2026-04-23 22:40:00',3338,'GoAir','G8 504','Economy',43);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-23 06:45:00','2026-04-23 09:35:00',4752,'IndiGo','6E 6098','Economy',32),
('CCU','BOM','2026-04-23 08:00:00','2026-04-23 10:55:00',6309,'Air India','AI 761','Economy',23),
('CCU','BOM','2026-04-23 11:30:00','2026-04-23 14:20:00',3981,'SpiceJet','SG 624','Economy',47),
('CCU','BOM','2026-04-23 15:00:00','2026-04-23 17:55:00',9253,'Vistara','UK 765','Business',3),
('CCU','BOM','2026-04-23 19:30:00','2026-04-23 22:20:00',4917,'IndiGo','6E 6102','Economy',27);
-- ---- 2026-04-24 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-24 05:55:00','2026-04-24 08:45:00',4482,'IndiGo','6E 2228','Economy',40),
('MAA','BOM','2026-04-24 06:00:00','2026-04-24 08:55:00',5231,'Air India','AI 2896','Economy',16),
('MAA','BOM','2026-04-24 09:15:00','2026-04-24 12:10:00',4067,'SpiceJet','SG 8167','Economy',66),
('MAA','BOM','2026-04-24 14:30:00','2026-04-24 17:20:00',6934,'Vistara','UK 872','Business',10),
('MAA','BOM','2026-04-24 19:45:00','2026-04-24 22:35:00',5173,'Air India','AI 660','Economy',30);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-24 06:00:00','2026-04-24 08:05:00',3781,'IndiGo','6E 444','Economy',60),
('DEL','BOM','2026-04-24 07:30:00','2026-04-24 09:40:00',5724,'Air India','AI 101','Business',15),
('DEL','BOM','2026-04-24 10:20:00','2026-04-24 12:25:00',3308,'SpiceJet','SG 161','Economy',74),
('DEL','BOM','2026-04-24 13:15:00','2026-04-24 15:20:00',7278,'Vistara','UK 976','Business',1),
('DEL','BOM','2026-04-24 18:00:00','2026-04-24 20:10:00',3594,'GoAir','G8 311','Economy',47);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-24 05:30:00','2026-04-24 08:15:00',4374,'IndiGo','6E 2001','Economy',59),
('DEL','BLR','2026-04-24 07:00:00','2026-04-24 09:50:00',6087,'Air India','AI 501','Economy',24),
('DEL','BLR','2026-04-24 12:00:00','2026-04-24 14:45:00',8638,'Vistara','UK 810','Business',4),
('DEL','BLR','2026-04-24 15:30:00','2026-04-24 18:20:00',3769,'SpiceJet','SG 233','Economy',43),
('DEL','BLR','2026-04-24 20:45:00','2026-04-24 23:30:00',3977,'IndiGo','6E 2555','Economy',36);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-24 06:10:00','2026-04-24 09:05:00',4463,'IndiGo','6E 2002','Economy',45),
('BLR','DEL','2026-04-24 09:00:00','2026-04-24 12:00:00',6174,'Air India','AI 502','Economy',20),
('BLR','DEL','2026-04-24 13:00:00','2026-04-24 16:00:00',8837,'Vistara','UK 811','Business',8),
('BLR','DEL','2026-04-24 16:45:00','2026-04-24 19:40:00',4048,'SpiceJet','SG 234','Economy',38),
('BLR','DEL','2026-04-24 21:00:00','2026-04-24 23:55:00',3571,'GoAir','G8 402','Economy',61);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-24 05:35:00','2026-04-24 07:45:00',4273,'IndiGo','6E 341','Economy',48),
('BOM','MAA','2026-04-24 08:40:00','2026-04-24 10:55:00',5561,'Air India','AI 543','Economy',15),
('BOM','MAA','2026-04-24 11:00:00','2026-04-24 13:15:00',3729,'SpiceJet','SG 716','Economy',80),
('BOM','MAA','2026-04-24 15:20:00','2026-04-24 17:35:00',7049,'Vistara','UK 890','Business',4),
('BOM','MAA','2026-04-24 20:00:00','2026-04-24 22:10:00',4493,'IndiGo','6E 882','Economy',37);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-24 06:00:00','2026-04-24 08:25:00',4072,'IndiGo','6E 718','Economy',64),
('HYD','DEL','2026-04-24 09:30:00','2026-04-24 11:55:00',5963,'Air India','AI 407','Economy',16),
('HYD','DEL','2026-04-24 12:45:00','2026-04-24 15:10:00',3493,'SpiceJet','SG 119','Economy',58),
('HYD','DEL','2026-04-24 16:00:00','2026-04-24 18:25:00',8391,'Vistara','UK 572','Business',9),
('HYD','DEL','2026-04-24 20:15:00','2026-04-24 22:40:00',3276,'GoAir','G8 504','Economy',39);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-24 06:45:00','2026-04-24 09:35:00',4693,'IndiGo','6E 6098','Economy',42),
('CCU','BOM','2026-04-24 08:00:00','2026-04-24 10:55:00',6421,'Air India','AI 761','Economy',29),
('CCU','BOM','2026-04-24 11:30:00','2026-04-24 14:20:00',4122,'SpiceJet','SG 624','Economy',44),
('CCU','BOM','2026-04-24 15:00:00','2026-04-24 17:55:00',9136,'Vistara','UK 765','Business',7),
('CCU','BOM','2026-04-24 19:30:00','2026-04-24 22:20:00',4859,'IndiGo','6E 6102','Economy',25);
-- ---- 2026-04-25 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-25 05:55:00','2026-04-25 08:45:00',4219,'IndiGo','6E 2228','Economy',48),
('MAA','BOM','2026-04-25 06:00:00','2026-04-25 08:55:00',5362,'Air India','AI 2896','Economy',10),
('MAA','BOM','2026-04-25 09:15:00','2026-04-25 12:10:00',3954,'SpiceJet','SG 8167','Economy',72),
('MAA','BOM','2026-04-25 14:30:00','2026-04-25 17:20:00',7052,'Vistara','UK 872','Business',15),
('MAA','BOM','2026-04-25 19:45:00','2026-04-25 22:35:00',4812,'Air India','AI 660','Economy',32);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-25 06:00:00','2026-04-25 08:05:00',3857,'IndiGo','6E 444','Economy',56),
('DEL','BOM','2026-04-25 07:30:00','2026-04-25 09:40:00',5643,'Air India','AI 101','Business',11),
('DEL','BOM','2026-04-25 10:20:00','2026-04-25 12:25:00',3447,'SpiceJet','SG 161','Economy',69),
('DEL','BOM','2026-04-25 13:15:00','2026-04-25 15:20:00',7129,'Vistara','UK 976','Business',6),
('DEL','BOM','2026-04-25 18:00:00','2026-04-25 20:10:00',3362,'GoAir','G8 311','Economy',51);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-25 05:30:00','2026-04-25 08:15:00',4293,'IndiGo','6E 2001','Economy',62),
('DEL','BLR','2026-04-25 07:00:00','2026-04-25 09:50:00',5941,'Air India','AI 501','Economy',30),
('DEL','BLR','2026-04-25 12:00:00','2026-04-25 14:45:00',8481,'Vistara','UK 810','Business',2),
('DEL','BLR','2026-04-25 15:30:00','2026-04-25 18:20:00',3829,'SpiceJet','SG 233','Economy',46),
('DEL','BLR','2026-04-25 20:45:00','2026-04-25 23:30:00',4198,'IndiGo','6E 2555','Economy',28);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-25 06:10:00','2026-04-25 09:05:00',4387,'IndiGo','6E 2002','Economy',52),
('BLR','DEL','2026-04-25 09:00:00','2026-04-25 12:00:00',6328,'Air India','AI 502','Economy',14),
('BLR','DEL','2026-04-25 13:00:00','2026-04-25 16:00:00',9072,'Vistara','UK 811','Business',1),
('BLR','DEL','2026-04-25 16:45:00','2026-04-25 19:40:00',4117,'SpiceJet','SG 234','Economy',43),
('BLR','DEL','2026-04-25 21:00:00','2026-04-25 23:55:00',3698,'GoAir','G8 402','Economy',53);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-25 05:35:00','2026-04-25 07:45:00',4081,'IndiGo','6E 341','Economy',41),
('BOM','MAA','2026-04-25 08:40:00','2026-04-25 10:55:00',5478,'Air India','AI 543','Economy',23),
('BOM','MAA','2026-04-25 11:00:00','2026-04-25 13:15:00',3917,'SpiceJet','SG 716','Economy',76),
('BOM','MAA','2026-04-25 15:20:00','2026-04-25 17:35:00',7198,'Vistara','UK 890','Business',11),
('BOM','MAA','2026-04-25 20:00:00','2026-04-25 22:10:00',4342,'IndiGo','6E 882','Economy',29);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-25 06:00:00','2026-04-25 08:25:00',3994,'IndiGo','6E 718','Economy',68),
('HYD','DEL','2026-04-25 09:30:00','2026-04-25 11:55:00',6037,'Air India','AI 407','Economy',10),
('HYD','DEL','2026-04-25 12:45:00','2026-04-25 15:10:00',3651,'SpiceJet','SG 119','Economy',53),
('HYD','DEL','2026-04-25 16:00:00','2026-04-25 18:25:00',8218,'Vistara','UK 572','Business',16),
('HYD','DEL','2026-04-25 20:15:00','2026-04-25 22:40:00',3413,'GoAir','G8 504','Economy',46);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-25 06:45:00','2026-04-25 09:35:00',4638,'IndiGo','6E 6098','Economy',34),
('CCU','BOM','2026-04-25 08:00:00','2026-04-25 10:55:00',6198,'Air India','AI 761','Economy',21),
('CCU','BOM','2026-04-25 11:30:00','2026-04-25 14:20:00',4059,'SpiceJet','SG 624','Economy',50),
('CCU','BOM','2026-04-25 15:00:00','2026-04-25 17:55:00',9374,'Vistara','UK 765','Business',1),
('CCU','BOM','2026-04-25 19:30:00','2026-04-25 22:20:00',4791,'IndiGo','6E 6102','Economy',28);
-- ---- 2026-04-26 ----
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('MAA','BOM','2026-04-26 05:55:00','2026-04-26 08:45:00',4416,'IndiGo','6E 2228','Economy',37),
('MAA','BOM','2026-04-26 06:00:00','2026-04-26 08:55:00',5147,'Air India','AI 2896','Economy',22),
('MAA','BOM','2026-04-26 09:15:00','2026-04-26 12:10:00',4139,'SpiceJet','SG 8167','Economy',67),
('MAA','BOM','2026-04-26 14:30:00','2026-04-26 17:20:00',6879,'Vistara','UK 872','Business',8),
('MAA','BOM','2026-04-26 19:45:00','2026-04-26 22:35:00',5091,'Air India','AI 660','Economy',34);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BOM','2026-04-26 06:00:00','2026-04-26 08:05:00',3709,'IndiGo','6E 444','Economy',61),
('DEL','BOM','2026-04-26 07:30:00','2026-04-26 09:40:00',5819,'Air India','AI 101','Business',13),
('DEL','BOM','2026-04-26 10:20:00','2026-04-26 12:25:00',3371,'SpiceJet','SG 161','Economy',75),
('DEL','BOM','2026-04-26 13:15:00','2026-04-26 15:20:00',7417,'Vistara','UK 976','Business',3),
('DEL','BOM','2026-04-26 18:00:00','2026-04-26 20:10:00',3521,'GoAir','G8 311','Economy',48);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('DEL','BLR','2026-04-26 05:30:00','2026-04-26 08:15:00',4441,'IndiGo','6E 2001','Economy',55),
('DEL','BLR','2026-04-26 07:00:00','2026-04-26 09:50:00',5814,'Air India','AI 501','Economy',28),
('DEL','BLR','2026-04-26 12:00:00','2026-04-26 14:45:00',8553,'Vistara','UK 810','Business',6),
('DEL','BLR','2026-04-26 15:30:00','2026-04-26 18:20:00',3941,'SpiceJet','SG 233','Economy',42),
('DEL','BLR','2026-04-26 20:45:00','2026-04-26 23:30:00',4083,'IndiGo','6E 2555','Economy',30);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BLR','DEL','2026-04-26 06:10:00','2026-04-26 09:05:00',4502,'IndiGo','6E 2002','Economy',47),
('BLR','DEL','2026-04-26 09:00:00','2026-04-26 12:00:00',6291,'Air India','AI 502','Economy',17),
('BLR','DEL','2026-04-26 13:00:00','2026-04-26 16:00:00',8961,'Vistara','UK 811','Business',9),
('BLR','DEL','2026-04-26 16:45:00','2026-04-26 19:40:00',4073,'SpiceJet','SG 234','Economy',36),
('BLR','DEL','2026-04-26 21:00:00','2026-04-26 23:55:00',3629,'GoAir','G8 402','Economy',57);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('BOM','MAA','2026-04-26 05:35:00','2026-04-26 07:45:00',4204,'IndiGo','6E 341','Economy',46),
('BOM','MAA','2026-04-26 08:40:00','2026-04-26 10:55:00',5638,'Air India','AI 543','Economy',18),
('BOM','MAA','2026-04-26 11:00:00','2026-04-26 13:15:00',3784,'SpiceJet','SG 716','Economy',73),
('BOM','MAA','2026-04-26 15:20:00','2026-04-26 17:35:00',7317,'Vistara','UK 890','Business',6),
('BOM','MAA','2026-04-26 20:00:00','2026-04-26 22:10:00',4457,'IndiGo','6E 882','Economy',33);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('HYD','DEL','2026-04-26 06:00:00','2026-04-26 08:25:00',4057,'IndiGo','6E 718','Economy',65),
('HYD','DEL','2026-04-26 09:30:00','2026-04-26 11:55:00',5898,'Air India','AI 407','Economy',24),
('HYD','DEL','2026-04-26 12:45:00','2026-04-26 15:10:00',3577,'SpiceJet','SG 119','Economy',56),
('HYD','DEL','2026-04-26 16:00:00','2026-04-26 18:25:00',8307,'Vistara','UK 572','Business',13),
('HYD','DEL','2026-04-26 20:15:00','2026-04-26 22:40:00',3224,'GoAir','G8 504','Economy',41);
INSERT INTO "Flight" (source,destination,departure_time,arrival_time,fare,airline,flight_no,class,seats_available) VALUES
('CCU','BOM','2026-04-26 06:45:00','2026-04-26 09:35:00',4789,'IndiGo','6E 6098','Economy',38),
('CCU','BOM','2026-04-26 08:00:00','2026-04-26 10:55:00',6073,'Air India','AI 761','Economy',32),
('CCU','BOM','2026-04-26 11:30:00','2026-04-26 14:20:00',4143,'SpiceJet','SG 624','Economy',45),
('CCU','BOM','2026-04-26 15:00:00','2026-04-26 17:55:00',9198,'Vistara','UK 765','Business',5),
('CCU','BOM','2026-04-26 19:30:00','2026-04-26 22:20:00',4932,'IndiGo','6E 6102','Economy',23);