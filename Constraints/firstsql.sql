CREATE DATABASE ms_college1

use ms_college1

CREATE TABLE students(
s_id int,
s_name varchar(50),
dob date,
course_name char(30),
marks decimal(5,2)
)

SELECT * FROM students

INSERT INTO students(s_id,s_name,dob,course_name,marks)
VALUES (1,'Tim','2000-01-01','Engineering',76.5)

INSERT INTO students(s_id,s_name,dob,course_name,marks)
VALUES (2,'Alice','2001-02-03','Management',69.3)

INSERT INTO students(s_id,s_name,dob,course_name,marks)
VALUES(3,'John','2000-06-24','Graphic Engeering',80.3)

INSERT INTO students(s_id,s_name,dob,course_name,marks)
VALUES(4,'Nancy','2001-03-14','Data Analyst',85.3)

CREATE TABLE department(
dept_id int primary key,
dept_name varchar(50),
head_id int
)

CREATE TABLE employees(
e_id int,
e_name varchar(50) default 'NameNotAvailable',
date_of_join date NOT NULL,
age tinyint check (age > 18),
department_id int FOREIGN KEY REFERENCES department(dept_id),
salary decimal(8,2),
id_proof varchar(50) UNIQUE 
)

SELECT *
FROM department

SELECT *
FROM employees

INSERT INTO department(dept_id,dept_name,head_id)
VALUES 
(1,'Accounts',11),
(2,'Admission',12),
(3,'Housekeeping',13)

INSERT INTO employees(e_id,e_name,date_of_join,age,department_id,salary,id_proof)
VALUES
(1,'Max','2000-04-01',25,1,5000,'DL001')

INSERT INTO employees(e_id,e_name,date_of_join,age,department_id,salary,id_proof)
VALUES
(2,'Erica','2023-01-04', 32,2,3000,'DL002')

-- Errors
-- DOJ cannot have NULLs

INSERT INTO employees(e_id,e_name,date_of_join,age,department_id,salary,id_proof)
VALUES(3,'Beth',NULL,29, 2, 7000,'DL003')

-- fixing error

INSERT INTO employees(e_id,e_name,date_of_join,age,department_id,salary,id_proof)
VALUES(3,'Beth','2022-11-13',29, 2, 7000,'DL003')

-- in same way when name is assigned default constraint comes to work

INSERT INTO employees(e_id,date_of_join,age,department_id,salary,id_proof)
VALUES
(4,'2000-06-25',45,3,6000,'DL004')

insert into employees
values(5, 'Kim', '2026-01-01', 17, 2, 800, 'DL005') -- error age >18

insert into employees
values(5, 'Kim', '2026-01-01', 19, 2, 800, 'DL005')

insert into employees
values(5, 'Kim', '2026-01-01', 17, 2, 800, 'DL005') -- error

insert into employees
values(5, 'Kim', '2026-01-01', 20, 2, 800, 'DL006')

---- can we insert null value into unique key constrained column? YES
insert into employees
values(7, 'peter', '2026-01-09', 19, 3, 900, null)


---- if yes, how many null values can be present in unique constrained column ?? -- ONLY ONE

insert into employees
values(8, 'Rob', '2026-01-09', 19, 3, 900, 'DL007')