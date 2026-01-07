# Module 5: RDBMS (Relational Database Management Systems)

**Duration:** 2 hours  
**Focus:** Database fundamentals and SQL querying

## 📋 Module Overview

This module introduces relational database concepts and SQL (Structured Query Language). You'll learn database design principles, master SQL queries, and understand how to work with relational data effectively.

## 🎯 Learning Objectives

- Understand relational database concepts
- Design databases for real-world applications
- Write SQL queries for data manipulation and retrieval
- Use joins and aggregations effectively
- Apply database best practices

## 📚 Topics Covered

### 1. Basics of RDBMS and Case Studies (1 hour)
- **Database Fundamentals**
  - What is a Database?
  - What is a Relational Database?
  - Tables, Rows, and Columns
  - Data Types
- **Key Concepts**
  - Primary Key
  - Foreign Key
  - Relationships (One-to-One, One-to-Many, Many-to-Many)
  - Normalization basics
- **Case Studies**
  - Banking System Design (Accounts, Transactions)
  - E-commerce System (Products, Orders, Customers)
  - University System (Students, Courses, Enrollments)

### 2. SQL Basics (1 hour)
- **DDL (Data Definition Language)**
  - `CREATE TABLE`
  - `ALTER TABLE`
  - `DROP TABLE`
- **DML (Data Manipulation Language)**
  - `INSERT` - Adding data
  - `UPDATE` - Modifying data
  - `DELETE` - Removing data
- **Querying Data**
  - `SELECT` statements
  - `WHERE` clause for filtering
  - `ORDER BY` for sorting
  - `LIMIT` for pagination
- **Joins**
  - `INNER JOIN`
  - `LEFT JOIN` (LEFT OUTER JOIN)
  - `RIGHT JOIN` (RIGHT OUTER JOIN)
  - `FULL JOIN`
- **Aggregations**
  - `COUNT()`
  - `SUM()`
  - `AVG()`
  - `MIN()` and `MAX()`
  - `GROUP BY`
  - `HAVING`

## 🔨 Practice Queries

Common interview SQL problems:
- Select all records from a table
- Filter employees with salary > 25,000
- Update student marks
- Delete specific records
- Join multiple tables
- Calculate aggregated values
- Find top N records

## 📖 Recommended Approach

1. Understand database design principles first
2. Practice DDL commands to create tables
3. Insert sample data for practice
4. Master SELECT queries with various clauses
5. Practice joins with multi-table scenarios
6. Work on aggregation and grouping

## 🌟 Key Interview Topics

- Primary key vs Foreign key
- Types of joins and when to use each
- Difference between WHERE and HAVING
- Writing efficient queries
- Database normalization
- ACID properties (bonus)

## 💡 Pro Tips

- **Draw ER Diagrams:** Visualize your database schema
- **Test Queries:** Always test with sample data
- **Join Practice:** Joins are heavily tested in interviews
- **Understand NULL:** Know how NULL values behave in queries
- **Optimization:** Learn to write efficient queries from the start

## 📝 Sample Interview Questions

1. What is a database? What is a table, row, and column?
2. What is a primary key? Why do we need foreign keys?
3. Write a query to select all records from a table.
4. Write a query to fetch employees with salary > 25,000.
5. Write a query to update a student's marks.
6. Write a query to delete an employee record.
7. What is the difference between INNER JOIN and LEFT JOIN?
8. How do you find the average salary by department?

## 🛠️ Tools to Practice

- **SQLite:** Lightweight, file-based database
- **MySQL:** Popular open-source RDBMS
- **PostgreSQL:** Advanced open-source RDBMS
- **Online SQL Editors:** For quick practice

## 📚 Additional Resources

- SQL cheat sheets in `Resources/Cheat_Sheets/`
- Sample database schemas in `Sample_Projects/`
- Practice problems and solutions

---

**Module Duration:** 2 hours  
**Difficulty Level:** Beginner  
**Tools:** SQL, Any RDBMS (MySQL, PostgreSQL, SQLite)
