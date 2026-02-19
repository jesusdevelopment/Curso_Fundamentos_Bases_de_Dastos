CREATE DATABASE IF NOT EXISTS Curso_Fundamentos_DB;

USE Curso_Fundamentos_DB;

CREATE TABLE clients (
    client_id integer unsigned primary key auto_increment,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(60) UNIQUE NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
