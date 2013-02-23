use ataylor;
BEGIN;
set @@foreign_key_checks = 0;

DROP TABLE IF EXISTS buildings;

CREATE TABLE buildings (
	building_name		varchar(20)		NOT NULL PRIMARY KEY,
	building_abbr		varchar(5)		NOT NULL UNIQUE
);

DROP TABLE IF EXISTS rooms;

CREATE TABLE rooms (
	building_abbr		varchar(20)		NOT NULL,
	room_number			varchar(5)		NOT NULL,
	PRIMARY KEY(building_abbr, room_number)
);	

ALTER TABLE rooms ADD CONSTRAINT room_bName_refs_building_bName FOREIGN KEY (building_abbr) REFERENCES buildings (building_abbr);

DROP TABLE IF EXISTS faculty_member;

CREATE TABLE faculty_member (
	first_name		varchar(50)			NOT NULL,
	last_name		varchar(50)			NOT NULL,
	employee_id		varchar(9)			NOT NULL UNIQUE,
	PRIMARY KEY(employee_id)
);		

DROP TABLE IF EXISTS cart;

CREATE TABLE cart (
	cart_id			varchar(20)			NOT NULL,
	cart_type	varchar(10)			NOT NULL,
	PRIMARY KEY(cart_id)
);

ALTER TABLE cart ADD CONSTRAINT cart_type_name_refs_cart_type_cart_type_name FOREIGN KEY (cart_type) REFERENCES cart_type (cart_type_name);

DROP TABLE IF EXISTS cart_type;

CREATE TABLE cart_type (
	cart_type_name			varchar(10)			NOT NULL,
	PRIMARY KEY(cart_type_name)
);

DROP TABLE IF EXISTS cart_equipment;

CREATE TABLE cart_equipment (
	cart_type			varchar(10),
	equipment_name		varchar(20),
	PRIMARY KEY(equipment_name, cart_type)
);

ALTER TABLE rooms ADD CONSTRAINT room_bName_refs_building_bName FOREIGN KEY (building_abbr) REFERENCES buildings (building_abbr);

DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
	first_name		varchar(50)			NOT NULL,
	last_name		varchar(50)			NOT NULL,
	employee_id		varchar(9)			NOT NULL UNIQUE,
	PRIMARY KEY(employee_id)
);

set @@foreign_key_checks = 1;

COMMIT;

