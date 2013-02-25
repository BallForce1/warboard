USE warboard;

LOCK TABLES cart WRITE;

SET foreign_key_checks = 0;

INSERT INTO cart VALUES
('MAC 1', 'MAC'),
('MAC 2', 'MAC'),
('MAC 3', 'MAC'),
('MAC 4', 'MAC'),
('MAC 5', 'MAC'),
('MAC 6', 'MAC'),
('COMMONS MAC', 'MAC'),

('DP 1', 'DP'),
('DP 2', 'DP'),
('DP 3', 'DP'),
('DP 4', 'DP'),
('DP 5', 'DP'),
('DP 6', 'DP'),
('IVES DP', 'DP'),

('ROVER 1', 'ROVER'),
('ROVER 2', 'ROVER'),
('ROVER 3', 'ROVER'),

('DP COMBO 1', 'DP COMBO'),
('DP COMBO 2', 'DP COMBO'),
('DP COMBO 3', 'DP COMBO');

SET foreign_key_checks = 1;

UNLOCK TABLES

