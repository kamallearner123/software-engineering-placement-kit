# 🐬 SQL Quick Reference Cheat Sheet

A single-page guide to SQL queries and database concepts.

## 🎓 Core Commands

### 1. DDL (Data Definition Language)
```sql
CREATE TABLE table_name (column1 datatype, column2 datatype);
ALTER TABLE table_name ADD column_name datatype;
DROP TABLE table_name;
TRUNCATE TABLE table_name; # Deletes data, keeps schema.
```

### 2. DML (Data Manipulation Language)
```sql
INSERT INTO table_name (col1, col2) VALUES (val1, val2);
UPDATE table_name SET col1 = val1 WHERE condition;
DELETE FROM table_name WHERE condition;
```

### 3. DQL (Data Query Language)
```sql
SELECT col1, col2 FROM table_name WHERE condition;
SELECT * FROM table_name WHERE col1 LIKE '%pattern%';
SELECT * FROM table_name ORDER BY col1 DESC;
```

### 4. Aggregate Functions
```sql
SELECT COUNT(col1), SUM(col2), AVG(col3), MIN(col4), MAX(col5) FROM table_name;
SELECT department, COUNT(*) FROM employees GROUP BY department HAVING COUNT(*) > 5;
```

---

## 🤝 Joins (Visual)

| Join Type | Description |
| :--- | :--- |
| **INNER JOIN** | Returns records that have matching values in both tables. |
| **LEFT JOIN** | Returns all records from the left table, and matching ones from the right. |
| **RIGHT JOIN** | Returns all records from the right table, and matching ones from the left. |
| **FULL JOIN** | Returns all records when there is a match in either left or right table. |

---

## 🔐 ACID Properties
1.  **Atomicity**: All or nothing.
2.  **Consistency**: Data remains in a valid state.
3.  **Isolation**: Transactions don't interfere with each other.
4.  **Durability**: Changes are permanent even if the system fails.

---

## 💡 Quick Tips
- **Primary Key**: Unique and not null.
- **Foreign Key**: Refers to the primary key of another table.
- **Indexing**: Improves read speed but slows down write speed.
- **Normalization**: Reducing data redundancy (1NF, 2NF, 3NF).
