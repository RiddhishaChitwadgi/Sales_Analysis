-- Database: New

-- DROP DATABASE IF EXISTS "New";

CREATE DATABASE "New"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE sales_representatives (
    ID INT PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    SALES_TEAM VARCHAR(255),
    HIRE_DATE DATE,
    TERMINATION_DATE DATE
);

-- Insert data into sales_representatives
INSERT INTO sales_representatives (ID, NAME, SALES_TEAM, HIRE_DATE, TERMINATION_DATE)
VALUES
(1, 'Alice Johnson', 'Team Alpha', '2024-05-15', NULL),
(2, 'Bob Smith', 'Team Beta', '2023-10-01', NULL),
(3, 'Charlie Davis', 'Team Gamma', '2024-03-20', NULL),
(4, 'Dana White', 'Team Delta', '2024-06-01', NULL),
(5, 'Emily Clark', 'Team Alpha', '2024-04-12', NULL);

-- Create the products table
CREATE TABLE products (
    ID INT PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    DESCRIPTION VARCHAR(255)
);

-- Create the sales table
CREATE TABLE sales (
    ID INT PRIMARY KEY,
    SALES_REP_ID INT,
    PRODUCT_ID INT,
    SUBSCRIPTION_COST FLOAT,
    CONTRACT_SIGNED_DATE DATE,
    SUBSCRIPTION_START_DATE DATE,
    SUBSCRIPTION_RENEWAL_DATE DATE,
    AUTO_RENEWAL_ENABLED BOOLEAN,
    FOREIGN KEY (SALES_REP_ID) REFERENCES sales_representatives(ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES products(ID)
);

-- Insert data into products
INSERT INTO products (ID, NAME, DESCRIPTION)
VALUES
(1, 'Software A', 'Cloud-based productivity tool'),
(2, 'Software B', 'Marketing automation tool'),
(3, 'Software C', 'CRM solution'),
(4, 'Software D', 'Analytics platform');

-- Insert data into sales
INSERT INTO sales (ID, SALES_REP_ID, PRODUCT_ID, SUBSCRIPTION_COST, CONTRACT_SIGNED_DATE, SUBSCRIPTION_START_DATE, SUBSCRIPTION_RENEWAL_DATE, AUTO_RENEWAL_ENABLED)
VALUES
(1, 1, 1, 100.00, '2024-08-05', '2024-08-10', '2025-08-10', TRUE),
(2, 2, 2, 150.00, '2024-08-12', '2024-08-20', '2025-08-20', FALSE),
(3, 3, 3, 120.00, '2024-08-15', '2024-08-25', '2025-08-25', TRUE),
(4, 4, 1, 200.00, '2024-07-20', '2024-07-30', '2025-07-30', TRUE),
(5, 5, 4, 250.00, '2024-08-25', '2024-09-01', '2025-09-01', FALSE),
(6, 1, 2, 175.00, '2024-08-28', '2024-09-05', '2025-09-05', TRUE);

Q1- "with 0"
SELECT sr.NAME AS sales_rep_name, COUNT(s.ID) AS total_sales
FROM sales_representatives sr
LEFT JOIN sales s ON s.SALES_REP_ID = sr.ID 
   AND s.CONTRACT_SIGNED_DATE BETWEEN '2024-08-01' AND '2024-08-31'
GROUP BY sr.NAME;

Q1- "Without 0"
SELECT sr.NAME AS sales_rep_name, COUNT(s.ID) AS total_sales
FROM sales s
JOIN sales_representatives sr ON s.SALES_REP_ID = sr.ID
WHERE s.CONTRACT_SIGNED_DATE BETWEEN '2024-08-01' AND '2024-08-31'
GROUP BY sr.NAME;

"Q2-Top Selling Product by Volume and Revenue (for Q1 2024)"
SELECT p.NAME AS product_name, 
       COUNT(s.ID) AS total_volume, 
       SUM(s.SUBSCRIPTION_COST) AS total_revenue
FROM sales s
JOIN products p ON s.PRODUCT_ID = p.ID
WHERE s.CONTRACT_SIGNED_DATE BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY p.NAME
ORDER BY total_volume DESC, total_revenue DESC
LIMIT 1;
"Q3"
SELECT sr.NAME AS sales_rep_name,
    COUNT(CASE WHEN s.CONTRACT_SIGNED_DATE <= sr.HIRE_DATE + INTERVAL '3 MONTH' THEN 1 END) AS deals_first_3_months,
    COUNT(CASE WHEN s.CONTRACT_SIGNED_DATE <= sr.HIRE_DATE + INTERVAL '12 MONTH' THEN 1 END) AS deals_first_year
FROM sales_representatives sr
LEFT JOIN sales s ON sr.ID = s.SALES_REP_ID
GROUP BY sr.NAME;