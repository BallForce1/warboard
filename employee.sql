USE warboard

LOCK TABLES employee WRITE;

SET foreign_key_checks = 0;

INSERT INTO employee VALUES
('Alex', 'Taylor', '001640163'),
('Sean', 'Robbins','001841000'),
('Rick', 'James', '123457654'),
('Nancy','Palocy' ,'123212343'),
('Oscar', 'Myers', '456543457'),
('Rick' , 'Grimes','234567890'),
('Carl', 'Grimes', '567689098'),
('Glen', 'Walker', '345234132'),
('Andrea', 'Toss', '000789876'),
('Stacey', 'Betsy', '003045021');

SET foreign_key_checks = 1;

UNLOCK TABLES;

  
