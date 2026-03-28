# 🏢 Employee Attendance Management System
### Built with Microsoft SQL Server (SSMS) | T-SQL

![SQL Server](https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![T-SQL](https://img.shields.io/badge/T--SQL-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen?style=for-the-badge)

---

## 📌 Project Overview

A fully relational **Employee Attendance Management System** designed and implemented in Microsoft SQL Server (SSMS). This project models real-world HR operations — tracking daily attendance, managing employee leave requests, and organising staff across departments.

The system is built using core SQL concepts including relational schema design, data integrity constraints, computed columns, and multi-table JOINs to enable meaningful reporting and analysis.

---

## 🗄️ Database: `attendance_db`

### Entity Relationship Diagram
I have provided a screenshot of the diagram

## 🛠️ Schema Design — 5 Tables

### 1. `Departments`
Stores the college or company departments.

### 2. `Employees`
Core table storing all employee records, linked to a department.

### 3. `Attendance_Records`
Logs daily check-in and check-out for each employee. Enforces one record per employee per day.

> **Unique Constraint:** `(emp_id, attendance_date)` — prevents duplicate attendance entries per day.

### 4. `Leave_Types`
Reference table defining the types of leave available.

** leave types:** Casual Leave, Sick Leave, Annual Leave, Maternity Leave, Unpaid Leave.

### 5. `Leave_Requests`
Tracks all leave applications submitted by employees, with approval status.

> **Check Constraint:** `end_date >= start_date`

## 🔗 Table Relationships

```
Departments  ──────────< Employees
Employees    ──────────< Attendance_Records
Employees    ──────────< Leave_Requests
Leave_Types  ──────────< Leave_Requests
```

---

## 🔑 Key SQL Concepts Applied

| Concept | Where Used |
|---|---|
| `PRIMARY KEY` + `IDENTITY` | All 5 tables — auto-increment IDs |
| `FOREIGN KEY` | Employees → Departments, Attendance → Employees, Leave_Requests → Employees & Leave_Types |
| `CHECK` constraint | Salary > 0, status allowed values, end_date >= start_date |
| `UNIQUE` constraint | Email uniqueness, one attendance record per employee per day |
| `DEFAULT` | hire_date, attendance_date, applied_on auto-stamp with GETDATE() |
| Computed Column | `total_days` auto-calculated from start and end dates |
| `INNER JOIN` | Employee + Department report |
| `LEFT JOIN` | Employees with no attendance records |
| `GROUP BY` + `COUNT` | Attendance summary per employee |
| `WHERE` + filtering | Status-based filtering on leave and attendance |

---

## 📁 Project Structure

```
employee_attendance_system/
│
├── employee_attendance_system.sql    ← Full schema + sample data + queries
├── README.md                         ← This file
└── erd.png                           ← Entity Relationship Diagram (add yours here)
```

---

## 🧭 What's Next

Planned additions to extend this project:

- [ ] Stored Procedures — `usp_MarkAttendance`, `usp_ApproveLeave`
- [ ] Views — Monthly attendance summary view per department
- [ ] Indexes — On `emp_id` and `attendance_date` for faster queries
- [ ] Triggers — Auto-update attendance when a leave request is approved

---

*Developed as part of my SQL Learning Journey — Data Analytics Portfolio.*
