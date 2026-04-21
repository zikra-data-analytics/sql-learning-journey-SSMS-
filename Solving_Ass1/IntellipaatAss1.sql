CREATE DATABASE abc_fashion

USE abc_fashion

CREATE TABLE Salesman (
SalesmanId INT,
Name VARCHAR(255),
Commission DECIMAL(10, 2),
City VARCHAR(255),
Age INT
)

INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
(101, 'Joe', 50, 'California', 17),
(102, 'Simon', 75, 'Texas', 25),
(103, 'Jessie', 105, 'Florida', 35),
(104, 'Danny', 100, 'Texas', 22),
(105, 'Lia', 65, 'New Jersey', 30)

SELECT * FROM Salesman

CREATE TABLE Customer (
SalesmanId INT,
CustomerId INT,
CustomerName VARCHAR(255),
PurchaseAmount INT,
)

INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
(101, 2345, 'Andrew', 550),
(103, 1575, 'Lucky', 4500),
(104, 2345, 'Andrew', 4000),
(107, 3747, 'Remona', 2700),
(110, 4004, 'Julia', 4545)

SELECT * FROM Customer

CREATE TABLE Orders (
OrderId int, 
CustomerId int, 
SalesmanId int, 
Orderdate Date, 
Amount money
)

INSERT INTO Orders Values
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)

SELECT * FROM Orders

-- 1. Insert a new record in your Orders table.

INSERT INTO Orders (OrderId, CustomerId, SalesmanId, OrderDate, Amount)
VALUES (5005, 1575, 103, '2024-01-15', 2800)

/*2. Add Primary key constraint for SalesmanId column in Salesman table. Add default
constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
column in Customer table. Add not null constraint in Customer_name column for the
Customer table.*/

SELECT * FROM Salesman
SELECT * FROM Customer
SELECT * FROM Orders
-- Step 1: Add PRIMARY KEY to SalesmanId in Salesman table
ALTER TABLE Salesman
ADD CONSTRAINT PK_Salesman PRIMARY KEY (SalesmanId)

-- i'm getting error not specifing 'NOT NULL' during creating table so here i'm first alter column.

-- Make SalesmanId NOT NULL first
ALTER TABLE Salesman
ALTER COLUMN SalesmanId INT NOT NULL

-- NOW add the Primary Key constraint
ALTER TABLE Salesman
ADD CONSTRAINT PK_Salesman PRIMARY KEY (SalesmanId)

-- Step 2: Add DEFAULT constraint for City in Salesman table
ALTER TABLE Salesman
ADD CONSTRAINT DF_Salesman_City DEFAULT 'Unknown' FOR City

-- Step 3: Fix orphan records in Customer before adding FK
-- (SalesmanId 107 and 110 don't exist in Salesman)

DELETE FROM Customer WHERE SalesmanId NOT IN (SELECT SalesmanId FROM Salesman)

-- Step 4: Add FOREIGN KEY on SalesmanId in Customer table

ALTER TABLE Customer
ADD CONSTRAINT FK_Customer_Salesman 
    FOREIGN KEY (SalesmanId) REFERENCES Salesman(SalesmanId)

-- Step 5: Add NOT NULL constraint on CustomerName in Customer table

ALTER TABLE Customer
ALTER COLUMN CustomerName VARCHAR(50) NOT NULL

3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
amount value greater than 500.

SELECT *
FROM Customer
WHERE CustomerName LIKE '%N'    -- ends with letter N (case-insensitive in SSMS default)
  AND PurchaseAmount > 500


4. Using SET operators, retrieve the first result with unique SalesmanId values from two
tables, and the other result containing SalesmanId with duplicates from two tables.

-- Part A: UNION — Returns UNIQUE SalesmanId values from both tables (removes duplicates)
SELECT SalesmanId FROM Salesman
UNION
SELECT SalesmanId FROM Customer

-- Part B: UNION ALL — Returns ALL SalesmanId values including DUPLICATES
SELECT SalesmanId FROM Salesman
UNION ALL
SELECT SalesmanId FROM Customer

5. Display the below columns which has the matching data.
Orderdate, Salesman Name, Customer Name, Commission, and City which has the
range of Purchase Amount between 500 to 1500.

SELECT 
    o.OrderDate,
    s.Name,
    c.CustomerName,
    s.Commission,
    s.City
FROM Orders o
INNER JOIN Salesman s ON o.SalesmanId = s.SalesmanId
INNER JOIN Customer c ON o.CustomerId = c.CustomerId
WHERE c.PurchaseAmount BETWEEN 500 AND 1500


6. Using right join fetch all the results from Salesman and Orders table.

SELECT 
    s.SalesmanId,
    s.Name,
    s.Commission,
    s.City,
    o.OrderId,
    o.CustomerId,
    o.OrderDate,
    o.Amount
FROM Salesman s
RIGHT JOIN Orders o ON s.SalesmanId = o.SalesmanId