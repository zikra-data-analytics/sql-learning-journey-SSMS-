# ☕ Coffee Sales SQL Case Study
### Exploratory Data Analysis using T-SQL & Microsoft SQL Server Management Studio (SSMS)

![SQL](https://img.shields.io/badge/SQL-T--SQL-blue?style=flat&logo=microsoftsqlserver)
![Tool](https://img.shields.io/badge/Tool-SSMS-red?style=flat&logo=microsoft)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat)
![Level](https://img.shields.io/badge/Level-Beginner--Friendly-yellow?style=flat)

---

## 📌 Project Overview

This project is a structured SQL case study performed on a **Coffee Sales dataset** using **Microsoft SQL Server Management Studio (SSMS)**. The goal is to answer real-world business questions using SQL queries — covering aggregate functions, filtering, grouping, sorting, and multi-table JOINs.

This case study is part of my ongoing **SQL Learning Journey** to build practical, portfolio-ready skills as a fresher in the Data Analytics and AI/ML domain.

---

## 🗂️ Dataset Description

The dataset consists of **3 tables** structured in a classic **Star Schema**:

### 1. `fact` table — 4,248 rows × 14 columns
> The main transactions table containing sales, profit, expenses, and budget metrics.

| Column | Description |
|---|---|
| Date | Transaction date |
| ProductId | Foreign key linking to Product table |
| Sales | Actual sales amount |
| Profit | Actual profit |
| Margin | Profit margin |
| COGS | Cost of Goods Sold |
| Total Expenses | Total expenses incurred |
| Marketing | Marketing spend |
| Inventory | Inventory value |
| Budget Profit / COGS / Margin / Sales | Budgeted values for comparison |
| Area Code | Foreign key linking to Location table |

---

### 2. `Location` table — 156 rows × 4 columns
> Dimension table mapping area codes to geographic details.

| Column | Description |
|---|---|
| Area Code | Primary key |
| State | US State name |
| Market | Market region (East / West / South…) |
| Market Size | Small Market / Major Market |

---

### 3. `Product` table — 13 rows × 4 columns
> Dimension table containing product details.

| Column | Description |
|---|---|
| ProductId | Primary key |
| Product Type | Category (Coffee / Espresso…) |
| Product | Specific product name |
| Type | Regular / Decaf |

---

### 🔗 Schema Relationship

```
Product Table              fact Table             Location Table
--------------             ----------             ---------------
ProductId ◄──────────── ProductId
                           Area Code ──────────► Area Code
```

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| Microsoft SQL Server | Database engine |
| SSMS (SQL Server Management Studio) | Query execution & data exploration |
| T-SQL | Query language |
| GitHub | Portfolio & version control |

---

## 💡 Key SQL Concepts Covered

| Concept | Questions |
|---|---|
| `COUNT`, `SUM`, `MIN`, `MAX`, `AVG` | Q1–Q5, Q8, Q10 |
| `WHERE` clause & comparison operators | Q2, Q3, Q6, Q7, Q8, Q13 |
| `GROUP BY` | Q10, Q12, Q14 |
| `HAVING` (filter on groups) | Q12 |
| `ORDER BY` (ASC / DESC) | Q11, Q14, Q15 |
| `JOIN` (multi-table queries) | Q9, Q15 |
| `DISTINCT` | Q1 |
| Column aliases with spaces `[ ]` | Q6, Q7, Q12, Q14 |
| `CONVERT()` for date formatting | Q13 |

---

## 📂 Repository Structure

```
📁 Coffee-Sales-SQL-Case-Study/
│
├── 📄 README.md               ← You are here
├── 📄 case_study_queries.sql  ← All 15 queries in one file
└── 📁 data/
    ├── fact.csv
    ├── Location.csv
    └── Product.csv
```

---

## 🚀 How to Run

1. Open **Microsoft SQL Server Management Studio (SSMS)**
2. Import `fact.csv`, `Location.csv`, and `Product.csv` as tables into your database
3. Open `case_study_queries.sql`
4. Execute queries one by one or all at once

---

## 🙋‍♀️ About Me

Hi! I'm **Zikra**, a fresher actively building my skills in **Data Analytics, SQL, and AI/ML**.  
I'm learning in public — sharing my progress on [GitHub](https://github.com/zikra-data-analytics) and LinkedIn.

Feel free to ⭐ this repo if you found it helpful!

---

## 📬 Connect with Me

[![GitHub](https://img.shields.io/badge/GitHub-zikra--data--analytics-black?style=flat&logo=github)](https://github.com/zikra-data-analytics)

---

*This case study is part of my [SQL Learning Journey](https://github.com/zikra-data-analytics/sql-learning-journey-SSMS-) repository.*
