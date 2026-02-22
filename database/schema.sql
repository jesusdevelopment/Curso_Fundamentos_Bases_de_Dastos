CREATE DATABASE IF NOT EXISTS DBML;

USE DBML;

CREATE TABLE bill_products
(
  bill_product_id INT NOT NULL AUTO_INCREMENT,
  bill_id         INT NOT NULL,
  quantity        INT NOT NULL,
  product_id      INT NOT NULL,
  PRIMARY KEY (bill_product_id)
);

CREATE TABLE Bills
(
  bill_id     INT       NOT NULL AUTO_INCREMENT,
  client_id   INT       NOT NULL ,
  total       INT       NOT NULL,
  status      ENUM('open', 'closed', 'cancelled') NOT NULL DEFAULT 'open',
  created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (bill_id)
);

CREATE TABLE Clients
(
  client_id    INT         NOT NULL AUTO_INCREMENT,
  name         VARCHAR(100) NOT NULL,
  email        VARCHAR(30) NOT NULL UNIQUE,
  phone_number VARCHAR(15) NULL    ,
  created_at   TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_at  TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (client_id)
);

CREATE TABLE Products
(
  product_id  INT         NOT NULL AUTO_INCREMENT,
  name        VARCHAR(50) NOT NULL UNIQUE,
  slug        VARCHAR(50) NOT NULL UNIQUE,
  description TEXT        NULL    ,
  price       DOUBLE(8,2) NULL    ,
  created_at  TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_at TIMESTAMP   NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (product_id)
);

ALTER TABLE Bills
  ADD CONSTRAINT FK_Clients_TO_Bills
    FOREIGN KEY (client_id)
    REFERENCES Clients (client_id);

ALTER TABLE bill_products
  ADD CONSTRAINT FK_Bills_TO_bill_products
    FOREIGN KEY (bill_id)
    REFERENCES Bills (bill_id);

ALTER TABLE bill_products
  ADD CONSTRAINT FK_Products_TO_bill_products
    FOREIGN KEY (product_id)
    REFERENCES Products (product_id);

USE DBML;


CREATE table Test
(
  test_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (test_id)
);  
