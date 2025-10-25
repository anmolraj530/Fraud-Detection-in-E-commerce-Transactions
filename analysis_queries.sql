-- 1️⃣ Detect shared IPs across multiple users (possible fake accounts)
SELECT 
    ip_address, 
    COUNT(DISTINCT user_id) AS user_count
FROM login_activity
GROUP BY ip_address
HAVING COUNT(DISTINCT user_id) > 1;

-- 2️⃣ Calculate refund rate per user
SELECT 
    u.user_id,
    u.name,
    COUNT(r.refund_id) AS total_refunds,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(COUNT(r.refund_id) / COUNT(t.transaction_id), 2) AS refund_rate
FROM users u
LEFT JOIN transactions t ON u.user_id = t.user_id
LEFT JOIN refunds r ON t.transaction_id = r.transaction_id
GROUP BY u.user_id;

-- 3️⃣ Flag users with high refund rate or shared IPs
WITH refund_summary AS (
    SELECT 
        u.user_id,
        COUNT(r.refund_id) AS total_refunds,
        COUNT(t.transaction_id) AS total_transactions,
        ROUND(COUNT(r.refund_id)/COUNT(t.transaction_id),2) AS refund_rate
    FROM users u
    LEFT JOIN transactions t ON u.user_id = t.user_id
    LEFT JOIN refunds r ON t.transaction_id = r.transaction_id
    GROUP BY u.user_id
)
SELECT 
    rs.user_id,
    u.name,
    CASE 
        WHEN rs.refund_rate > 0.3 THEN 'High Risk'
        WHEN rs.refund_rate BETWEEN 0.1 AND 0.3 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_level
FROM refund_summary rs
JOIN users u ON u.user_id = rs.user_id;

-- 4️⃣ Create a view for Fraud Summary Dashboard
CREATE VIEW fraud_summary AS
SELECT 
    u.user_id,
    u.name,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(CASE WHEN t.status='Refunded' THEN 1 ELSE 0 END) AS refunded_transactions,
    ROUND(SUM(CASE WHEN t.status='Refunded' THEN 1 ELSE 0 END) / COUNT(t.transaction_id), 2) AS refund_ratio
FROM users u
JOIN transactions t ON u.user_id = t.user_id
GROUP BY u.user_id;

-- 5️⃣ View final fraud summary
SELECT * FROM fraud_summary;
