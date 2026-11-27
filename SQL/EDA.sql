SELECT * FROM bank_churn;
SELECT COUNT(*) FROM bank_churn;

CREATE TABLE bank_churn (
    customer_id BIGINT PRIMARY KEY,
    credit_score INT,
    country VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    tenure INT,
    balance NUMERIC(12,2),
    products_number INT,
    credit_card INT,
    active_member INT,
    estimated_salary NUMERIC(12,2),
    churn INT
);

-- 1. churned customers
SELECT
    churn,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM bank_churn
GROUP BY churn;


-- 2. country wise churn rate

SELECT
    country,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(AVG(churn) * 100, 2) AS churn_rate
FROM bank_churn
GROUP BY country
ORDER BY churn_rate DESC;

-- 3. age wise churn rate

SELECT
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age < 40 THEN '30-39'
        WHEN age < 50 THEN '40-49'
        WHEN age < 60 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(AVG(churn) * 100, 2) AS churn_rate
FROM bank_churn
GROUP BY age_group
ORDER BY age_group;

-- 4. active_member affects churn_rate, how?
SELECT 
    active_member,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_percentage
FROM bank_churn
GROUP BY active_member;

-- 5. product_number wise churn_rate
SELECT
    products_number,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(AVG(churn) * 100, 2) AS churn_rate
FROM bank_churn
GROUP BY products_number
ORDER BY products_number;


-- 6. gender wise churn rate analysis

SELECT
    gender,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(AVG(churn) * 100, 2) AS churn_rate
FROM bank_churn
GROUP BY gender;


-- 7 balance wise but dud not get a significant insight

SELECT
    CASE
        WHEN balance = 0 THEN 'Zero Balance'
        WHEN balance < 50000 THEN 'Below 50K'
        WHEN balance < 100000 THEN '50K-100K'
        WHEN balance < 150000 THEN '100K-150K'
        ELSE '150K+'
    END AS balance_group,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(AVG(churn) * 100, 2) AS churn_rate
FROM bank_churn
GROUP BY balance_group
ORDER BY balance_group DESC;


-- 8. germany: age wise churn_rate analysis (age grp of 40-59 has highest)
SELECT
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age < 40 THEN '30-39'
        WHEN age < 50 THEN '40-49'
SELECT
    country,
    products_number,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(AVG(churn) * 100, 2) AS churn_rate
FROM bank_churn
GROUP BY country, products_number
ORDER BY country, products_number;
        WHEN age < 60 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(AVG(churn) * 100, 2) AS churn_rate
FROM bank_churn
WHERE country = 'Germany'
GROUP BY age_group
ORDER BY churn_rate DESC;

