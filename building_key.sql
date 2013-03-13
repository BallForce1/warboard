use warboard;

LOCK TABLES building_key WRITE;

SET foreign_key_checks = 0;

INSERT INTO building_key VALUES
('01','Darwin'),
('02','Stevenson'),
('03','Schulz'),
('04','Carson'),
('05','Nichols'),
('06','Salazar'),
('07','Green Music Center'),
('08','Physical Education'),
('09','Ives'),
('10','Art');

SET foreign_key_checks = 1;

UNLOCK TABLES
