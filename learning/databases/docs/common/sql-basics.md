# Common SQL Concepts

## Table of Contents

1. [Basic Queries](#basic-queries)
2. [Joins](#joins)
3. [Aggregation](#aggregation)
4. [Subqueries](#subqueries)
5. [Indexes](#indexes)
6. [Constraints](#constraints)
7. [Transactions](#transactions)

## Basic Queries

### SELECT
```sql
SELECT column1, column2 FROM table_name;
SELECT * FROM table_name;
SELECT DISTINCT column1 FROM table_name;
```

### WHERE
```sql
SELECT * FROM users WHERE age > 18;
SELECT * FROM users WHERE name LIKE 'John%';
SELECT * FROM users WHERE age BETWEEN 18 AND 65;
```

### ORDER BY
```sql
SELECT * FROM users ORDER BY age DESC;
SELECT * FROM users ORDER BY last_name, first_name;
```

### GROUP BY
```sql
SELECT department, COUNT(*) 
FROM employees 
GROUP BY department;

SELECT department, COUNT(*) 
FROM employees 
GROUP BY department 
HAVING COUNT(*) > 5;
```

## Joins

### INNER JOIN
```sql
SELECT u.name, p.title
FROM users u
INNER JOIN posts p ON u.id = p.user_id;
```

### LEFT JOIN
```sql
SELECT u.name, p.title
FROM users u
LEFT JOIN posts p ON u.id = p.user_id;
```

### RIGHT JOIN
```sql
SELECT u.name, p.title
FROM users u
RIGHT JOIN posts p ON u.id = p.user_id;
```

### FULL OUTER JOIN
```sql
SELECT u.name, p.title
FROM users u
FULL OUTER JOIN posts p ON u.id = p.user_id;
```

## Aggregation Functions

```sql
COUNT(*)        -- Count rows
SUM(column)     -- Sum values
AVG(column)     -- Average
MIN(column)     -- Minimum value
MAX(column)     -- Maximum value
```

## Subqueries

### Scalar Subquery
```sql
SELECT * FROM products 
WHERE price > (SELECT AVG(price) FROM products);
```

### EXISTS
```sql
SELECT * FROM customers c
WHERE EXISTS (
    SELECT 1 FROM orders o 
    WHERE o.customer_id = c.id
);
```

### IN
```sql
SELECT * FROM products
WHERE category_id IN (
    SELECT id FROM categories 
    WHERE name = 'Electronics'
);
```

## Indexes

### Creating Indexes
```sql
CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_user_name ON users(last_name, first_name);
CREATE UNIQUE INDEX idx_user_username ON users(username);
```

## Constraints

### Primary Key
```sql
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);
```

### Foreign Key
```sql
CREATE TABLE posts (
    id INT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

### Check Constraint
```sql
CREATE TABLE products (
    id INT PRIMARY KEY,
    price DECIMAL(10,2) CHECK (price > 0)
);
```

## Transactions

```sql
BEGIN;
INSERT INTO accounts (name, balance) VALUES ('Alice', 1000);
INSERT INTO accounts (name, balance) VALUES ('Bob', 1000);
COMMIT;

-- Or rollback on error
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE name = 'Alice';
UPDATE accounts SET balance = balance + 100 WHERE name = 'Bob';
ROLLBACK; -- if something went wrong
```
