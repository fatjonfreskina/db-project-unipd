-- Database Creation
CREATE DATABASE dbmsdb OWNER postgres ENCODING = 'UTF8';

-- Connect to the new db
\c dbmsdb

-- CREATE NEW DOMAINS

CREATE DOMAIN emailaddress AS VARCHAR (254)
    CHECK(VALUE ~ '[A-Za-z0-9._%]+@[A-Za-z0 -9.]+[.][A-Za-z]+$');

CREATE DOMAIN licenseplate AS CHAR (7)
    CHECK(VALUE ~ '[A-Z]{2}[0-9]{3}[A-Z]{2}');

CREATE DOMAIN replacementserial AS CHAR (10)
    CHECK(VALUE ~ '[A-Z]{2}[0-9]{5}');

CREATE DOMAIN taxcode AS CHAR (16)
    CHECK(VALUE ~ '[A-Z]{6}[0-9]{2}[A-Z]{1}[0-9]{2}[A-Z]{1}[0-9]{3}[A-Z]{1}');

CREATE DOMAIN phonenumber AS CHAR (10)
    CHECK(VALUE ~ '[0-9]{10}');

CREATE DOMAIN faxnumber AS CHAR (10)
    CHECK(VALUE ~ '[0-9]{10}');

CREATE DOMAIN yearnumber as DECIMAL(4)
    CHECK(VALUE > 1900 AND VALUE <= 9999);

-- TYPES

CREATE TYPE status AS ENUM (
    'Available',
    'UnderMaintenance',
    'Rented'
);

CREATE TYPE partcategory AS ENUM(
    'Tree',
    'Shock absorber',
    'Axle',
    'Bar',
    'Biella',
    'Barbell',
    'Exchange',
    'Carter',
    'Chain',
    'Countershaft',
    'Converter',
    'Belt',
    'Differential',
    'Fillet steak',
    'Fork',
    'Brake',
    'Clutch',
    'Ring',
    'Joint',
    'Gasket',
    'Nut',
    'Crank',
    'Muffler',
    'Spring',
    'Hub',
    'Oil seal',
    'Pads',
    'Plier',
    'Piston',
    'Pump',
    'Bridge',
    'Adapter',
    'Wheel',
    'Exhaust',
    'Selector',
    'Brake booster',
    'Power steering',
    'Door lock',
    'Drive shaft',
    'Suspension',
    'Probe',
    'Sensor',
    'Transmission',
    'Turbocharger',
    'Mirror'
);

CREATE TYPE cartypes AS ENUM(
    'New',
    'Used'
);

CREATE TYPE carcategory AS ENUM(
    'ForSale',
    'ForRental',
    'ForSaleRental'
);


-- TABLE CREATION

CREATE TABLE Branch(
    name VARCHAR(50) PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    phone PHONENUMBER NOT NULL,
    fax FAXNUMBER,
    address TEXT NOT NULL
);

CREATE TABLE Role(
    role VARCHAR(20) PRIMARY KEY
);

CREATE TABLE Supplier(
    name VARCHAR(50) PRIMARY KEY,
    phone PHONENUMBER NOT NULL
);

CREATE TABLE Employee(
    tc TAXCODE PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    surname VARCHAR(20) NOT NULL,
    email EMAILADDRESS NOT NULL,
    password CHAR(40) NOT NULL, -- Hash of the password.
    roleid VARCHAR(20) NOT NULL,
    branchid VARCHAR(50) NOT NULL,
    FOREIGN KEY(roleid) REFERENCES Role(role),
    FOREIGN KEY(branchid) REFERENCES Branch(name)
);

CREATE TABLE PartKind(
    name VARCHAR(50) PRIMARY KEY,
    category partcategory NOT NULL
);

CREATE TABLE Customer(
    tc TAXCODE PRIMARY KEY, 
    name VARCHAR(20) NOT NULL, 
    surname VARCHAR(20) NOT NULL, 
    phone PHONENUMBER NOT NULL, 
    address TEXT NOT NULL
);

CREATE TABLE Model(
    brand VARCHAR(20) NOT NULL, 
    name VARCHAR(20) NOT NULL, 
    PRIMARY KEY (brand, name)
);

