INSERT INTO employess (id, fname, lname, email, dept, salary, hire_date) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', 'HR', 42000, '2022-01-10'),
(2, 'Bob', 'Smith', 'bob.smith@example.com', 'Finance', 50000, '2021-03-15'),
(3, 'Dulta', 'Dail', 'dsa@gmail.com', 'IT', 43243, '2025-03-25'),
(4, 'Carol', 'White', 'carol.white@example.com', 'IT', 46000, '2023-06-01'),
(5, 'David', 'Brown', 'david.brown@example.com', 'Marketing', 48000, '2020-11-20'),
(6, 'Emma', 'Davis', 'emma.davis@example.com', 'Finance', 51000, '2023-01-25'),
(7, 'Frank', 'Green', 'frank.green@example.com', 'IT', 55000, '2021-09-12'),
(8, 'Grace', 'Hall', 'grace.hall@example.com', 'HR', 43000, '2022-04-18'),
(9, 'Henry', 'Miller', 'henry.miller@example.com', 'Marketing', 47000, '2023-08-05'),
(10, 'Ivy', 'Adams', 'ivy.adams@example.com', 'Finance', 49000, '2020-12-30'),
(11, 'Jack', 'Wilson', 'jack.wilson@example.com', 'IT', 60000, '2021-10-10'),
(12, 'Karen', 'Moore', 'karen.moore@example.com', 'HR', 44000, '2024-02-02'),
(13, 'Leo', 'Clark', 'leo.clark@example.com', 'IT', 58000, '2022-07-15'),
(14, 'Mia', 'Lewis', 'mia.lewis@example.com', 'Marketing', 46000, '2023-03-17'),
(15, 'Noah', 'Robinson', 'noah.robinson@example.com', 'Finance', 52000, '2021-05-22'),
(16, 'Olivia', 'Walker', 'olivia.walker@example.com', 'IT', 61000, '2024-01-11'),
(17, 'Paul', 'Young', 'paul.young@example.com', 'HR', 42000, '2020-09-09'),
(18, 'Quinn', 'King', 'quinn.king@example.com', 'Finance', 53000, '2022-10-28'),
(19, 'Rachel', 'Scott', 'rachel.scott@example.com', 'IT', 57000, '2023-05-03'),
(20, 'Sam', 'Baker', 'sam.baker@example.com', 'Marketing', 45000, '2021-08-14');




-- select * from employees
-- where id=9;
-- where salary >=50000;
-- where dept ='IT' OR dept='Marketing';
-- where dept ='IT' AND salary >=50000
-- where dept in ('IT','HR');
-- where dept not in ('IT','HR');
-- where salary between 60000 AND 70000;

-- select distinct dept from employees;
-- select * from employees order by fname desc;
select * from employees order by fname limit 3;


