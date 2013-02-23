USE ataylor;

LOCK TABLES buildings WRITE;

SET foreign_key_checks = 0;

INSERT INTO buildings VALUES
('Darwin', 'DAR'),
('Stevenson', 'STEV'),
('Schulz', 'SCHLZ'),
('Carson', 'CAR'),
('Nichols', 'NICH'),
('Salazar', 'SALZ'),
('Green Music Center', 'GMC'),
('Physical Education', 'PE'),
('Ives', 'IVES'),
('Art', 'ART');

SET foreign_key_checks = 1;

UNLOCK TABLES


