# Database Learning & Documentation Project

This project contains documentation and experimental SQL queries for MySQL and PostgreSQL databases.

## Structure

```
databases/
├── docs/                   # Documentation files
│   ├── mysql/             # MySQL-specific documentation
│   ├── postgresql/        # PostgreSQL-specific documentation
│   └── common/            # Common SQL concepts
├── notebooks/             # Jupyter notebooks for interactive learning
│   ├── mysql/             # MySQL notebooks
│   ├── postgresql/        # PostgreSQL notebooks
│   └── comparisons/       # Database comparison notebooks
├── sql/                   # SQL query files
│   ├── mysql/             # MySQL queries
│   ├── postgresql/        # PostgreSQL queries
│   └── exercises/         # Practice exercises
├── data/                  # Sample datasets
├── docker/                # Docker configurations
└── config/                # Database connection configs
```

## Quick Start

1. **Start the databases:**
   ```bash
   docker-compose up -d
   ```

2. **Install Python dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

3. **Launch Jupyter:**
   ```bash
   jupyter lab
   ```

4. **Connect to databases:**
   - MySQL: `localhost:3306` (user: `root`, password: `rootpassword`)
   - PostgreSQL: `localhost:5432` (user: `postgres`, password: `postgres`)

## Features

- 🐳 **Dockerized Databases**: Both MySQL and PostgreSQL ready to use
- 📚 **Interactive Notebooks**: Learn and experiment with Jupyter
- 📝 **Structured Documentation**: Organized by database type and concepts
- 🏃 **Quick Experiments**: Ready-to-use SQL files
- 📊 **Sample Data**: Practice datasets included
- 🔧 **Easy Configuration**: Pre-configured connection strings

## Database Connections

### MySQL
```python
import mysql.connector
conn = mysql.connector.connect(
    host='localhost',
    port=3306,
    user='root',
    password='rootpassword',
    database='learning'
)
```

### PostgreSQL
```python
import psycopg2
conn = psycopg2.connect(
    host='localhost',
    port=5432,
    user='postgres',
    password='postgres',
    database='learning'
)
```

## Learning Path

1. **Basics** - Start with fundamental SQL concepts
2. **Database-Specific Features** - Learn MySQL and PostgreSQL specifics
3. **Advanced Topics** - Indexes, optimization, stored procedures
4. **Comparisons** - Side-by-side database feature comparisons
5. **Real-World Exercises** - Practical scenarios and problems

Happy Learning! 🚀
