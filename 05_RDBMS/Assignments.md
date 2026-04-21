# 📝 RDBMS Assignments

Apply your knowledge of Relational Databases and SQL with these 5 real-world scenarios.

---

## 1. Entity-Relationship Design (ER Modelling)
**Scenario**: You are tasked with designing the database for a new **Online Food Delivery Platform** (like UberEats or DoorDash).

**Your Task**:
- Identify at least 4 core entities.
- List the attributes for each entity (including Data Types).
- Define the primary and foreign keys.
- Explain the cardinality (e.g., One-to-Many) between:
    - Customer and Order
    - Restaurant and Dish
    - Order and Dish (Tip: You might need a junction table).

---

## 2. The Nth Highest Salary Challenge
**Scenario**: You have an `Employees` table with columns `(id, name, department_id, salary)`.

**Your Task**:
- Write a SQL query to find the **3rd highest salary** in the company.
- Write another query to find the **highest salary in each department**.
- **Bonus**: Write a query to find employees who earn more than the average salary of their respective department.

---

## 3. Database Normalization & Anomalies
**Scenario**: You are given a flat table `Shipments` with the following columns:
`ShipmentID, Date, CustomerID, CustomerName, CustomerAddress, ProductID, ProductName, Quantity, PriceTotal`.

**Your Task**:
- Identify any **Insertion**, **Update**, and **Deletion** anomalies present in this design.
- Step-by-step, normalize this table into **3rd Normal Form (3NF)**.
- Show the resulting schema (Table names and columns).

---

## 4. Advanced Joins & Aggregations
**Scenario**: Using the "Student Library" example from the Mastery Guide:
- `Students` (student_id, name)
- `Books` (isbn, title, author)
- `Issues` (issue_id, student_id, isbn, issue_date)

**Your Task**:
- Write a query to list all **Students** who have **not issued any books** yet. (Hint: Use a `LEFT JOIN`).
- Write a query to find the **top 3 most issued books**, including their titles and the total count of issues.
- Write a query to find students who issued a book but haven't returned it (assume a `return_date` column exists and is NULL).

---

## 5. ACID & Transaction Logic
**Scenario**: Implementation of a "Library Book Return" workflow.

**Your Task**:
- Write a SQL transaction (using `BEGIN`, `COMMIT`, `ROLLBACK`) that does the following:
    1. Updates the `Issues` table to set the `return_date` to today for a specific `issue_id`.
    2. Increments the `available_copies` in the `Books` table for the corresponding ISBN.
- **Critical Thinking**: What happens if the first update succeeds but the second one fails (e.g., server crash)? Explain how the **Atomicity** property of ACID protects the data in this case.

---
*Good luck! Try to write out the SQL queries for each task to get the full benefit.*