CREATE TABLE Car(
    lp LICENSEPLATE PRIMARY KEY, 
    status STATUS NOT NULL,
    type CARTYPES NOT NULL, 
    category CARCATEGORY NOT NULL,
    price DECIMAL(10,2) NOT NULL, 
    km DECIMAL(10) NOT NULL, 
    year YEARNUMBER NOT NULL,
    name VARCHAR(20) NOT NULL, 
    brand VARCHAR(20) NOT NULL,
    FOREIGN KEY(name,brand) REFERENCES Model(name,brand)
);

CREATE TABLE CustomerCar(
    lp LICENSEPLATE PRIMARY KEY, 
    year YEARNUMBER NOT NULL,
    name VARCHAR(20) NOT NULL,
    brand VARCHAR(20) NOT NULL, 
    customer TAXCODE NOT NULL, 
    FOREIGN KEY(name,brand) REFERENCES Model(name,brand),
    FOREIGN KEY(customer) REFERENCES Customer(tc)
);

CREATE TABLE Sale(
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL, 
    price DECIMAL(10,2) NOT NULL,
    employee TAXCODE NOT NULL, 
    lp LICENSEPLATE NOT NULL, 
    customer TAXCODE NOT NULL, 
    FOREIGN KEY(employee) REFERENCES Employee(tc), 
    FOREIGN KEY(lp) REFERENCES Car(lp), 
    FOREIGN KEY(customer) REFERENCES Customer(tc)
);

CREATE TABLE Rental(
    id SERIAL PRIMARY KEY, 
    start_date DATE NOT NULL, 
    end_date DATE NOT NULL, 
    deal_date DATE NOT NULL, 
    price DECIMAL(10,2) NOT NULL, 
    employee TAXCODE NOT NULL, 
    customer TAXCODE NOT NULL, 
    lp LICENSEPLATE NOT NULL, 
    CHECK(start_date < end_date),
    CHECK(deal_date <= start_date),
    FOREIGN KEY(employee) REFERENCES Employee(tc),
    FOREIGN KEY(customer) REFERENCES Customer(tc),
    FOREIGN KEY(lp) REFERENCES Car(lp)
);

CREATE TABLE Repair(
    id SERIAL PRIMARY KEY, 
    date DATE NOT NULL, 
    price DECIMAL(10,2) NOT NULL, 
    hours DECIMAL(2) NOT NULL, 
    employee TAXCODE NOT NULL, 
    FOREIGN KEY(employee) REFERENCES Employee(tc) 
);

CREATE TABLE CarRepair(
    lp LICENSEPLATE NOT NULL, 
    repair SERIAL NOT NULL, 
    FOREIGN KEY(lp) REFERENCES Car(lp), 
    FOREIGN KEY(repair) REFERENCES Repair(id),
    PRIMARY KEY(lp, repair)
);

CREATE TABLE CustomerCarRepair(
    repair SERIAL NOT NULL, 
    lp LICENSEPLATE NOT NULL, 
    FOREIGN KEY(repair) REFERENCES Repair(id), 
    FOREIGN KEY(lp) REFERENCES CustomerCar(lp), 
    PRIMARY KEY(repair, lp)
);

CREATE TABLE Replacement(
    serial SERIAL NOT NULL, 
    partkind VARCHAR(50) NOT NULL, 
    price DECIMAL(10,2) NOT NULL, 
    supplier VARCHAR(50) NOT NULL, 
    repair SERIAL NOT NULL, 
    FOREIGN KEY(partkind) REFERENCES PartKind(name), 
    FOREIGN KEY(supplier) REFERENCES Supplier(name),
    FOREIGN KEY(repair) REFERENCES Repair(id), 
    PRIMARY KEY(serial, partkind)
);

CREATE TABLE Supplies(
    supplier VARCHAR(50) NOT NULL, 
    partkind VARCHAR(50) NOT NULL, 
    catalog_price DECIMAL(10,2) NOT NULL, 
    FOREIGN KEY(supplier) REFERENCES Supplier(name), 
    FOREIGN KEY(partkind) REFERENCES PartKind(name),
    PRIMARY KEY(supplier, partkind)
);
