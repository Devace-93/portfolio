-- Sample employees dataset for practice
-- Can be used with both MySQL and PostgreSQL (with minor syntax adjustments)

INSERT INTO employees (name, department, salary, hire_date, manager_id) VALUES
('Alice Johnson', 'Engineering', 95000, '2022-01-15', NULL),
('Bob Smith', 'Engineering', 82000, '2022-02-01', 1),
('Carol Davis', 'Marketing', 75000, '2022-01-20', NULL),
('David Wilson', 'Engineering', 78000, '2022-03-10', 1),
('Eve Brown', 'Marketing', 65000, '2022-02-15', 3),
('Frank Miller', 'Sales', 70000, '2022-01-30', NULL),
('Grace Lee', 'Sales', 68000, '2022-02-20', 6),
('Henry Taylor', 'Engineering', 85000, '2022-04-01', 1),
('Ivy Chen', 'Marketing', 72000, '2022-03-01', 3),
('Jack Thompson', 'Sales', 74000, '2022-04-15', 6);

-- Sample projects data
INSERT INTO projects (name, description, start_date, end_date, budget) VALUES
('Website Redesign', 'Complete overhaul of company website', '2023-01-01', '2023-06-30', 50000),
('Mobile App', 'Development of mobile application', '2023-03-01', '2023-12-31', 120000),
('Marketing Campaign', 'Q2 marketing campaign launch', '2023-04-01', '2023-06-30', 30000),
('Database Migration', 'Migration to new database system', '2023-02-01', '2023-08-31', 80000);

-- Employee project assignments
INSERT INTO employee_projects (employee_id, project_id, role) VALUES
(1, 1, 'Lead Developer'),
(2, 1, 'Frontend Developer'), 
(4, 1, 'Backend Developer'),
(8, 1, 'DevOps Engineer'),
(1, 2, 'Technical Lead'),
(2, 2, 'Mobile Developer'),
(4, 2, 'Backend Developer'),
(3, 3, 'Campaign Manager'),
(5, 3, 'Content Creator'),
(9, 3, 'Designer'),
(1, 4, 'Database Architect'),
(8, 4, 'Migration Specialist');
