# 🎓 Student Cheating Dataset — SQL Analysis

A SQL-based exploratory data analysis project using **Microsoft SQL Server (SSMS)**, focused on uncovering patterns in student cheating behaviour across exams. This project covers data import, table creation, and five structured analytical queries.

---

## 📁 Dataset Overview

| Field | Description |
|---|---|
| `student_id` | Unique identifier for each student |
| `student_name` | Full name of the student |
| `exam_date` | Date of the exam |
| `subject` | Subject of the exam |
| `score` | Student's exam score |
| `cheated` | 1 = cheated, 0 = did not cheat |
| `cheating_method` | Method used to cheat (if applicable) |
| `proctor_present` | 1 = proctor was present, 0 = no proctor |
| `exam_duration_minutes` | Duration of the exam in minutes |
| `caught_cheating` | 1 = caught, 0 = not caught |
| `penalty_points` | Penalty points assigned |
| `student_behavior` | Observed behavior (Nervous, Calm, Distracted, Overconfident) |

**Total Records:** 1,000 students

---

## 🛠️ Tools Used

- Microsoft SQL Server Management Studio (SSMS)
- T-SQL (Transact-SQL)

---

## 📥 Data Import — BULK INSERT

**Step 1 — Create the table**

```sql
CREATE TABLE student_cheating_dataset (
    student_id            INT,
    student_name          VARCHAR(100),
    exam_date             DATE,
    subject               VARCHAR(50),
    score                 FLOAT,
    cheated               INT,
    cheating_method       VARCHAR(100),
    proctor_present       INT,
    exam_duration_minutes INT,
    caught_cheating       INT,
    penalty_points        INT,
    student_behavior      VARCHAR(50)
);
```

**Step 2 — Import the CSV file**

```sql
BULK INSERT student_cheating_dataset
FROM 'C:\your-path\student_cheating_dataset.csv'
WITH (
    FIRSTROW        = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR   = '\n',
    TABLOCK
);
```

> Replace `C:\your-path\` with the actual path to your CSV file.

---

## 📊 Analysis Questions & Queries

### 1. Cheating Analysis
Count how many students cheated and how many did not.

```sql
SELECT 
    CASE WHEN cheated = 1 THEN 'Cheated' ELSE 'Did Not Cheat' END AS cheating_status,
    COUNT(*) AS student_count
FROM student_cheating_dataset
GROUP BY cheated;
```

**Result:**

| cheating_status | student_count |
|---|---|
| Did Not Cheat | 810 |
| Cheated | 190 |

---

### 2. Penalty Distribution
Retrieve the average, minimum, and maximum penalty points given to students.

```sql
SELECT 
    AVG(CAST(penalty_points AS FLOAT)) AS avg_penalty,
    MIN(penalty_points)                AS min_penalty,
    MAX(penalty_points)                AS max_penalty
FROM student_cheating_dataset;
```

**Result:**

| avg_penalty | min_penalty | max_penalty |
|---|---|---|
| 5.28 | 0 | 19 |

---

### 3. Behavior and Cheating
Find the most common behavior among students who were caught cheating.

```sql
SELECT TOP 1
    student_behavior,
    COUNT(*) AS student_count
FROM student_cheating_dataset
WHERE caught_cheating = 1
GROUP BY student_behavior
ORDER BY student_count DESC;
```

**Result:**

| student_behavior | student_count |
|---|---|
| Nervous | 17 |

> 55 students were caught cheating in total. Nervous was the most common behavior, likely because anxious body language drew proctor attention.

---

### 4. Proctor Impact
Count how many students cheated in exams with a proctor present vs. without.

```sql
SELECT 
    CASE WHEN proctor_present = 1 THEN 'Proctor Present' ELSE 'No Proctor' END AS proctor_status,
    COUNT(*) AS cheaters_count
FROM student_cheating_dataset
WHERE cheated = 1
GROUP BY proctor_present;
```

**Result:**

| proctor_status | cheaters_count |
|---|---|
| Proctor Present | 103 |
| No Proctor | 87 |

> Surprisingly, more cheating occurred when a proctor was present — suggesting these may have been higher-stakes exams that motivated students to cheat regardless.

---

### 5. Subject-Wise Cheating Rates
Calculate the percentage of students who cheated in each subject.

```sql
SELECT 
    subject,
    COUNT(*)                                                       AS total_students,
    SUM(cheated)                                                   AS total_cheated,
    CAST(SUM(cheated) * 100.0 / COUNT(*) AS DECIMAL(5, 2))        AS cheating_rate_pct
FROM student_cheating_dataset
GROUP BY subject
ORDER BY cheating_rate_pct DESC;
```

**Result:**

| subject | total_students | total_cheated | cheating_rate_pct |
|---|---|---|---|
| English | 163 | 40 | 24.54% |
| Physics | 161 | 32 | 19.88% |
| Biology | 176 | 33 | 18.75% |
| History | 161 | 29 | 18.01% |
| Chemistry | 183 | 31 | 16.94% |
| Math | 156 | 25 | 16.03% |

---

## 💡 Key Insights

- **19%** of students cheated overall (190 out of 1,000)
- **English** had the highest cheating rate at **24.54%**
- **Math** had the lowest cheating rate at **16.03%**
- **Nervous** students were most commonly caught, likely due to visible anxiety
- Proctor presence did **not** deter cheating — 103 students cheated even with a proctor present
- Penalty points ranged from **0 to 19**, averaging **5.28 per student**

---

## 🧠 SQL Concepts Covered

| Concept | Used In |
|---|---|
| `GROUP BY` | All queries |
| `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()` | Queries 1, 2, 3, 4, 5 |
| `CASE WHEN` | Queries 1, 4 |
| `WHERE` filter | Queries 3, 4 |
| `CAST` / type conversion | Queries 2, 5 |
| `TOP 1` with `ORDER BY` | Query 3 |
| `BULK INSERT` | Data import |
| `ALTER TABLE` / `ALTER COLUMN` | Data cleaning |

---

## 🗂️ Repository Structure

```
📦 student-cheating-sql-analysis
 ┣ 📄 student_cheating_dataset.csv
 ┣ 📄 create_table.sql
 ┣ 📄 bulk_insert.sql
 ┣ 📄 analysis_queries.sql
 ┗ 📄 README.md
```

---

## 👩‍💻 Author

**Zikra** — Aspiring Data Analyst  
📌 [GitHub](https://github.com/zikra-data-analytics) | [LinkedIn](https://www.linkedin.com/in/)

---

*This project is part of a growing SQL portfolio built using real-world style datasets.*
