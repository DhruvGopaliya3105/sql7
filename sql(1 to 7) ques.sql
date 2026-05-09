use sakila;
CREATE TABLE sale (
    id INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(50),
    product VARCHAR(50),
    sales_person VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sale (region, product, sales_person, amount, sale_date) VALUES
('North', 'Laptop', 'Amit', 55000, '2025-01-05'),
('North', 'Mobile', 'Amit', 20000, '2025-01-06'),
('South', 'Laptop', 'Ravi', 60000, '2025-01-07'),
('East', 'Tablet', 'Suman', 15000, '2025-01-08'),
('West', 'Laptop', 'Neha', 58000, '2025-01-09'),

('North', 'Tablet', 'Amit', 12000, '2025-01-10'),
('South', 'Mobile', 'Ravi', 22000, '2025-01-11'),
('East', 'Laptop', 'Suman', 50000, '2025-01-12'),
('West', 'Tablet', 'Neha', 14000, '2025-01-13'),
('North', 'Laptop', 'Amit', 57000, '2025-01-14'),

('South', 'Tablet', 'Ravi', 13000, '2025-01-15'),
('East', 'Mobile', 'Suman', 21000, '2025-01-16'),
('West', 'Laptop', 'Neha', 61000, '2025-01-17'),
('North', 'Mobile', 'Amit', 19000, '2025-01-18'),
('South', 'Laptop', 'Ravi', 62000, '2025-01-19'),

('East', 'Tablet', 'Suman', 16000, '2025-01-20'),
('West', 'Mobile', 'Neha', 23000, '2025-01-21'),
('North', 'Tablet', 'Amit', 11000, '2025-01-22'),
('South', 'Mobile', 'Ravi', 25000, '2025-01-23'),
('East', 'Laptop', 'Suman', 52000, '2025-01-24'),

('West', 'Tablet', 'Neha', 13500, '2025-01-25'),
('North', 'Laptop', 'Amit', 59000, '2025-01-26'),
('South', 'Tablet', 'Ravi', 12500, '2025-01-27'),
('East', 'Mobile', 'Suman', 20500, '2025-01-28'),
('West', 'Laptop', 'Neha', 60000, '2025-01-29'),

('North', 'Mobile', 'Amit', 21000, '2025-01-30'),
('South', 'Laptop', 'Ravi', 63000, '2025-01-31'),
('East', 'Tablet', 'Suman', 17000, '2025-02-01'),
('West', 'Mobile', 'Neha', 24000, '2025-02-02'),
('North', 'Tablet', 'Amit', 12500, '2025-02-03'),

('South', 'Mobile', 'Ravi', 26000, '2025-02-04'),
('East', 'Laptop', 'Suman', 54000, '2025-02-05'),
('West', 'Tablet', 'Neha', 15000, '2025-02-06'),
('North', 'Laptop', 'Amit', 61000, '2025-02-07'),
('South', 'Tablet', 'Ravi', 14000, '2025-02-08');
select * from sale;
select sum(amount) as mobile_total_sales from sales where product = 'mobile';
-- you need to find total sales and avg sales in the north region but for the product of laptop and mobile
select sum(amount)as totalsales,avg(amount) as avgsales,region from sale where region='north' and product in ('laptop','mobile');
select sum(amount) as total_sales,avg(amount) as avg_sales from sale where region='north' and product in ('laptop','mobile');
select sum(amount) as total_sales,avg(amount) as avg_sales from sale where region='north';
-- find out the maximum amount and the minimum amount for feb month
select month(sale_date),max(amount),min(amount) from sale where month(sale_date)=2 group by month(sale_date);
select max(amount) as max_amount,min(amount) as min_amount from sale where month(sale_date)=2;
-- extra practice question
-- 1 find out the total sales we have done for each region -- each define the group by 
select region,sum(amount) as totalsales from sale group by region;
select region,sum(amount) as total_sales from sale group by region; -- jo group by bole wo aage bhi show krna h

-- 2 find out the avg sales done by each person
select sales_person,avg(amount) from sale group by sales_person;
select sales_person,avg(amount) as avg_sales from sale group by sales_person;
-- 3 find the total amount done for each product but the amit should not be the sales person
select sales_person,product,sum(amount) as totalamount from sale where sales_person!='amit' group by sales_person,product;
select sales_person,product,sum(amount) as total_sales from sale where sales_person != 'amit' group by product,sales_person;

--  4 find the no of sales  for each person for the ammount  >10000  -- count(*) no of rows
select sales_person,count(*) as no_of_sales from sale where amount>10000 group by sales_person;
--  5 find the number of transaction done from day1 to day 7 for any month
select count(*) as total_transaction from sale where month(sale_date)=1 ;

--  6  find the total amount,avgamout,maxamount for each product and each region
select region,product,sum(amount) as total_amount,avg(amount) as avg_amount,max(amount) as max_amount 
from sale  group by product,region;
--  7 find the total transaction amount for each product where the product should be sold more than 13 times
select  product,count(*)as s  from sale group by product having count(*)>10;
use sakila;
select product,sum(amount) from sale group by product having sum(amount)>250000;
-- find how many sales/no of sales are done each person 
select  sales_person,sum(amount) as sales from sale group by sales_person;
select sales_person ,count(*) as total_sales from sale group by sales_person having count(*)>8;
-- 
select region,sum(amount) from sale group by region having count(*)>9;
-- find the total transaction done by each person in the decreasing order
select * from sale;

select sales_person,count(* )as t from sale group by sales_person order by t desc;
-- group inside group 
select sales_person,count(sales_person) from sale group by sales_person;
select sales_person,product,sum(amount),avg(amount),count(*) from sale group by sales_person,product order by sales_person;
use sakila;
select year(payment_date),month(payment_date),sum(amount) from payment group by year(payment_date),month(payment_date);
select month(payment_date),year(payment_date),sum(amount) from payment group by month(payment_date),year(payment_date);


