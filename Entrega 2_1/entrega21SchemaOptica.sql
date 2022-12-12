-- Active: 1666354358592@@127.0.0.1@3306@optica

# Create schemas DROP DATABASE IF EXISTS optica;

CREATE DATABASE optica CHARACTER SET utf8mb4;

USE optica;

# Create tables
CREATE TABLE
    IF NOT EXISTS supplier (
        id INT NOT NULL,
        nom VARCHAR(0) NOT NULL,
        phone INT,
        fax VARCHAR(0),
        nif VARCHAR(0),
        supplier_address INT NOT NULL,
        PRIMARY KEY(id)

            FOREIGN KEY (supplier_address) REFERENCES address(id)
    );

CREATE TABLE
    IF NOT EXISTS product (
        prod_id INT NOT NULL,
        graduationL FLOAT(4),
        graduationR FLOAT(4),
        mount ENUM,
        mount_colour INT,
        colourL VARCHAR(10),
        colourR VARCHAR(10),
        price FLOAT(8),
        brand_id INT,
        PRIMARY KEY(prod_id)

            FOREIGN KEY (prod_id) REFERENCES sale(product_id)
    );

CREATE TABLE
    IF NOT EXISTS client (
        id INT NOT NULL,
        phone INT,
        email INT,
        reg_date DATE,
        recommended_id INT,
        client_address INT,
        PRIMARY KEY(id),
        FOREIGN KEY (client_address) REFERENCES address(id),
        FOREIGN KEY (id) REFERENCES sale(client_id), 
        FOREIGN KEY (id) REFERENCES client(recommended_id)
    );

CREATE TABLE
    IF NOT EXISTS employee (
        id INT NOT NULL,
        name VARCHAR(20),
        surname VARCHAR(20),
        PRIMARY KEY(id)
            FOREIGN KEY (id) REFERENCES sale(employee_id)
    );

CREATE TABLE
    IF NOT EXISTS address (
        id INT NOT NULL,
        street VARCHAR(30),
        number INT,
        floor INT,
        door INT,
        city INT,
        p_code INT,
        country INT,
        PRIMARY KEY(id)
    );

CREATE TABLE
    IF NOT EXISTS brand (
        id INT NOT NULL,
        name VARCHAR(30),
        supplier INT,
        PRIMARY KEY(id)
 
            FOREIGN KEY (id) REFERENCES product(brand_id)

            FOREIGN KEY (supplier) REFERENCES supplier(id)
    );

CREATE TABLE
    IF NOT EXISTS sale (
        order_id INT NOT NULL,
        employee_id INT,
        product_id INT,
        client_id INT,
        date DATE,
        PRIMARY KEY(order_id)
    );