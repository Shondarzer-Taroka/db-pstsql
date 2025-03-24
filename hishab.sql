CREATE TABLE employees (
    id SERIAL PRIMARY KEY,  -- SERIAL automatically creates an auto-incrementing integer
    fname VARCHAR(100) NOT NULL,
    lname VARCHAR(100) NOT NULL,  
    email VARCHAR(100) NOT NULL UNIQUE,
    dept VARCHAR(100),
    salary INT DEFAULT 13000, 
    hire_date DATE
);
