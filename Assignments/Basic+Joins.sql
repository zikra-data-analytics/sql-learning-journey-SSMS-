create database mar28

use mar28

-- Assignment 1 --- give the difference between char and varchar data type
 /*Problem 
 Consider yourself as Sam who is a student of a prestigious university you have enrolled
 1. Give the  difference between char and varchar data type
 Char - Fixed length datatype, faster, there is wastage of memory,
 e.g. Aadhar card no, Pan card no, zip codes, etc
 Vaechar - Variable length datatype, slower, no memory wastage
 e.g. name, email, address etc

 2. Explain the types of SQl commands
     Coomands                             Purpose            Key Commands
 DDL (Data Defination Language)     Define Structure       CREATE, ALTER, DROP
 DML(Data Manipulation Language)    Manipulate Data        INSERT, UPDATE, DELETE
 DQL (Data Query Language)          Retrieve Data          SELECT
 DCL (Data Control Language)        Control Access         GRANT, REVOKE
 TCL(Transaction Control Language)  Manage Transactions    COMMIT, ROLLBACK, SAVEPOINT
 */

 -- Nvarchar Nchar - both are unicode datatype where data will be storerd in the format of unicode
 --both can store data of English+any other language
 -- max length to store is 2000

create table test (
id int,
name nvarchar(50)
)

select * from test

insert into test values 
(1,'abc')

--హలో
insert into test values (2,'హలో')

insert into test values (3,N'హలో')


/* SQL Certification Training: Assignments 2 & 3
   Author: Zikra
   Topic: Table Creation, Data Filtering, and Relational Joins
*/

-- Assignment 2 -- Basic Operations & Filtering

/*
1. Create a customer table which comprises of these columns: ‘customer_id’,
‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’ */

CREATE TABLE customer (
customer_id INT,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
address VARCHAR(255),
city VARCHAR(50),
state VARCHAR(50),
zip VARCHAR(6)
)

----- 2.insert 5 new records into the table

insert into customer values
(1,'abhishek','singh','as@gmail.com','MGRoad','Mumbai','Maharastra','430003'),
(2,'ishika','k','ik@outlook.com','VVPuram','Bang','Karnataka','456781'),
(3,'chirag','dhamija','cd@gmail.com','LKPuram','HYD','TS','56001'),
(4,'vivek','gupta','vk@gmail.com','Raj Nagar','Delhi','Delhi','234561'),
(5,'ganesh','ram','gr@gmail.com','Lalnagar','Sanjose','USA','987654')

select * from customer

-----3. Select only the ‘first_name’ and ‘last_name’ columns from the customer
--table

SELECT first_name, last_name 
FROM customer;

--4. Select those records where ‘first_name’ starts with “G” and city is ‘San Jose’. 

SELECT * FROM customer
WHERE first_name LIKE 'G%' 
AND city = 'Sanjose'

---- 5.select those records where email has only 'gmail'

SELECT * FROM customer
WHERE email LIKE '%@gmail.com%'

 --6. Select those records where the ‘last_name’ doesn't end with “A”.

 SELECT * FROM customer
WHERE last_name NOT LIKE '%a'

---- Assignment 3 ---- Joins And Update

--- 1. create table orders which comprises of three columns order_id, order_date, amount, customer_id 

CREATE TABLE Orders (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    customer_id INT
)

select * from Orders

---- 2. insert 5 new records in order table.

insert into orders values
(101,'2024-01-01',500,1),
(102,'2024-05-02',1500,3),
(103,'2024-02-06',700,2),
(104,'2024-06-08',100,9),
(105,'2024-07-12',120,8)

 --3. Make an inner join on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’ column. 

select * from customer as c
inner join Orders as o
on c.customer_id = o.customer_id

----4. Make left and right joins on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’ column. 

SELECT 
    c.customer_id, 
    c.first_name, 
    o.order_id, 
    o.amount
FROM customer AS c
LEFT JOIN Orders AS o
ON c.customer_id = o.customer_id

SELECT 
    c.first_name, 
    o.order_id, 
    o.amount,
    o.customer_id
FROM customer AS c
RIGHT JOIN Orders AS o
ON c.customer_id = o.customer_id

-- alternate answer

select * from customer as c
left join Orders as o
on c.customer_id=o.customer_id

select * from customer as c
right join Orders as o
on c.customer_id=o.customer_id

--5. Make a full outer join on ‘Customer’ and ‘Orders’ table on the ‘customer_id’ column.

SELECT * 
FROM customer AS c
FULL JOIN Orders AS o
ON c.customer_id = o.customer_id

 --6. Update the ‘Orders’ table and set the amount to be 100 where
--‘customer_id’ is 3.

UPDATE Orders
SET amount = 100
WHERE customer_id = 3

