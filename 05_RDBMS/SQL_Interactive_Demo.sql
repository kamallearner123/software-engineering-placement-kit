/*
🚀 SQL INTERACTIVE DEMO RECIPES
Use this script to practice and visualize SQL features in SQLite3.
Simply copy-paste these blocks into your terminal.
*/

-- ==========================================
-- 🛠️ 1. SETUP: Create the Lab Environment
-- ==========================================

PRAGMA foreign_keys = ON;

-- DDL: Create Tables (Schema)
CREATE TABLE Departments (
    dept_id INTEGER PRIMARY KEY,
    dept_name TEXT NOT NULL
);

CREATE TABLE Employees (
    emp_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    salary REAL CHECK (salary > 0),
    dept_id INTEGER,
    manager_id INTEGER,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES Employees(emp_id)
);

-- ==========================================
-- 📥 2. DML: Populate with Real Data
-- ==========================================

INSERT INTO Departments (dept_id, dept_name) VALUES 
(1, 'Engineering'), 
(2, 'Sales'), 
(3, 'HR');

INSERT INTO Employees (name, salary, dept_id, manager_id) VALUES 
('Alice (CEO)', 150000, 1, NULL),
('Bob (Eng Mgr)', 120000, 1, 1),
('Charlie (Dev)', 80000, 1, 2),
('David (Sales Rep)', 60000, 2, 1),
('Eve (Dev)', 85000, 1, 2);

-- ==========================================
-- 🔍 3. DQL: Retrieval Recipes
-- ==========================================

-- A. The Basic Selection
SELECT name, salary FROM Employees WHERE salary > 70000;

-- B. Joins (Fetching Related Data)
SELECT e.name, d.dept_name 
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_name;

-- C. Self-Join (Hierarchy: Who manages whom?)
SELECT e.name AS Employee, m.name AS Manager
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.emp_id;

-- ==========================================
-- 📊 4. Aggregations & Grouping
-- ==========================================

-- D. Find total salary spend per department
SELECT d.dept_name, COUNT(e.emp_id) AS head_count, SUM(e.salary) AS total_payroll
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- E. Filtering Groups (HAVING)
-- Find departments with more than 2 employees
SELECT dept_id, COUNT(*) 
FROM Employees 
GROUP BY dept_id 
HAVING COUNT(*) > 2;

-- ==========================================
-- 🔄 5. Advanced logic: Subqueries & Transactions
-- ==========================================

-- F. Subquery: Find employees earning more than the average
SELECT name, salary 
FROM Employees 
WHERE salary > (SELECT AVG(salary) FROM Employees);

-- G. ACID Transaction (Atomic Salary Hike)
BEGIN TRANSACTION;
UPDATE Employees SET salary = salary * 1.1 WHERE dept_id = 1;
-- Verify then COMMIT;
COMMIT;

-- ==========================================
-- 🗑️ 6. CLEANUP: Tearing down safely
-- ==========================================

DROP TABLE Employees;
DROP TABLE Departments;
