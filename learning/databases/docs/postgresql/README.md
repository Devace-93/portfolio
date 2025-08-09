# PostgreSQL Documentation

## Table of Contents

1. [Installation & Setup](#installation--setup)
2. [Data Types](#data-types)
3. [Table Operations](#table-operations)
4. [Queries](#queries)
5. [Indexes](#indexes)
6. [PostgreSQL-Specific Features](#postgresql-specific-features)
7. [Extensions](#extensions)

## Installation & Setup

### Using Docker (Recommended for learning)
```bash
docker-compose up -d postgres
```

### Connection
```bash
psql -h localhost -p 5432 -U postgres -d learning
```

## Data Types

### Numeric Types
- `SMALLINT`: 2 bytes, -32,768 to 32,767
- `INTEGER`: 4 bytes, -2,147,483,648 to 2,147,483,647
- `BIGINT`: 8 bytes, large range
- `DECIMAL(precision, scale)`: Exact numeric
- `NUMERIC(precision, scale)`: Exact numeric
- `REAL`: 4 bytes floating point
- `DOUBLE PRECISION`: 8 bytes floating point

### String Types
- `CHAR(n)`: Fixed-length character string
- `VARCHAR(n)`: Variable-length character string
- `TEXT`: Variable-length character string (unlimited)

### Date/Time Types
- `DATE`: Date only
- `TIME`: Time of day
- `TIMESTAMP`: Date and time
- `TIMESTAMPTZ`: Timestamp with timezone
- `INTERVAL`: Time span

### PostgreSQL-Specific Types
- `UUID`: Universally unique identifier
- `JSON`: JSON data
- `JSONB`: Binary JSON (recommended)
- `ARRAY`: Array of any data type
- `HSTORE`: Key-value pairs

## PostgreSQL-Specific Features

### SERIAL (Auto-incrementing)
```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);
```

### Arrays
```sql
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    tags TEXT[]
);

INSERT INTO posts (tags) VALUES ('{"postgresql", "database", "sql"}');
```

### JSON/JSONB
```sql
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    data JSONB
);

INSERT INTO products (data) VALUES ('{"name": "Laptop", "price": 999.99}');
SELECT data->>'name' FROM products;
```

### Window Functions
```sql
SELECT 
    name, 
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) as rank
FROM employees;
```

### Common Table Expressions (CTE)
```sql
WITH regional_sales AS (
    SELECT region, SUM(sales_amount) as total_sales
    FROM sales
    GROUP BY region
)
SELECT * FROM regional_sales WHERE total_sales > 100000;
```

### Extensions
```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_stat_statements";
```

### Useful Commands
```sql
\l          -- List databases
\c dbname   -- Connect to database
\dt         -- List tables
\d tablename -- Describe table
\q          -- Quit
```
