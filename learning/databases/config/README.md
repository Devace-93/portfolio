# Database Configuration

## Connection Strings

### MySQL
```python
# Using mysql-connector-python
import mysql.connector

config = {
    'user': 'root',
    'password': 'rootpassword',
    'host': 'localhost',
    'port': 3306,
    'database': 'learning',
    'raise_on_warnings': True
}

conn = mysql.connector.connect(**config)
```

### PostgreSQL
```python
# Using psycopg2
import psycopg2

conn = psycopg2.connect(
    host='localhost',
    port=5432,
    user='postgres',
    password='postgres',
    database='learning'
)
```

### SQLAlchemy URLs
```python
# MySQL
mysql_url = "mysql+mysqlconnector://root:rootpassword@localhost:3306/learning"

# PostgreSQL
postgresql_url = "postgresql+psycopg2://postgres:postgres@localhost:5432/learning"
```

## Environment Variables

Create a `.env` file in your project root:

```bash
# MySQL
MYSQL_HOST=localhost
MYSQL_PORT=3306
MYSQL_USER=root
MYSQL_PASSWORD=rootpassword
MYSQL_DATABASE=learning

# PostgreSQL
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DATABASE=learning

# Adminer (Web DB Interface)
ADMINER_URL=http://localhost:8080
```
