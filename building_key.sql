use warboard;

LOCK TABLES building_key WRITE;

SET foreign_key_checks = 0;

INSERT INTO building_key VALUES
<<<<<<< HEAD
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
=======
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
>>>>>>> e5485b03e3061492ad528e8332b9d2f8682f0f52

SET foreign_key_checks = 1;

UNLOCK TABLES
