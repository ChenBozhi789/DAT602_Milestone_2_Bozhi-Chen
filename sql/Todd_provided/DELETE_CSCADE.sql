-- This script is for login function
drop database if exists cascade_tester;
create database cascade_tester;

use cascade_tester;

-- STEP 0
DROP TABLE IF EXISTS buildings;
DROP TABLE IF EXISTS buildings;


CREATE TABLE buildings (
    building_no INT PRIMARY KEY AUTO_INCREMENT,
    building_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE rooms (
    room_no INT PRIMARY KEY AUTO_INCREMENT,
    room_name VARCHAR(255) NOT NULL,
    building_no INT NOT NULL,
    FOREIGN KEY (building_no)
        REFERENCES buildings (building_no)
        ON DELETE CASCADE
);

INSERT INTO buildings(building_name, address) 
VALUES 
('ACME Headquaters','3950 North 1st Street CA 95134'),
('ACME Sales','5000 North 1st Street CA 95134');
      
SELECT *
FROM buildings