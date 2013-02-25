USE warboard;

LOCK TABLES cart_type WRITE;

SET foreign_key_checks = 0;

INSERT INTO cart_type VALUES

('MAC'),
('DP'),
('DP COMBO'),
('ROVER'),
('TV');

SET foreign_key_checks = 1;

UNLOCK TABLES

