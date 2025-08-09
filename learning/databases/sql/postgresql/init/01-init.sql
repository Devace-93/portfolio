-- Initial PostgreSQL setup script
-- This will be executed when the PostgreSQL container starts

-- Create sample tables
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    metadata JSONB,
    tags TEXT[],
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    published BOOLEAN DEFAULT FALSE,
    metadata JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE post_categories (
    post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories(id) ON DELETE CASCADE,
    PRIMARY KEY (post_id, category_id)
);

-- Create indexes
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_posts_user_id ON posts(user_id);
CREATE INDEX idx_posts_published ON posts(published);

-- Insert sample data
INSERT INTO users (username, email, first_name, last_name, metadata, tags) VALUES
('john_doe', 'john@example.com', 'John', 'Doe', '{"role": "admin", "preferences": {"theme": "dark"}}', ARRAY['developer', 'admin']),
('jane_smith', 'jane@example.com', 'Jane', 'Smith', '{"role": "user", "preferences": {"theme": "light"}}', ARRAY['writer', 'blogger']),
('bob_johnson', 'bob@example.com', 'Bob', 'Johnson', '{"role": "user", "preferences": {"theme": "auto"}}', ARRAY['reader']);

INSERT INTO categories (name, description) VALUES
('Technology', 'Posts about technology and programming'),
('Lifestyle', 'Posts about lifestyle and personal experiences'),
('Education', 'Educational content and tutorials');

INSERT INTO posts (title, content, user_id, published, metadata) VALUES
('Advanced PostgreSQL Features', 'PostgreSQL offers many advanced features...', 1, TRUE, '{"read_time": 10, "difficulty": "intermediate"}'),
('JSON in PostgreSQL', 'Working with JSON data in PostgreSQL...', 1, TRUE, '{"read_time": 8, "difficulty": "beginner"}'),
('My Learning Journey', 'Here is how I learned databases...', 2, TRUE, '{"read_time": 5, "difficulty": "beginner"}');

INSERT INTO post_categories (post_id, category_id) VALUES
(1, 1), (1, 3),
(2, 1), (2, 3),
(3, 2), (3, 3);

-- Create a function for updating the updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger to automatically update updated_at
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
