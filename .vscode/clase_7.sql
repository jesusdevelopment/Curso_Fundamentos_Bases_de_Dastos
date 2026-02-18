CREATE DATABASE IF NOT EXISTS Curso_Fundamentos_DB;

USE Curso_Fundamentos_DB;

CREATE TABLE clients (
    name VARCHAR(100) NOT NULL,
    email VARCHAR(60) UNIQUE NOT NULL,
    phone_number VARCHAR(15) NOT NULL
SHOW TABLES;);

CREATE TABLE products (
    name VARCHAR(20) NOT NULL,
    sku VARCHAR(15) UNIQUE NOT NULL,
    slug VARCHAR(20) UNIQUE NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

DESCRIBE products;

DROP TABLE products;
DROP TABLE clients;

