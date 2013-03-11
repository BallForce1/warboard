USE warboard

LOCK TABLES employee WRITE;

SET foreign_key_checks = 0;

INSERT INTO employee VALUES
('Alex', 'Taylor', '001640163'),
('Sean', 'Robbins', '001841000');

SET foreign_key_checks = 1;

UNLOCK TABLES;

  