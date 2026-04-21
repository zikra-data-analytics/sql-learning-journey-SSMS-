# 📦 SQL Mandatory Assignment 1 — ABC Fashion Sales Order System

![SQL](https://img.shields.io/badge/SQL-T--SQL-blue?logo=microsoftsqlserver)
![Tool](https://img.shields.io/badge/Tool-SSMS-orange)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Level](https://img.shields.io/badge/Level-Beginner-yellow)

---

## 📌 Problem Statement

ABC Fashion is a leading retailer with a vast customer base and a team of dedicated sales representatives. This project works with their **Sales Order Processing System** to manage customer orders and interactions using SQL queries.

---

## 🗂️ Dataset Overview

Three relational tables are used in this assignment:

### 🧑‍💼 Salesman Table
| SalesmanId | SalesmanName | Commission | City        | Age |
|------------|-------------|------------|-------------|-----|
| 101        | Joe          | 50         | California  | 17  |
| 102        | Simon        | 75         | Texas       | 25  |
| 103        | Jessie       | 105        | Florida     | 35  |
| 104        | Danny        | 100        | Texas       | 22  |
| 105        | Lia          | 65         | New Jersey  | 30  |

### 👤 Customer Table
| SalesmanId | CustomerId | CustomerName | PurchaseAmount |
|------------|------------|-------------|----------------|
| 101        | 2345       | Andrew       | 550            |
| 103        | 1575       | Lucky        | 4500           |
| 104        | 2345       | Andrew       | 4000           |
| 107        | 3747       | Remona       | 2700           |
| 110        | 4004       | Julia        | 4545           |

### 🛒 Orders Table
| OrderId | CustomerId | SalesmanId | OrderDate  | Amount |
|---------|------------|------------|------------|--------|
| 5001    | 2345       | 101        | 04-07-2021 | 550    |
| 5003    | 1234       | 105        | 15-02-2022 | 1500   |

---

## ✅ Tasks Covered

| # | Task | SQL Concept |
|---|------|------------|
| 1 | Insert a new record in Orders table | `INSERT INTO` |
| 2 | Add PRIMARY KEY, DEFAULT, FOREIGN KEY, NOT NULL constraints | `ALTER TABLE` |
| 3 | Fetch customers whose name ends with 'N' and PurchaseAmount > 500 | `WHERE`, `LIKE` |
| 4 | Retrieve unique and duplicate SalesmanIds from two tables | `UNION`, `UNION ALL` |
| 5 | Display order details with PurchaseAmount between 500–1500 | `INNER JOIN`, `BETWEEN` |
| 6 | Fetch all results from Salesman and Orders using RIGHT JOIN | `RIGHT JOIN` |

---

## 💡 Key Concepts Demonstrated

- **DDL** — `CREATE TABLE`, `ALTER TABLE` (constraints)
- **DML** — `INSERT INTO`
- **Filtering** — `WHERE`, `LIKE`, `BETWEEN`, `AND`
- **SET Operators** — `UNION` vs `UNION ALL`
- **Joins** — `INNER JOIN`, `RIGHT JOIN`
- **Constraints** — `PRIMARY KEY`, `FOREIGN KEY`, `DEFAULT`, `NOT NULL`

---

## 🚀 How to Run

1. Open **SQL Server Management Studio (SSMS)**
2. Connect to your local SQL Server instance
3. Open a **New Query** window
4. Run the scripts in this order:
   - `01_create_tables.sql` → Creates all three tables
   - `02_insert_data.sql` → Inserts the sample records
   - `03_tasks.sql` → Contains all 6 task solutions

---

## 📁 File Structure

```
sql-mandatory-assignment-1/
│
├── 01_create_tables.sql      # Table creation scripts
├── 02_insert_data.sql        # Data insertion scripts
├── 03_tasks.sql              # All 6 task solutions
└── README.md                 # Project documentation
```

---

## ⚠️ Important Notes

- All queries are written in **T-SQL** syntax (Microsoft SQL Server)
- For Task 2, `SalesmanId` must be altered to `NOT NULL` **before** adding the PRIMARY KEY constraint — SQL Server does not allow PRIMARY KEY on nullable columns
- For the FOREIGN KEY in Task 2, orphan records in the Customer table (SalesmanId 107, 110) must be removed first since they don't exist in the Salesman table

---

## 👩‍💻 Author

**Zikra**
- 🐙 GitHub: [@zikra-data-analytics](https://github.com/zikra-data-analytics)
- 📚 Currently learning: SQL, Data Analytics, Data Science & AI/ML
- 🛠️ Tools: SSMS, Microsoft SQL Server, VS Code, Anaconda

---

## 📜 Course Info

- **Platform:** Intellipaat  
- **Assignment:** SQL Mandatory Assignment 1  
- **Topic:** Sales Order Processing System — DDL, DML, Joins, SET Operators
