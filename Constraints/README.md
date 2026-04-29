# 🏫 MS College Database — SQL Constraints Practice

A beginner-friendly T-SQL project built in **Microsoft SQL Server Management Studio (SSMS)** that demonstrates the creation and practical use of SQL **constraints** through a college management scenario.

---

## 📌 Project Overview

This project creates a college database (`ms_college1`) with three tables — `students`, `department`, and `employees` — and explores how different SQL constraints control data integrity by testing both valid and invalid inserts.

---

## 🗂️ Database Structure

### 🎓 students
| Column | Data Type | Description |
|---|---|---|
| s_id | INT | Student ID |
| s_name | VARCHAR(50) | Student name |
| dob | DATE | Date of birth |
| course_name | CHAR(30) | Enrolled course |
| marks | DECIMAL(5,2) | Marks obtained |

### 🏢 department
| Column | Data Type | Constraint | Description |
|---|---|---|---|
| dept_id | INT | PRIMARY KEY | Department ID |
| dept_name | VARCHAR(50) | — | Department name |
| head_id | INT | — | Department head employee ID |

### 👤 employees
| Column | Data Type | Constraint | Description |
|---|---|---|---|
| e_id | INT | — | Employee ID |
| e_name | VARCHAR(50) | DEFAULT `'NameNotAvailable'` | Employee name |
| date_of_join | DATE | NOT NULL | Joining date |
| age | TINYINT | CHECK (age > 18) | Must be above 18 |
| department_id | INT | FOREIGN KEY → department(dept_id) | Links to department |
| salary | DECIMAL(8,2) | — | Salary |
| id_proof | VARCHAR(50) | UNIQUE | Unique document ID |

---

## 🔐 Constraints Covered

| Constraint | Column | Behaviour Tested |
|---|---|---|
| `PRIMARY KEY` | dept_id | Ensures unique, non-null department identifiers |
| `NOT NULL` | date_of_join | Inserting NULL raises an error |
| `DEFAULT` | e_name | Omitting the column auto-fills `'NameNotAvailable'` |
| `CHECK` | age | Values ≤ 18 are rejected |
| `FOREIGN KEY` | department_id | References valid `dept_id` in the department table |
| `UNIQUE` | id_proof | Duplicate values are rejected; **one NULL is allowed** |

---

## 🧪 Key Experiments & Observations

### ❌ NOT NULL violation
```sql
-- Fails: date_of_join cannot be NULL
INSERT INTO employees(e_id, e_name, date_of_join, age, department_id, salary, id_proof)
VALUES (3, 'Beth', NULL, 29, 2, 7000, 'DL003');
```

### ✅ DEFAULT in action
```sql
-- e_name is omitted → auto-filled with 'NameNotAvailable'
INSERT INTO employees(e_id, date_of_join, age, department_id, salary, id_proof)
VALUES (4, '2000-06-25', 45, 3, 6000, 'DL004');
```

### ❌ CHECK constraint violation
```sql
-- Fails: age must be > 18
INSERT INTO employees VALUES (5, 'Kim', '2026-01-01', 17, 2, 800, 'DL005');
```

### ✅ UNIQUE + NULL behaviour
```sql
-- Allowed: NULL can be inserted into a UNIQUE column (once)
INSERT INTO employees VALUES (7, 'peter', '2026-01-09', 19, 3, 900, NULL);

-- A second NULL would be rejected
```

---

## 💡 Concepts Practised

- Creating a database and switching context with `USE`
- Defining tables with appropriate data types
- Applying all five core SQL constraints in a single schema
- Understanding **error messages** by intentionally violating constraints
- Observing **NULL behaviour** with `UNIQUE` constraints

---

## 🛠️ Tools Used

- **Microsoft SQL Server Management Studio (SSMS)**
- **T-SQL**

---

## 🚀 How to Run

1. Open SSMS and connect to your local SQL Server instance.
2. Open `firstsql.sql`.
3. Execute the script section by section (use **F5** or highlight + execute).
4. Observe the results and intentional errors in the **Messages** pane.

---

## 👩‍💻 Author

**Zikra** — Fresher in Data Science & AI/ML, building in public.

🔗 [GitHub](https://github.com/zikra-data-analytics) 

---

> *Part of my SQL learning journey — documenting constraints, errors, and fixes as I go.*
