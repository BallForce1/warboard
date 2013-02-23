USE ataylor;

LOCK TABLES cart_equipment WRITE;

SET foreign_key_checks = 0;

INSERT INTO cart_equipment VALUES

('MAC', 'Data Projector'),
('MAC', 'Mac Mini'),
('MAC', 'Mouse'),
('MAC', 'Keyboard'),

('DP', 'Data Projector'),

('DP COMBO', 'Data Projector'),
('DP COMBO', 'DVD/VHS Player'),

('ROVER', 'Data Projector'),
('ROVER', 'DVD Player'),
('ROVER', 'Speakers'),

('TV', 'Television'),
('TV', 'DVD/VHS Player');

SET foreign_key_checks = 1;

UNLOCK TABLES

