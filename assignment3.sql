use sakila ;
CREATE TABLE Sales_Data (
    OrderID     INT             NOT NULL PRIMARY KEY,
    CustomerID  VARCHAR(10)     NOT NULL,
    Category    VARCHAR(20)     NOT NULL,
    OrderDate   DATE            NOT NULL,
    OrderValue  DECIMAL(10, 2)  NOT NULL
);


INSERT INTO Sales_Data (OrderID, CustomerID, Category, OrderDate, OrderValue) VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500.00),
(1002, 'C203', 'Apparel',     '2024-01-07',  3200.00),
(1003, 'C205', 'Home',        '2024-01-10',  5800.00),
(1004, 'C201', 'Electronics', '2024-01-15',  8900.00),
(1005, 'C207', 'Apparel',     '2024-01-18',  2100.00),
(1006, 'C210', 'Home',        '2024-01-22',  4700.00),
(1007, 'C203', 'Electronics', '2024-02-01', 15300.00),
(1008, 'C212', 'Apparel',     '2024-02-05',  1800.00),
(1009, 'C205', 'Home',        '2024-02-08',  6200.00),
(1010, 'C214', 'Electronics', '2024-02-12',  9400.00),
(1011, 'C207', 'Apparel',     '2024-02-17',  2900.00),
(1012, 'C210', 'Electronics', '2024-02-20', 11000.00),
(1013, 'C212', 'Home',        '2024-03-01',  3500.00),
(1014, 'C201', 'Apparel',     '2024-03-05',  4100.00),
(1015, 'C214', 'Home',        '2024-03-10',  7800.00),
(1016, 'C210', 'home',        '2024-03-10',  9900.00)  
;

select * from sales_data;
-- LEVEL 1 — EASY Basic GROUP BY with Aggregate Functions
-- Q1 Calculate the total revenue (sum of OrderValue) for each product Category
select  category,sum(ordervalue) as totalrevenue from sales_data group by category;
select category as product_category, sum(ordervalue) as total_revenue from sales_data group by product_category;

-- Q2. Count the total number of orders placed in each Category.
select category,count(*)as total_orders from sales_data group by category;

-- 3. Find the highest (maximum) single OrderValue within each Category.
select  category,max(ordervalue) from sales_data group by category;
select category,max(ordervalue) from sales_data group by category;

-- LEVEL 2 — EASY Using DISTINCT to Identify Unique Segments
-- Q1. List all unique product Categories that appear in the Sales_Data table.
select distinct category from sales_data;

-- Q2. List all unique CustomerIDs who have placed at least one order.
select distinct customerid from sales_data ;

-- Q3. Find all unique combinations of CustomerID and Category (i.e., which customers bought from which categories).
select distinct customerid,category from sales_data;

-- LEVEL 3 — MEDIUM GROUP BY with Multiple Columns

-- Hint: Group records by more than one column simultaneously to create multi-dimensional summaries.
-- bcz aggregate func hai esliye non aggregate ko group by likhna pdega
select customerid,category,sum(ordervalue) as total_sales from sales_data group by  customerid,category;

-- Q2. Order Count by CustomerID and Category
-- bcz aggregate func aa gya esliye group by m select wle likhne pdege otherwise it will not run
select customerid,category,count(*) as ordercount from sales_data group by customerid,category;
select customerid,category,count(*) as count_transactions from sales_data group by customerid,category;

-- Q3. Revenue by Category and Month
select * from sales_data;
select category,month(orderdate) as m,sum(ordervalue) as totalsales from sales_data group by m,category;
select category,month(orderdate) as m,sum(ordervalue) as totalsales from sales_data group by category,m;

-- LEVEL 4 — MEDIUM GROUP BY Combined with HAVING
-- Q1. Categories with Revenue > $20,000
select category,sum(ordervalue) as totalrevenue from sales_data group by category having totalrevenue>20000;
select category,sum(ordervalue) as totalsales from sales_data
 group by category having category in ('electronics','home') order by category;
 
--  Q2. Customers with More Than 1 Order
select customerid,count(*) as transactions from sales_data group by customerid having transactions>1 order by customerid;

-- Q3. Customer + Category Combinations Spending > $10,000
select customerid,sum(ordervalue) as total_spent,category from sales_data group by customerid,category having total_spent>10000 
order by customerid;

-- Level 5 — Expected Output
-- Q1. Category Summary (Avg Order Value > $5,000, sorted by Revenue) 

select category,count(*) as total_order,avg(ordervalue) as avgorder_value,
sum(ordervalue) as total_revenue from sales_data group by category having avgorder_value>5000 order by total_revenue ;
 -- Q2. High-Value Repeat Customers (>1 order, Avg OrderValue > $6,000)
select customerid,count(*) as order_count,avg(ordervalue) as avg_ordervalue from sales_data group by customerid
having order_count>1 and avg_ordervalue>6000 ;

-- Q3. Category-Month Summary (Min 2 Orders, Sorted by Month then Revenue)
-- Category Month Orders Total_Revenue ($) Avg_OrderValue ($)
select * from sales_data;
use sakila;
select category,month(orderdate) as m,sum(ordervalue) as total_revenue,avg(ordervalue) as avg_ordervalue,count(*) 
as orders from sales_data group by category,month(orderdate) having orders>=2 order by m,total_revenue;

-- finish --