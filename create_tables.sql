CREATE DATABASE ecommerce_fraud;
USE ecommerce_fraud;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50),
    signup_date DATE,
    device_type VARCHAR(50)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    timestamp DATETIME,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE login_activity (
    login_id INT PRIMARY KEY,
    user_id INT,
    login_time DATETIME,
    ip_address VARCHAR(50),
    device_type VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE refunds (
    refund_id INT PRIMARY KEY,
    transaction_id INT,
    reason VARCHAR(100),
    refund_amount DECIMAL(10,2),
    refund_date DATE,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);
