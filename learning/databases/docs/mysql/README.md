# MySQL Documentation

## Table of Contents

1. [Installation & Setup](#installation--setup)
2. [Data Types](#data-types)
3. [Table Operations](#table-operations)
4. [Queries](#queries)
5. [Indexes](#indexes)
6. [Storage Engines](#storage-engines)
7. [MySQL-Specific Features](#mysql-specific-features)

## Installation & Setup

### Using Docker (Recommended for learning)
```bash
docker-compose up -d mysql
```

### Connection
```bash
mysql -h localhost -P 3306 -u root -p
```

## Data Types

### Numeric Types
- `TINYINT`: -128 to 127
- `SMALLINT`: -32,768 to 32,767
- `MEDIUMINT`: -8,388,608 to 8,388,607
- `INT`: -2,147,483,648 to 2,147,483,647
- `BIGINT`: -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
- `DECIMAL(M,D)`: Fixed-point number
- `FLOAT`: Single precision floating point
- `DOUBLE`: Double precision floating point

### String Types
- `CHAR(M)`: Fixed-length string
- `VARCHAR(M)`: Variable-length string
- `TEXT`: Long text data
- `MEDIUMTEXT`: Medium text data
- `LONGTEXT`: Very long text data

### Date and Time Types
- `DATE`: YYYY-MM-DD
- `TIME`: HH:MM:SS
- `DATETIME`: YYYY-MM-DD HH:MM:SS
- `TIMESTAMP`: YYYY-MM-DD HH:MM:SS (with timezone)
- `YEAR`: YYYY

## MySQL-Specific Features

### AUTO_INCREMENT
```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);
```

### LIMIT with OFFSET
```sql
SELECT * FROM users LIMIT 10 OFFSET 20;
```

### ON DUPLICATE KEY UPDATE
```sql
INSERT INTO users (username, email) 
VALUES ('john', 'john@example.com')
ON DUPLICATE KEY UPDATE email = VALUES(email);
```

### Storage Engines
- **InnoDB**: Default, supports transactions, foreign keys
- **MyISAM**: Fast, no transactions
- **Memory**: Data stored in RAM

### Useful Commands
```sql
SHOW DATABASES;
USE database_name;
SHOW TABLES;
DESCRIBE table_name;
SHOW CREATE TABLE table_name;
```
