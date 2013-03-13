USE warboard;

LOCK TABLES cart WRITE;

SET foreign_key_checks = 0;

INSERT INTO cart VALUES
('MAC 1', 'MAC', 'Schulz', '1014'),
('MAC 2', 'MAC', 'Stevenson', '1036'),
('MAC 3', 'MAC', 'Stevenson', '1036'),
('MAC 4', 'MAC', 'Carson', '66'),
('MAC 5', 'MAC', 'Nichols', '203'),
('MAC 6', 'MAC', 'Ives', '12'),
('COMMONS MAC', 'MAC', 'Schulz', '1014'),

('DP 1', 'DP', 'Schulz', '1014'),
('DP 2', 'DP', 'Stevenson', '1036'),
('DP 3', 'DP', 'Stevenson', '1036'),
('DP 4', 'DP', 'Ives', '12'),
('DP 5', 'DP', 'Carson', '66'),
('DP 6', 'DP', 'Nichols', '203'),
('IVES DP', 'DP', 'Ives', '12'),

('ROVER 1', 'ROVER', 'Schulz', '1014'),
('ROVER 2', 'ROVER', 'Stevenson', '1014'),
('ROVER 3', 'ROVER', 'Ives', '12'),

('DP COMBO 1', 'DP COMBO', 'Schulz', '1014'),
('DP COMBO 2', 'DP COMBO', 'Ives', '12'),
('DP COMBO 3', 'DP COMBO', 'Nichols', '203');

SET foreign_key_checks = 1;

UNLOCK TABLES

