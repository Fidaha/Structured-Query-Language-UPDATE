CREATE DATABASE CustomerDB;
GO

USE CustomerDB;
GO

-- la table Customers
CREATE TABLE Customers (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
GO

-- Insertion des entités avec 'Z' à la fin du nom
INSERT INTO Customers (id, name) VALUES (1, 'JohnZ');
INSERT INTO Customers (id, name) VALUES (2, 'JaneZ');
GO

-- Début de la transaction explicite
BEGIN TRANSACTION;

-- Mise à jour des noms en tronquant le 'Z' à la fin
UPDATE Customers
SET name = LEFT(name, LEN(name) - 1)
WHERE RIGHT(name, 1) = 'Z';

-- Validation de la transaction
COMMIT;
