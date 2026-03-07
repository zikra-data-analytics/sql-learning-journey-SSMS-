CREATE database company
USE company

CREATE TABLE employeeDetails (id INT PRIMARY KEY, name VARCHAR(90) NOT NULL, gender VARCHAR(10) NOT NULL, salary int NOT NULL, department VARCHAR(50) NOT NULL)
go

INSERT INTO employeeDetails VALUES
(1, 'David', 'Male', 5000, 'Sales'),
(2, 'Jim', 'Female', 6000, 'Finance'),
(3, 'Kate', 'Female', 7500, 'IT'),
(4, 'Will', 'Male', 6500, 'HR'),
(5, 'Shane', 'Female', 5500, 'Marketing'),
(6, 'Shed', 'Male', 8000, 'Sales'),
(7, 'Vik', 'Male', 7200, 'Finance'),
(8, 'Vince', 'Female', 6600, 'IT'),
(9, 'Jane', 'Female', 5400, 'HR'),
(10, 'Laura', 'Female', 6300, 'Marketing'),
(11, 'Mac', 'Male', 5700, 'Sales'),
(12, 'Pat', 'Male', 7000, 'Finance'),
(13, 'Julie', 'Female', 7100, 'IT'),
(14, 'Elice', 'Female', 6800, 'HR'),
(15, 'Wayne', 'Male', 5000, 'Marketing')


SELECT * FROM employeeDetails

SELECT department, count(id) tot_deprt
FROM employeeDetails GROUP BY department

select gender, count(id) as tot_emp
from employeeDetails group by gender

SELECT department, gender, SUM(Salary)
FROM employeeDetails GROUP BY department, gender

select department,
count(id) no_of_emp,
sum(salary) tot_pay,
min(salary) min_pay,
max(salary) max_pay,
avg(salary) avg_pay
from employeeDetails 
group by department

select gender,
count(id) no_of_emp,
sum(salary) tot_pay,
min(salary) min_pay,
max(salary) max_pay,
avg(salary) avg_pay
from employeeDetails 
group by gender

SELECT department, count(id) tot_tmp
FROM employeeDetails 
WHERE gender = 'Male' 
group by department
HAVING count(id) >1
ORDER BY  tot_tmp

SELECT 
    department,
    COUNT(id) AS tot_tmp,
    STRING_AGG(name, ', ') AS employee_names
FROM employeeDetails
WHERE gender = 'Male'
GROUP BY department
HAVING COUNT(id) > 1
ORDER BY tot_tmp;

SELECT *
FROM employeeDetails 
ORDER BY department DESC, salary

UPDATE employeeDetails
SET name = 'Ayesha'
WHERE name IS NULL;

---->FROM ---->WHERE ----> GROUP BY ----> HAVING ---->SELECT ----> ORDER BY


SELECT department 
FROM employeeDetails 
group by department

create table #students(id int, name varchar(100) )

SELECT * 
FROM #students

insert into #students values (1,'harshil')

truncate table #student

---- count(some_col) vs count(*)

SELECT COUNT(*) 
FROM employeeDetails;

SELECT COUNT(name)
FROM employeeDetails;

--- remove not null constarint 

alter table employeeDetails 
alter column name varchar(90) null -- removes not null constraint


insert into employeeDetails values
(16, null, 'Female', 5000, 'Sales')

insert into employeeDetails values
(17, null, 'Female', 7000, 'Finance')

select * from employeeDetails

select department, count(id)
from employeeDetails group by department

select department, count(name) --- count will ignore nulls
from employeeDetails group by department

select department, count(*) --> counting based on all columns
from employeeDetails group by department

select department, count(1) --> its the position of the column where nulls are not present
from employeeDetails group by department




