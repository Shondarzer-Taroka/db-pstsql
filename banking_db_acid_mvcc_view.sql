
-- -- Create accounts table
-- CREATE TABLE accounts (
--     account_id SERIAL PRIMARY KEY,
--     customer_name VARCHAR(100) NOT NULL,
--     account_number VARCHAR(20) UNIQUE NOT NULL,
--     balance DECIMAL(15, 2) DEFAULT 0.00 CHECK (balance >= 0),
--     account_type VARCHAR(20) CHECK (account_type IN ('SAVINGS', 'CHECKING', 'BUSINESS')),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );

-- -- Create transactions table
-- CREATE TABLE transactions (
--     transaction_id SERIAL PRIMARY KEY,
--     account_id INTEGER REFERENCES accounts(account_id),
--     transaction_type VARCHAR(20) CHECK (transaction_type IN ('DEPOSIT', 'WITHDRAWAL', 'TRANSFER')),
--     amount DECIMAL(15, 2) NOT NULL CHECK (amount > 0),
--     description TEXT,
--     transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     status VARCHAR(20) DEFAULT 'COMPLETED' CHECK (status IN ('PENDING', 'COMPLETED', 'FAILED'))
-- );

-- -- Insert sample data
-- INSERT INTO accounts (customer_name, account_number, balance, account_type) VALUES
-- ('John Doe', 'SAV001', 5000.00, 'SAVINGS'),
-- ('Jane Smith', 'CHK001', 2500.00, 'CHECKING'),
-- ('Bob Johnson', 'BUS001', 10000.00, 'BUSINESS');

-- INSERT INTO transactions (account_id, transaction_type, amount, description) VALUES
-- (1, 'DEPOSIT', 1000.00, 'Initial deposit'),
-- (2, 'DEPOSIT', 500.00, 'Opening balance'),
-- (3, 'DEPOSIT', 2000.00, 'Business account funding');




SELECT * FROM accounts

-- Atomicity
BEGIN;
-- Transfer $100 from John to Jane
UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 100 WHERE account_id = 2;
INSERT INTO transactions (account_id, transaction_type, amount, description)
VALUES (1, 'TRANSFER', 100, 'Transfer to Jane Smith');
COMMIT; -- Both updates succeed or both fail

-- Consistency 
-- This will fail due to CHECK constraint (balance cannot be negative)
UPDATE accounts SET balance = balance - 6000 WHERE account_id = 1;


-- Isolation 
-- Session 1
BEGIN;
UPDATE accounts SET balance = balance - 200 WHERE account_id = 1;

-- Session 2 (will see the old balance until Session 1 commits)
SELECT balance FROM accounts WHERE account_id = 1;


-- Durability 
-- Once committed, changes persist even after system crash
COMMIT;


-- MVCC (Multi-Version Concurrency Control)
-- Session 1
BEGIN;
UPDATE accounts SET balance = balance + 500 WHERE account_id = 1;

-- Session 2 (sees the old version due to MVCC)
SELECT balance FROM accounts WHERE account_id = 1; -- Shows old balance

-- Session 1
COMMIT;

-- Session 2 (now sees the updated balance)
SELECT balance FROM accounts WHERE account_id = 1;




-- Creating Views

-- Simple view showing account summary
CREATE VIEW account_summary AS
SELECT 
    a.account_id,
    a.customer_name,
    a.account_number,
    a.balance,
    a.account_type,
    COUNT(t.transaction_id) as transaction_count
FROM accounts a
LEFT JOIN transactions t ON a.account_id = t.account_id
GROUP BY a.account_id;

-- Materialized view for reporting
CREATE MATERIALIZED VIEW monthly_transaction_summary AS
SELECT 
    account_id,
    DATE_TRUNC('month', transaction_date) as month,
    COUNT(*) as total_transactions,
    SUM(amount) as total_amount
FROM transactions
GROUP BY account_id, DATE_TRUNC('month', transaction_date);

-- Updatable view
CREATE VIEW customer_accounts AS
SELECT account_id, customer_name, account_number, balance
FROM accounts;

-- Using the views
SELECT * FROM account_summary;
SELECT * FROM monthly_transaction_summary;



-- View with Security:


