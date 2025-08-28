CREATE TABLE employees (
    id SERIAL PRIMARY KEY,  -- SERIAL automatically creates an auto-incrementing integer
    fname VARCHAR(100) NOT NULL,
    lname VARCHAR(100) NOT NULL,  
    email VARCHAR(100) NOT NULL UNIQUE,
    dept VARCHAR(100),
    salary INT DEFAULT 13000, 
    hire_date DATE
);

select * from employees;

INSERT INTO employees (fname, lname, email, dept, salary, hire_date)
VALUES ( 'Rahesh', 'Kumar', 'rahes@gmail.com', 'IT', 43000, '2023-02-20');



