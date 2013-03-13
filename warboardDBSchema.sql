use warboard;
BEGIN;
set @@foreign_key_checks = 0;

DROP TABLE IF EXISTS buildings;

CREATE TABLE buildings (
	building_name		varchar(20)		NOT NULL UNIQUE,
	building_abbr		varchar(5)		NOT NULL UNIQUE,
    store_room_number   varchar(5),
    key_number          varchar(2)      NOT NULL,
    PRIMARY KEY(building_name)
);
ALTER TABLE buildings ADD CONSTRAINT store_room_number_refs_room_number FOREIGN KEY (store_room_number) REFERENCES room (room_number);
ALTER TABLE buildings ADD CONSTRAINT key_number_refs_key_number FOREIGN KEY (key_number) REFERENCES building_key (key_number);

DROP TABLE IF EXISTS room;

CREATE TABLE room (
	building_abbr		varchar(20)		NOT NULL,
	room_number			varchar(5)		NOT NULL,
	PRIMARY KEY(building_abbr, room_number)
);	
ALTER TABLE room ADD CONSTRAINT building_abbr_refs_building_abbr FOREIGN KEY (building_abbr) REFERENCES buildings (building_abbr);

DROP TABLE IF EXISTS faculty_member;

CREATE TABLE faculty_member (
	first_name		varchar(50)			NOT NULL,
	last_name		varchar(50)			NOT NULL,
	faculty_id		varchar(9)			NOT NULL UNIQUE,
	PRIMARY KEY(faculty_id)
);		

CREATE INDEX faculty_index ON faculty_member(faculty_id);

DROP TABLE IF EXISTS cart;

CREATE TABLE cart (
	cart_id			varchar(20)		NOT NULL,
	cart_type	    varchar(10)	    NOT NULL,
    building_name   varchar(20)      NOT NULL,
    room_num		varchar(5)		NOT NULL,
	PRIMARY KEY(cart_id)
);

ALTER TABLE cart ADD CONSTRAINT cart_type_name_refs_cart_type_cart_type_name FOREIGN KEY (cart_type) REFERENCES cart_type (cart_type_name);
ALTER TABLE cart ADD CONSTRAINT room_num_refs_room_number FOREIGN KEY (room_num) REFERENCES room (room_number);
ALTER TABLE cart ADD CONSTRAINT building_name_refs_building_name FOREIGN KEY (building_name) REFERENCES buildings (building_abbr);

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

DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
	first_name		varchar(50)			NOT NULL,
	last_name		varchar(50)			NOT NULL,
	employee_id		varchar(9)			NOT NULL UNIQUE,
	PRIMARY KEY(employee_id)
);

CREATE INDEX employee_index ON employee(employee_id);

DROP TABLE IF EXISTS course; 

CREATE TABLE course (
	course_number		varchar(4)		NOT NULL,
	subject_abbr		varchar(5)		NOT NULL,
	cat_number			varchar(5)		NOT NULL,
	section_number		int				NOT NULL,
	course_title		varchar(50)		NOT NULL,
	number_units		int				NOT NULL,
	days_of_week		varchar(5)		NOT NULL,
	building_abbr		varchar(5)		NOT NULL,
	room_number			varchar(5)		NOT NULL,
	start_time			time,		
	end_time			time,		
	faculty_id			varchar(9)     NOT NULL,
	PRIMARY KEY(course_number)
);

ALTER TABLE course ADD CONSTRAINT building_abbr_refs_building_abbr FOREIGN KEY (building_abbr) REFERENCES buildings (building_abbr);
ALTER TABLE course ADD CONSTRAINT room_number_refs_room_number FOREIGN KEY (room_number) REFERENCES room (room_number);
ALTER TABLE course ADD CONSTRAINT faculty_id_refs_faculty_id FOREIGN KEY (faculty_id) REFERENCES faculty_member (faculty_id);

CREATE INDEX course_index ON course(course_number);

DROP TABLE IF EXISTS delivery;

CREATE TABLE delivery (
    delivery_number     varchar(4)      NOT NULL,
    start_date          date            NOT NULL,
    end_date            date            NOT NULL,
    is_approved         varchar(1)      NOT NULL,
    course_number       varchar(4)      NOT NULL,
    cart_type           varchar(10)     NOT NULL,
    employee_id         varchar(9)      NOT NULL,
    faculty_id          varchar(50)     NOT NULL,
    key_number          varchar(2)      NOT NULL,
    PRIMARY KEY(delivery_number)
);
ALTER TABLE delivery ADD CONSTRAINT key_number_refs_key_number FOREIGN KEY (key_number) REFERENCES building_key (key_number);
ALTER TABLE delivery ADD CONSTRAINT employee_id_refs_employee_id FOREIGN KEY (employee_id) REFERENCES employee (employee_id);
ALTER TABLE delivery ADD CONSTRAINT faculty_id_refs_faculty_id FOREIGN KEY (faculty_id) REFERENCES faculty_member (faculty_id);
ALTER TABLE delivery ADD CONSTRAINT course_number_refs_course_number FOREIGN KEY (course_number) REFERENCES course (course_number);
ALTER TABLE delivery ADD CONSTRAINT cart_type_refs_cart_type FOREIGN KEY (cart_type) REFERENCES cart_type (cart_type);

CREATE INDEX delivery_index ON delivery(delivery_number);

DROP TABLE IF EXISTS building_key;

CREATE TABLE building_key (
    key_number      varchar(2)      NOT NULL,
    building_name   varchar(20)      NOT NULL,
    PRIMARY KEY(key_number)
);

set @@foreign_key_checks = 1;

COMMIT;

