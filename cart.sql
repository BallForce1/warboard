USE warboard;

LOCK TABLES cart WRITE;

SET foreign_key_checks = 0;

INSERT INTO cart VALUES
('MAC 1', 'MAC', 'SCHLZ', '1014'),
('MAC 2', 'MAC', 'SCHLZ', '1014'),
('MAC 3', 'MAC', 'SCHLZ', '1014'),
('MAC 4', 'MAC', 'SCHLZ', '1014'),
('MAC 5', 'MAC', 'SCHLZ', '1014'),
('MAC 6', 'MAC', 'SCHLZ', '1014'),
('COMMONS MAC', 'MAC', 'SCHLZ', '1014'),

('DP 1', 'DP', 'SCHLZ', '1014'),
('DP 2', 'DP', 'SCHLZ', '1014'),
('DP 3', 'DP', 'SCHLZ', '1014'),
('DP 4', 'DP', 'SCHLZ', '1014'),
('DP 5', 'DP', 'SCHLZ', '1014'),
('DP 6', 'DP', 'SCHLZ', '1014'),
('IVES DP', 'DP', 'SCHLZ', '1014'),

('ROVER 1', 'ROVER', 'SCHLZ', '1014'),
('ROVER 2', 'ROVER', 'SCHLZ', '1014'),
('ROVER 3', 'ROVER', 'SCHLZ', '1014'),

('DP COMBO 1', 'DP COMBO', 'SCHLZ', '1014'),
('DP COMBO 2', 'DP COMBO', 'SCHLZ', '1014'),
('DP COMBO 3', 'DP COMBO', 'SCHLZ', '1014');

SET foreign_key_checks = 1;

UNLOCK TABLES

