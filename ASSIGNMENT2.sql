use sakila;
CREATE TABLE saleby1 (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(10),
    Category VARCHAR(20),
    OrderDate DATE,
    OrderValue DECIMAL(10,2)
);
INSERT INTO saleby1(OrderID, CustomerID, Category, OrderDate, OrderValue) VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500),
(1002, 'C203', 'Apparel', '2024-01-07', 3200),
(1003, 'C205', 'Home', '2024-01-10', 5800),
(1004, 'C201', 'Electronics', '2024-01-15', 8900),
(1005, 'C207', 'Apparel', '2024-01-18', 2100),
(1006, 'C210', 'Home', '2024-01-22', 4700),

(1007, 'C203', 'Electronics', '2024-02-01', 15300),
(1008, 'C212', 'Apparel', '2024-02-05', 1800),
(1009, 'C205', 'Home', '2024-02-08', 6200),
(1010, 'C214', 'Electronics', '2024-02-12', 9400),
(1011, 'C207', 'Apparel', '2024-02-17', 2900),
(1012, 'C210', 'Electronics', '2024-02-20', 11000),

(1013, 'C212', 'Home', '2024-03-01', 3500),
(1014, 'C201', 'Apparel', '2024-03-05', 4100),
(1015, 'C214', 'Home', '2024-03-10', 7800),

(1016, 'C220', 'Electronics', '2024-03-12', 13200),
(1017, 'C221', 'Apparel', '2024-03-15', 2600),
(1018, 'C222', 'Home', '2024-03-18', 5400),

(1019, 'C223', 'Electronics', '2024-04-02', 17000),
(1020, 'C224', 'Apparel', '2024-04-05', 3100),
(1021, 'C225', 'Home', '2024-04-08', 6800),
(1022, 'C226', 'Electronics', '2024-04-12', 10200),
(1023, 'C227', 'Apparel', '2024-04-16', 2700),

(1024, 'C228', 'Home', '2024-05-01', 7500),
(1025, 'C229', 'Electronics', '2024-05-04', 14500),
(1026, 'C230', 'Apparel', '2024-05-07', 3300),
(1027, 'C231', 'Home', '2024-05-10', 6100),
(1028, 'C232', 'Electronics', '2024-05-14', 9800),

(1029, 'C233', 'Apparel', '2024-06-02', 2900),
(1030, 'C234', 'Home', '2024-06-06', 7200),
(1031, 'C235', 'Electronics', '2024-06-10', 8800),
(1032, 'C236', 'Apparel', '2024-06-12', 2600),
(1033, 'C237', 'Home', '2024-06-15', 5900),

(1034, 'C238', 'Electronics', '2024-07-01', 13400),
(1035, 'C239', 'Apparel', '2024-07-04', 3100),
(1036, 'C240', 'Home', '2024-07-07', 7200),
(1037, 'C241', 'Electronics', '2024-07-10', 9900),
(1038, 'C242', 'Apparel', '2024-07-14', 2800),
(1039, 'C243', 'Home', '2024-07-18', 6400),

(1040, 'C244', 'Electronics', '2024-08-02', 15800),
(1041, 'C245', 'Apparel', '2024-08-05', 3500),
(1042, 'C246', 'Home', '2024-08-08', 7800),
(1043, 'C247', 'Electronics', '2024-08-12', 11200),
(1044, 'C248', 'Apparel', '2024-08-15', 2900),
(1045, 'C249', 'Home', '2024-08-18', 6700),

(1046, 'C250', 'Electronics', '2024-09-01', 14500),
(1047, 'C251', 'Apparel', '2024-09-05', 3200),
(1048, 'C252', 'Home', '2024-09-09', 7100),
(1049, 'C253', 'Electronics', '2024-09-12', 9800),
(1050, 'C254', 'Apparel', '2024-09-15', 3000);
select * from saleby1;
-- LEVEL 1 — EASY Basic GROUP BY with Aggregate Functions
-- Q1. Calculate the total revenue (sum of OrderValue) for each product Category.
select category as product_category, sum(ordervalue) as total_revenue from saleby1 group by product_category;

-- Q2. Count the total number of orders placed in each Category.
select category ,count(*) as total_orders from saleby1 group by category;

-- 3. Find the highest (maximum) single OrderValue within each Category.
select category,max(ordervalue) from saleby1 group by category;

-- LEVEL 2 — EASY Using DISTINCT to Identify Unique Segments
-- Q1. List all unique product Categories that appear in the Sales_Data table.
select distinct category from saleby1;

-- Q2. List all unique CustomerIDs who have placed at least one order.
select distinct customerid from saleby1 ;

-- Q3. Find all unique combinations of CustomerID and Category (i.e., which customers bought from which categories).
select distinct customerid,category from saleby1;

-- LEVEL 3 — MEDIUM GROUP BY with Multiple Columns

-- Hint: Group records by more than one column simultaneously to create multi-dimensional summaries.
select customerid,category,sum(ordervalue) as total_sales from saleby1 group by  customerid,category;

select count(customerid),category from saleby1 group by customerid,category;
