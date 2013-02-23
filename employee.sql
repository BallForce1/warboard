USE ataylor

LOCK TABLES faculty_member WRITE;

SET foreign_key_checks = 0;

INSERT INTO faculty_member VALUES
('Alex', 'Taylor', '001640163'),
('Sean', 'Robbins', '001841000');

SET foreign_key_checks = 1;

UNLOCK TABLES;

  