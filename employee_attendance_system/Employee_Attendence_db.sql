-- ============================================
-- Employee Attendance System
-- Database: attendance_db
-- Author: Zikra
-- ============================================

CREATE DATABASE attendance_db
GO
USE attendance_db
GO

-- ============================================
-- TABLE 1: Departments
-- ============================================
CREATE TABLE Departments (
    dept_id    INT PRIMARY KEY IDENTITY(1,1),
    dept_name  VARCHAR(100) NOT NULL UNIQUE,
    location   VARCHAR(100)
)

SELECT *
FROM Departments

-- ============================================
-- TABLE 2: Employees
-- ============================================
CREATE TABLE Employees (
    emp_id      INT PRIMARY KEY IDENTITY(1,1),
    first_name  VARCHAR(50)    NOT NULL,
    last_name   VARCHAR(50)    NOT NULL,
    email       VARCHAR(100)   NOT NULL UNIQUE,
    phone       VARCHAR(15),
    job_title   VARCHAR(100),
    salary      DECIMAL(10,2)  CHECK (salary > 0),
    hire_date   DATE           NOT NULL DEFAULT GETDATE(),
    dept_id     INT            FOREIGN KEY REFERENCES Departments(dept_id)
)

SELECT * 
FROM Employees

-- ============================================
-- TABLE 3: Leave_Types
-- ============================================
CREATE TABLE Leave_Types (
    leave_type_id    INT PRIMARY KEY IDENTITY(1,1),
    leave_type_name  VARCHAR(50)  NOT NULL UNIQUE,
    max_days_allowed INT          NOT NULL CHECK (max_days_allowed > 0),
    description      VARCHAR(200)
)

SELECT * 
FROM Leave_Types

-- ============================================
-- TABLE 4: Attendance_Records
-- ============================================

CREATE TABLE Attendance_Records (
    attendance_id   INT PRIMARY KEY IDENTITY(1,1),
    emp_id          INT            NOT NULL FOREIGN KEY REFERENCES Employees(emp_id),
    attendance_date DATE           NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    check_in        TIME,
    check_out       TIME,
    status          VARCHAR(20)    NOT NULL CHECK (status IN ('Present','Absent','Half-Day','On Leave','Holiday')),
    remarks         VARCHAR(200),
    UNIQUE (emp_id, attendance_date)   -- one record per employee per day
)

SELECT * 
FROM Attendance_Records

-- ============================================
-- TABLE 5: Leave_Requests
-- ============================================

CREATE TABLE Leave_Requests (
    leave_id        INT PRIMARY KEY IDENTITY(1,1),
    emp_id          INT         NOT NULL FOREIGN KEY REFERENCES Employees(emp_id),
    leave_type_id   INT         NOT NULL FOREIGN KEY REFERENCES Leave_Types(leave_type_id),
    start_date      DATE        NOT NULL,
    end_date        DATE        NOT NULL,
    total_days      AS DATEDIFF(DAY, start_date, end_date) + 1,  -- computed column
    reason          VARCHAR(300),
    status          VARCHAR(20) NOT NULL DEFAULT 'Pending'
                                CHECK (status IN ('Pending','Approved','Rejected')),
    applied_on      DATE        NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    CONSTRAINT chk_dates CHECK (end_date >= start_date)
)
GO

SELECT * 
FROM Leave_Requests

-- ============================================
-- SAMPLE DATA
-- ============================================

INSERT INTO Departments (dept_name, location) VALUES
('Human Resources', 'Floor 1'),
('Engineering',     'Floor 2'),
('Finance',         'Floor 3'),
('Marketing',       'Floor 4')

INSERT INTO Employees (first_name, last_name, email, phone, job_title, salary, hire_date, dept_id) VALUES
('Ayesha',  'Khan',    'ayesha@company.com',  '9876543210', 'HR Manager',        55000, '2021-03-15', 1),
('Rahul',   'Sharma',  'rahul@company.com',   '9876543211', 'Senior Developer',  75000, '2020-07-01', 2),
('Priya',   'Mehta',   'priya@company.com',   '9876543212', 'Finance Analyst',   60000, '2022-01-10', 3),
('Farhan',  'Sheikh',  'farhan@company.com',  '9876543213', 'Junior Developer',  45000, '2023-06-20', 2),
('Sneha',   'Patil',   'sneha@company.com',   '9876543214', 'Marketing Lead',    58000, '2021-09-05', 4);

