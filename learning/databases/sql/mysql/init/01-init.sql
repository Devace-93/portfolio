-- Initial MySQL setup script
-- This will be executed when the MySQL container starts

-- Create sample database and tables
CREATE DATABASE IF NOT EXISTS learning;
USE learning;

-- Users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Posts table
CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    user_id INT,
    published BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Categories table
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- Post categories junction table
CREATE TABLE post_categories (
    post_id INT,
    category_id INT,
    PRIMARY KEY (post_id, category_id),
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

-- Insert sample data
INSERT INTO users (username, email, first_name, last_name) VALUES
('john_doe', 'john@example.com', 'John', 'Doe'),
('jane_smith', 'jane@example.com', 'Jane', 'Smith'),
('bob_johnson', 'bob@example.com', 'Bob', 'Johnson');

INSERT INTO categories (name, description) VALUES
('Technology', 'Posts about technology and programming'),
('Lifestyle', 'Posts about lifestyle and personal experiences'),
('Education', 'Educational content and tutorials');

INSERT INTO posts (title, content, user_id, published) VALUES
('Getting Started with MySQL', 'This is a comprehensive guide to MySQL...', 1, TRUE),
('My Daily Routine', 'Let me share my daily routine...', 2, TRUE),
('Learning SQL', 'SQL is a powerful language...', 1, FALSE);

INSERT INTO post_categories (post_id, category_id) VALUES
(1, 1), (1, 3),
(2, 2),
(3, 1), (3, 3);
