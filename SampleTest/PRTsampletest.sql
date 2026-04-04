CREATE DATABASE student_cheating_dataset
USE student_cheating_dataset

SELECT * 
FROM student_cheating_dataset

-- 1) Cheating Analysis:- Count how many students cheated and how many did not.

SELECT 
    CASE WHEN cheated = 1 THEN 'Cheated' ELSE 'Did Not Cheat' END AS cheating_status,
    COUNT(*) AS student_count
FROM student_cheating_dataset
GROUP BY cheated

-- 2) Penalty Distribution:- Retrieve the average, minimum, and maximum penalty points given to students.

SELECT AVG(penalty_points) AS avg_pts, MIN(penalty_points) AS min_pts,MAX(penalty_points) AS max_pts
FROM student_cheating_dataset

-- 3) Behavior and Cheating:- Find the most common behavior among students who were caught cheating.

SELECT
    student_behavior,
    COUNT(*) AS student_count
FROM student_cheating_dataset
WHERE caught_cheating = 1
GROUP BY student_behavior
ORDER BY student_count DESC


-- 4) Proctor Impact:- Count how many students cheated in exams with a 
-- proctor present vs. without a proctor.

SELECT 
    CASE WHEN proctor_present = 1 THEN 'Proctor Present' ELSE 'No Proctor' END AS proctor_status,
    COUNT(*) AS cheaters_count
FROM student_cheating_dataset
WHERE cheated = 1
GROUP BY proctor_present

-- 5) Subject-Wise Cheating Rates:- Calculate the percentage of students who cheated in each subject.

ALTER DATABASE student_cheating_dataset MODIFY NAME = exam_details
GO

SELECT
    subject,
    COUNT(*) AS total_students,
    SUM(cheated) AS total_cheated,
    CAST(SUM(cheated) * 100.0 / COUNT(*) AS DECIMAL(5, 2)) AS cheating_rate_pct
FROM student_cheating_dataset
GROUP BY subject
ORDER BY cheating_rate_pct DESC