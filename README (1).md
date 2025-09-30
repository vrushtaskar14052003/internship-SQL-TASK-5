# Task 5: SQL Joins (INNER, LEFT, RIGHT, FULL)

## 📌 Objective
To learn and practice different types of SQL Joins (INNER, LEFT, RIGHT, FULL) by combining data from multiple related tables.

## 🛠 Tools Used
- MySQL Workbench (you can also use DB Browser for SQLite)

## 🗂️ Database Design
We created two tables:

### Customers
| Column      | Type         | Description             |
|-------------|--------------|-------------------------|
| CustomerID  | INT (PK)     | Unique ID for customer  |
| Name        | VARCHAR(100) | Customer name           |
| Email       | VARCHAR(100) | Customer email          |
| City        | VARCHAR(50)  | Customer city           |

### Orders
| Column      | Type         | Description                        |
|-------------|--------------|------------------------------------|
| OrderID     | INT (PK)     | Unique ID for order                |
| CustomerID  | INT (FK)     | References Customers(CustomerID)   |
| Product     | VARCHAR(100) | Product ordered                    |
| Amount      | DECIMAL      | Order amount                       |

---

## 🔑 SQL Queries and Results

### 1️⃣ INNER JOIN
Fetch only customers who placed an order.
```sql
SELECT C.CustomerID, C.Name, O.OrderID, O.Product, O.Amount
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID;
```
**Result:** Only customers with orders are displayed.

---

### 2️⃣ LEFT JOIN
Fetch all customers, whether they placed an order or not.
```sql
SELECT C.CustomerID, C.Name, O.OrderID, O.Product, O.Amount
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID;
```
**Result:** Includes customers without orders (shows NULLs for order details).

---

### 3️⃣ RIGHT JOIN
Fetch all orders, whether a matching customer exists or not.
```sql
SELECT C.CustomerID, C.Name, O.OrderID, O.Product, O.Amount
FROM Customers C
RIGHT JOIN Orders O ON C.CustomerID = O.CustomerID;
```
**Result:** All orders appear, even if customer data is missing.

---

### 4️⃣ FULL OUTER JOIN (MySQL workaround)
Since MySQL doesn’t support FULL OUTER JOIN directly, we use `UNION`.
```sql
SELECT C.CustomerID, C.Name, O.OrderID, O.Product, O.Amount
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
UNION
SELECT C.CustomerID, C.Name, O.OrderID, O.Product, O.Amount
FROM Customers C
RIGHT JOIN Orders O ON C.CustomerID = O.CustomerID;
```

