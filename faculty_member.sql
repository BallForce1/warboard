USE ataylor;

LOCK TABLES faculty_member WRITE;

SET foreign_key_checks = 0;

INSERT INTO faculty_member VALUES
('Kristina', 'Chung', '928640051'),
('Paige', 'Chen', '954978588'),
('Sherri', 'Melton', '010566317'),
('Gretchen', 'Hill', '211377271'),
('Karen', 'Puckett', '155749572'),
('Patrick', 'Song', '382113623'),
('Elsie', 'Hamilton', '945232373'),
('Hazel', 'Bender', '967669742'),
('Malcolm', 'Wagner', '335812465'),
('Dolores', 'McLaughlin', '615613471'),
('Francis', 'McNamara', '631922351'),
('Sandy', 'Raynor', '509815378'),
('Marion', 'Moon', '221626259'),
('Beth', 'Woodard', '598983592'),
('Julia', 'Desai', '412477220'),
('Jerome', 'Wallace', '413208016'),
('Neal', 'Lawrence', '700477385'),
('Jean', 'Griffin', '252522296'),
('Kristine', 'Dougherty', '585339683'),
('Crystal', 'Powers', '529996778'),
('Alex', 'May', '194418197'),
('Eric', 'Steele', '889101252'),
('Wesley', 'Teague', '147188476'),
('Franklin', 'Vick', '636584309'),
('Claire', 'Gallagher', '106613170'),
('Marian', 'Solomon', '332763363'),
('Marcia', 'Walsh', '100603246'),
('Dwight', 'Monroe', '120489214'),
('Wayne', 'Connolly', '642490803'),
('Stephanie', 'Hawkins', '486211120'),
('Neal', 'Middleton', '850237605'),
('Gretchen', 'Goldstein', '995255971'),
('Tim', 'Watts', '070079976'),
('Jerome', 'Johnston', '090826936'),
('Shelley', 'Weeks', '330579581'),
('Priscilla', 'Wilkerson', '812033005'),
('Elsie', 'Barton', '987126061'),
('Beth', 'Walton', '416932854'),
('Erica', 'Hall', '059148715'),
('Douglas', 'Ross', '396771195'),
('Donald', 'Chung', '820441717'),
('Katherine', 'Bender', '498017905'),
('Paul', 'Woods', '573831076');

SET foreign_key_checks = 1;

UNLOCK TABLES;