INSERT INTO Leave_Types (leave_type_name, max_days_allowed, description) VALUES
('Casual Leave',   12, 'For personal or urgent work'),
('Sick Leave',     10, 'For medical reasons'),
('Annual Leave',   20, 'Planned vacation leave'),
('Maternity Leave',180,'For expecting mothers'),
('Unpaid Leave',   30, 'Leave without pay');

INSERT INTO Attendance_Records (emp_id, attendance_date, check_in, check_out, status) VALUES
(1, '2026-03-24', '09:05', '18:10', 'Present'),
(2, '2026-03-24', '09:30', '18:45', 'Present'),
(3, '2026-03-24', NULL,    NULL,    'Absent'),
(4, '2026-03-24', '09:00', '13:00', 'Half-Day'),
(5, '2026-03-24', NULL,    NULL,    'On Leave'),
(1, '2026-03-25', '09:10', '18:00', 'Present'),
(2, '2026-03-25', '09:15', '19:00', 'Present'),
(3, '2026-03-25', '09:00', '18:30', 'Present'),
(4, '2026-03-25', '09:20', '18:20', 'Present'),
(5, '2026-03-25', NULL,    NULL,    'On Leave');

INSERT INTO Leave_Requests (emp_id, leave_type_id, start_date, end_date, reason, status) VALUES
(5, 1, '2026-03-24', '2026-03-26', 'Personal work',       'Approved'),
(3, 2, '2026-03-24', '2026-03-24', 'Not feeling well',    'Approved'),
(2, 3, '2026-04-01', '2026-04-05', 'Family vacation',     'Pending'),
(4, 1, '2026-04-10', '2026-04-11', 'Attend a wedding',    'Pending');
GO

-- ============================================
-- USEFUL QUERIES
-- ============================================

-- 1. All employees with their department

SELECT e.emp_id, e.first_name, e.last_name, e.job_title, d.dept_name
FROM Employees e
INNER JOIN Departments d ON e.dept_id = d.dept_id

-- 2. Attendance summary for a specific date

SELECT e.first_name, e.last_name, a.attendance_date,
       a.check_in, a.check_out, a.status
FROM Attendance_Records a
INNER JOIN Employees e ON a.emp_id = e.emp_id
WHERE a.attendance_date = '2026-03-24'

-- 3. Employees who were absent on a date

SELECT e.first_name, e.last_name, a.attendance_date
FROM Attendance_Records a
INNER JOIN Employees e ON a.emp_id = e.emp_id
WHERE a.status = 'Absent'

-- 4. All pending leave requests with employee names

SELECT e.first_name, e.last_name, lt.leave_type_name,
       lr.start_date, lr.end_date, lr.total_days, lr.reason, lr.status
FROM Leave_Requests lr
INNER JOIN Employees e  ON lr.emp_id = e.emp_id
INNER JOIN Leave_Types lt ON lr.leave_type_id = lt.leave_type_id
WHERE lr.status = 'Pending'

-- 5. Total present days per employee

SELECT e.first_name, e.last_name,
       COUNT(*) AS total_present_days
FROM Attendance_Records a
INNER JOIN Employees e ON a.emp_id = e.emp_id
WHERE a.status = 'Present'
GROUP BY e.first_name, e.last_name
ORDER BY total_present_days DESC

-- 6. Employees with no attendance record (never marked)

SELECT e.emp_id, e.first_name, e.last_name
FROM Employees e
LEFT JOIN Attendance_Records a ON e.emp_id = a.emp_id
WHERE a.emp_id IS NULL

---

/*## 🗂️ What's in this project

The schema has **5 tables** with clean relationships:

`Departments` → `Employees` → `Attendance_Records` (one record per employee per day, enforced by a `UNIQUE` constraint on `emp_id + attendance_date`)

`Employees` → `Leave_Requests` ← `Leave_Types`

**Notable SQL features used:**
- `IDENTITY(1,1)` — auto-increment primary keys
- `COMPUTED COLUMN` — `total_days` calculates itself from `start_date` and `end_date` using `DATEDIFF`
- `CHECK` constraints — status fields only accept specific values
- `DEFAULT GETDATE()` — auto-stamps hire date, attendance date, and applied date
- All 4 JOIN types are naturally usable in the queries

---*/

