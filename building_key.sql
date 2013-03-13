use warboard;

LOCK TABLES building_key WRITE;

SET foreign_key_checks = 0;

INSERT INTO building_key VALUES
('01','DAR'),
('02','STEV'),
('03','SCHLZ'),
('04','CAR'),
('05','NICH'),
('06','SALZ'),
('07','GMC'),
('08','PE'),
('09','IVES'),
('10','ART');

SET foreign_key_checks = 1;

UNLOCK TABLES
