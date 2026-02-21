CREATE DATABASE IF NOT EXISTS Curso_Fundamentos_DB;
USE Curso_Fundamentos_DB;

CREATE TABLE Clients (
    client_id    INT UNSIGNED NOT NULL AUTO_INCREMENT, -- UNSIGNED va junto a INT
    name         VARCHAR(100) NOT NULL,
    email        VARCHAR(30) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NULL,
    created_at   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (client_id)
);

CREATE TABLE Products (
    product_id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name         VARCHAR(50) NOT NULL UNIQUE,
    slug         VARCHAR(50) NOT NULL UNIQUE,
    description  TEXT NULL,
    price        DOUBLE(8,2) NULL,
    created_at   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_at  TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (product_id)
);

CREATE TABLE Bills (
    bill_id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    client_id    INT UNSIGNED NOT NULL,
    total        INT NOT NULL,
    status       ENUM('open', 'closed', 'cancelled') NOT NULL DEFAULT 'open',
    created_at   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Coma añadida aquí
    PRIMARY KEY (bill_id), -- Coma añadida aquí
    CONSTRAINT FK_Clients_Bills FOREIGN KEY (client_id) REFERENCES Clients(client_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE bill_products (
    bill_product_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    bill_id         INT UNSIGNED NOT NULL,
    quantity        INT NOT NULL,
    product_id      INT UNSIGNED NOT NULL, -- Coma añadida aquí
    PRIMARY KEY (bill_product_id), -- Coma añadida aquí
    CONSTRAINT FK_Bills_Products FOREIGN KEY (bill_id) REFERENCES Bills(bill_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_Products_Details FOREIGN KEY (product_id) REFERENCES Products(product_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO Clients (name, email, phone_number) VALUES
('John Doe', 'john@example.com', '123-456-7890'),
('Jane Smith', 'jane@example.com', '987-654-3210');

INSERT INTO Products (name, slug, description, price) VALUES
('Laptop', 'laptop', 'A high-performance laptop for work and gaming.', 999.99),
('Smartphone', 'smartphone', 'A sleek smartphone with a powerful camera.', 499.99);

INSERT INTO Bills (client_id, total, status) VALUES
(1, 1499, 'open'),
(2, 499, 'closed');

INSERT INTO bill_products (bill_id, quantity, product_id) VALUES
(1, 1, 1), -- Bill 1 (John Doe) bought 1 Laptop
(1, 1, 2), -- Bill 1 (John Doe) bought 1 Smartphone
(2, 1, 2); -- Bill 2 (Jane Smith) bought 1 Smartphone


SHOW TABLES LIKE 'Products';