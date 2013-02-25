USE warboard;

LOCK TABLES room WRITE;

SET foreign_key_checks = 0;

INSERT INTO room VALUES
('STEV', '2001'),
('STEV', '2075'),
('STEV', '2079'),
('STEV', '2083'),
('STEV', '2091'),
('STEV', '3015'),
('STEV', '3028'),
('STEV', '3038'),
('STEV', '3040'),
('STEV', '3042'),
('STEV', '3044'),
('STEV', '3049'),
('STEV', '3077'),
('STEV', '3095'),

('SALZ', '1061'),

('PE', '1'),
('PE', '15'),
('PE', '38'),

('NICH', '166'),
('NICH', '204'),
('NICH', '225'),
('NICH', '242'),
('NICH', '304'),

('IVES', '24'),
('IVES', '34'),
('IVES', '35'),
('IVES', '45'),
('IVES', '76'),
('IVES', '78'),
('IVES', '79'),
('IVES', '80'),
('IVES', '119'),

('DAR', '3'),
('DAR', '4'),
('DAR', '22'),
('DAR', '109'),
('DAR', '128'),

('CAR', '1'),
('CAR', '10'),
('CAR', '14'),
('CAR', '25'),
('CAR', '30'),
('CAR', '44d'),
('CAR', '69'),

('ART', '109'),
('ART', '113'),
('ART', '120'),
('ART', '129'),
('ART', '130'),
('ART', '135'),
('ART', '136'),
('ART', '144'),
('ART', '145');

SET foreign_key_checks = 1;

UNLOCK TABLES


