# 💡 RDBMS & SQL Interview Questions & Answers (Expanded)

Core database interview questions (20+ total) covering SQL query optimization and management.

---

## 1. How to find the "Nth" Highest Salary from an Employee table?
**Answer**: Use `OFFSET` or a correlated subquery.

---

## 2. Explain ACID properties in DBMS
**Answer**: Atomicity, Consistency, Isolation, Durability.

---

## 3. What is Database Normalization (1NF, 2NF, 3NF)?
**Answer**: Minimizing redundancy. See RDBMS module.

---

## 4. Difference between DELETE, TRUNCATE, and DROP
**Answer**: (DELETE: DML, slower); (TRUNCATE: DDL, faster); (DROP: No schema).

---

## 5. What is a Transaction?
**Answer**: A sequence of one or more SQL operations that execute as a single unit or fail as a single unit.

```sql
START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;
-- ROLLBACK; (If an error occurs)
```

---

## 6. Database Replication
**Answer**: Copying data from one server (Master) to another (Slave) for backup or load balancing.

---

## 7. How do Database Indexes work?
**Answer**: They use **B-Trees** to allow fast read operations at the cost of slower writes and additional disk space.

---

## 8. Primary Key vs Unique Key
**Answer**:
- **Primary**: Only one per table, cannot be `NULL`.
- **Unique**: Multiple per table, can be `NULL` (usually only once).

---

## 9. Denormalization
**Answer**: The process of adding redundant data back to a normalized schema to speed up read performance and avoid complex joins.

---

## 10. Inner vs Left vs Right Join
**Answer**:
- **Inner**: Only matching.
- **Left**: All from left, and matches from right.
- **Right**: All from right, and matches from left.

```sql
SELECT orders.order_id, customers.customer_name
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.id;
```

---

## 11. What are Constraints in SQL?
**Answer**: Rules to enforce data integrity: `NOT NULL`, `CHECK`, `DEFAULT`, `UNIQUE`, `PRIMARY KEY`.

---

## 12. GROUP BY vs HAVING
**Answer**: `GROUP BY` organizes data based on a column; `HAVING` filters those groups (similar to `WHERE` for rows).

```sql
SELECT department, COUNT(*) FROM employees 
GROUP BY department 
HAVING COUNT(*) > 10;
```

---

## 13. Stored Procedures vs Functions
**Answer**:
- **Procedures**: Can return multiple values or none; can perform DML (update/insert).
- **Functions**: Must return a single value; usually read-only.

---

## 14. Aggregate functions
**Answer**: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`.

---

## 15. Deadlock in SQL
**Answer**: Happens when two transactions hold locks on resources the other needs. SQL servers usually automatically detect and roll back one transaction.

---

## 16. What is a View?
**Answer**: A virtual table based on a stored query. Helps simplify complex joins.

---

## 17. Materialized View
**Answer**: A view that has its result physically stored on disk and periodically refreshed. (Faster than standard views).

---

## 18. Triggers in SQL
**Answer**: Stored code that automatically executes on certain events like `INSERT`, `UPDATE`, or `DELETE`.

---

## 19. NoSQL vs SQL Performance
**Answer**: SQL is optimized for joins; NoSQL is optimized for speed of single-node retrieval and horizontal scaling.

---

## 20. Self Join
**Answer**: Joining a table with itself. Useful for hierarchical data like employee/manager relationships.

```sql
SELECT e.name AS Employee, m.name AS Manager
FROM employees e
INNER JOIN employees m ON e.manager_id = m.id;
```

---

## 🎓 Summary Table: Joins

| Join Type | Match Mode | Description |
| :--- | :--- | :--- |
| **Inner Join** | Only match | Intersection of both tables. |
| **Left Join** | Left side all | Left + intersection. |
| **Full Join** | Both sides all | Union of both tables. |
| **Cross Join** | All with all | Cartesian product. |
