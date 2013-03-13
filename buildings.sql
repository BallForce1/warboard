USE warboard;

LOCK TABLES buildings WRITE;

SET foreign_key_checks = 0;

INSERT INTO buildings VALUES
('Darwin', 'DAR', '147', '01'),
('Stevenson', 'STEV', '1036', '02'),
('Schulz', 'SCHLZ', '1014', '03'),
('Carson', 'CAR', '66', '04'),
('Nichols', 'NICH', '203', '05'),
('Salazar', 'SALZ', '2037b', '06'),
('Green Music Center', 'GMC', '1018', '07'),
('Physical Education', 'PE', '12', '08'),
('Ives', 'IVES', '12', '09'),
('Art', 'ART', null, '10' );

SET foreign_key_checks = 1;

UNLOCK TABLES


