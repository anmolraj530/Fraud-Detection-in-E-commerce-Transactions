# 🧩 Fraud Detection in E-commerce Transactions (SQL Project)

## 📘 Overview
This SQL project simulates an **e-commerce fraud detection system** similar to what teams like Amazon’s Account Integrity Team use.  
It focuses on detecting suspicious activities such as multiple accounts from the same IP, excessive refunds, and sudden transaction spikes.

### 🎯 Objective
To use SQL queries to:
- Detect potential fraudulent user behavior.
- Generate risk scores.
- Build summarized fraud detection dashboards.

---

## 🧰 Tools & Skills
- **Database:** MySQL Workbench  
- **Skills:** SQL Joins, CTEs, Window Functions, Aggregations, CASE statements  
- **Concepts:** Fraud analytics, anomaly detection, KPI reporting  

---

## 🗃️ Database Schema
### Tables:
1. **users**
   - user_id (INT)
   - name (VARCHAR)
   - country (VARCHAR)
   - signup_date (DATE)
   - device_type (VARCHAR)

2. **transactions**
   - transaction_id (INT)
   - user_id (INT)
   - amount (DECIMAL)
   - payment_method (VARCHAR)
   - timestamp (DATETIME)
   - status (VARCHAR)

3. **login_activity**
   - login_id (INT)
   - user_id (INT)
   - login_time (DATETIME)
   - ip_address (VARCHAR)
   - device_type (VARCHAR)

4. **refunds**
   - refund_id (INT)
   - transaction_id (INT)
   - reason (VARCHAR)
   - refund_amount (DECIMAL)
   - refund_date (DATE)

---

## 🧩 1. Create Tables
See file: `create_tables.sql`

## 🧾 2. Insert Sample Data
See file: `insert_data.sql`

## 📊 3. Analysis & Fraud Detection Queries
See file: `analysis_queries.sql`

---

## 🧩 5. Conclusion
✅ Detected users sharing IPs → potential fake accounts  
✅ Flagged accounts with high refund ratios  
✅ Created a fraud dashboard using SQL views  
✅ Project demonstrates SQL-based **fraud analytics capability**, perfect for **Risk Analyst roles at Amazon**  

---

📎 *Author:* Anmol Raj  
