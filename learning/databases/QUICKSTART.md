# Quick Start Guide

## Getting Started in 3 Steps

### 1. Run the Quick Setup
```bash
python quick-start.py
```

This will:
- Start MySQL and PostgreSQL Docker containers
- Install required Python packages
- Set up everything you need

### 2. Launch Jupyter Lab
```bash
jupyter lab
```
Then open `notebooks/database-connection-tutorial.ipynb`

### 3. Start Experimenting!

#### Option A: Use the Notebook
- Follow the interactive tutorial
- Run cells step by step
- Experiment with the examples

#### Option B: Direct Database Access
- **Adminer Web Interface**: http://localhost:8080
- **MySQL**: `mysql -h localhost -P 3306 -u root -p` (password: `rootpassword`)
- **PostgreSQL**: `psql -h localhost -p 5432 -U postgres -d learning` (password: `postgres`)

## What's Included

### 📁 Folder Structure
```
databases/
├── docs/               # Documentation by database type
├── sql/               # SQL query examples and exercises  
├── notebooks/         # Jupyter notebooks for learning
├── data/              # Sample datasets
└── config/            # Database configurations
```

### 🐳 Docker Services
- MySQL 8.0 with sample data
- PostgreSQL 15 with sample data  
- Adminer for web-based database management

### 📚 Learning Materials
- **Common SQL concepts** - Basic queries, joins, aggregations
- **MySQL specifics** - Auto-increment, storage engines, MySQL functions
- **PostgreSQL specifics** - JSON/JSONB, arrays, advanced features
- **Practice exercises** - Hands-on problems to solve

## Sample Queries to Try

### MySQL Examples
```sql
-- Show all users with post counts
SELECT u.username, COUNT(p.id) as posts 
FROM users u 
LEFT JOIN posts p ON u.id = p.user_id 
GROUP BY u.id, u.username;
```

### PostgreSQL Examples  
```sql
-- Query JSON metadata
SELECT username, metadata->>'role' as role 
FROM users 
WHERE metadata->>'role' = 'admin';

-- Work with arrays
SELECT username, tags 
FROM users 
WHERE 'developer' = ANY(tags);
```

## Next Steps

1. **Follow the tutorial notebook** - Start with `database-connection-tutorial.ipynb`
2. **Read the docs** - Check out database-specific documentation in `docs/`
3. **Try the exercises** - Practice with queries in `sql/exercises/`
4. **Create your own** - Add your own documentation and experiments
5. **Compare databases** - Use the comparison notebooks to see differences

Happy learning! 🎓
