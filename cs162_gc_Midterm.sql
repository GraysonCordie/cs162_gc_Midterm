#HEADER
#Program Name: Midterm SQL Script
#Author: Grayson Cordie
#Class: CS162 Spring 2021
#Date: 5/18/2021
#Description: MySQL script for Midterm database.

/*PSUEDOCODE(?)
	1. Create database. Always drops previous before creating.
    2. Use simplesheets database.
    3. Create tables.
    4. Add foriegn key constraints where needed.
*/



DROP DATABASE IF EXISTS simplesheets; #reset entire database on run
CREATE DATABASE IF NOT EXISTS simplesheets;
USE simplesheets;


CREATE TABLE IF NOT EXISTS person (
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    type varchar(20) NOT NULL,
    birthdate date
);

CREATE TABLE IF NOT EXISTS address (
	id int NOT NULL,
	personId int NOT NULL,
	line_1 varchar(50) NOT NULL, 
	line_2 varchar(50), 
    city varchar(30) NOT NULL,
    state varchar(30) NOT NULL,
    country varchar(30) NOT NULL,
    PRIMARY KEY(id, personId)
);

CREATE TABLE IF NOT EXISTS order_ (
	id int PRIMARY KEY AUTO_INCREMENT,
    personId int NOT NULL,
    addressId int NOT NULL,
    orderDate date NOT NULL,
    orderStatus int NOT NULL
);

CREATE TABLE IF NOT EXISTS item (
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(20) NOT NULL,
    description varchar(200),
    price int NOT NULL,
    quantity int NOT NULL,
    onHold int NOT NULL    
);

CREATE TABLE IF NOT EXISTS line_item (
	orderId int NOT NULL,
    itemId int NOT NULL,
    quantity int NOT NULL,
    PRIMARY KEY(orderId, itemId)
);


ALTER TABLE address ADD CONSTRAINT FOREIGN KEY (personId) REFERENCES person (id);

ALTER TABLE order_ ADD CONSTRAINT FOREIGN KEY (personId) REFERENCES person (id);
ALTER TABLE order_ ADD CONSTRAINT FOREIGN KEY (addressId) REFERENCES address (id);

ALTER TABLE line_item ADD CONSTRAINT FOREIGN KEY (orderId) REFERENCES order_ (id);
ALTER TABLE line_item ADD CONSTRAINT FOREIGN KEY (itemId) REFERENCES item (id);


/* FOOTER
Didn't feel like inserting data so nothing shows up on run. But no errors occur when creating database.
*/