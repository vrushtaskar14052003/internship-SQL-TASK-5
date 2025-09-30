
-- Create Database & Use
CREATE DATABASE  EcommerceDB;
USE EcommerceDB;


-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    Product VARCHAR(100),
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert Customers
INSERT INTO Customers (Name, Email, City) VALUES
('Isha Sadavarte', 'isha@gmail.com', 'Pune'),
('Rahul Sharma',   'rahul@gmail.com', 'Mumbai'),
('Sneha Patil',    'sneha@gmail.com', 'Nagpur'),
('Ravi Kumar',     'ravi@gmail.com',  'Delhi');

-- Insert Orders
INSERT INTO Orders (CustomerID, Product, Amount) VALUES
(1, 'Laptop', 55000.00),
(2, 'Mobile', 20000.00),
(2, 'Headphones', 2000.00),
(3, 'Keyboard', 1500.00);

select * from customers;

select * from Orders;

-- 1) INNER JOIN
SELECT C.CustomerID, C.Name, O.OrderID, O.Product, O.Amount
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
ORDER BY C.CustomerID, O.OrderID;

-- 2) LEFT JOIN
SELECT C.CustomerID, C.Name, O.OrderID, O.Product, O.Amount
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
ORDER BY C.CustomerID, O.OrderID;

-- 3) RIGHT JOIN (MySQL supports RIGHT JOIN)
SELECT C.CustomerID, C.Name, O.OrderID, O.Product, O.Amount
FROM Customers C
RIGHT JOIN Orders O ON C.CustomerID = O.CustomerID
ORDER BY O.OrderID;

-- 4) FULL OUTER JOIN (MySQL workaround using UNION)
SELECT C.CustomerID, C.Name, O.OrderID, O.Product, O.Amount
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID

UNION

SELECT C.CustomerID, C.Name, O.OrderID, O.Product, O.Amount
FROM Customers C
RIGHT JOIN Orders O ON C.CustomerID = O.CustomerID
ORDER BY CustomerID, OrderID;

