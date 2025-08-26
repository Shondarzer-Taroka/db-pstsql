
-- Create accounts table
CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    balance DECIMAL(15, 2) DEFAULT 0.00 CHECK (balance >= 0),
    account_type VARCHAR(20) CHECK (account_type IN ('SAVINGS', 'CHECKING', 'BUSINESS')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create transactions table
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_id INTEGER REFERENCES accounts(account_id),
    transaction_type VARCHAR(20) CHECK (transaction_type IN ('DEPOSIT', 'WITHDRAWAL', 'TRANSFER')),
    amount DECIMAL(15, 2) NOT NULL CHECK (amount > 0),
    description TEXT,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'COMPLETED' CHECK (status IN ('PENDING', 'COMPLETED', 'FAILED'))
);

-- Insert sample data
INSERT INTO accounts (customer_name, account_number, balance, account_type) VALUES
('John Doe', 'SAV001', 5000.00, 'SAVINGS'),
('Jane Smith', 'CHK001', 2500.00, 'CHECKING'),
('Bob Johnson', 'BUS001', 10000.00, 'BUSINESS');

INSERT INTO transactions (account_id, transaction_type, amount, description) VALUES
(1, 'DEPOSIT', 1000.00, 'Initial deposit'),
(2, 'DEPOSIT', 500.00, 'Opening balance'),
(3, 'DEPOSIT', 2000.00, 'Business account funding');