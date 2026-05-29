create database dd;
use dd;
CREATE TABLE order1 (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    city VARCHAR(30) NOT NULL,
    category VARCHAR(30) NOT NULL,
    product VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    order_date DATE NOT NULL
);
INSERT INTO order1 VALUES
(1001, 'Rahul Sharma', 'Mumbai', 'Electronics', 'Laptop', 1, 55000, '2024-01-05'),
(1002, 'Priya Patel', 'Delhi', 'Clothing', 'Kurta', 3, 1500, '2024-01-07'),
(1003, 'Amit Singh', 'Bangalore', 'Electronics', 'Smartphone', 2, 18000, '2024-01-10'),
(1004, 'Sunita Rao', 'Chennai', 'Furniture', 'Chair', 4, 3200, '2024-01-12'),
(1005, 'Vikram Joshi', 'Mumbai', 'Electronics', 'Tablet', 1, 22000, '2024-01-15'),
(1006, 'Neha Gupta', 'Delhi', 'Clothing', 'Saree', 2, 4500, '2024-01-18'),
(1007, 'Kiran Kumar', 'Bangalore', 'Furniture', 'Table', 1, 8500, '2024-01-20'),
(1008, 'Deepak Verma', 'Chennai', 'Electronics', 'Headphones', 5, 2500, '2024-02-02'),
(1009, 'Anjali Mehta', 'Mumbai', 'Clothing', 'Jacket', 2, 3800, '2024-02-05'),
(1010, 'Ravi Nair', 'Bangalore', 'Electronics', 'Monitor', 1, 15000, '2024-02-08'),
(1011, 'Pooja Iyer', 'Chennai', 'Furniture', 'Sofa', 1, 25000, '2024-02-12'),
(1012, 'Suresh Patil', 'Delhi', 'Electronics', 'Keyboard', 3, 1800, '2024-02-15'),
(1013, 'Meena Desai', 'Mumbai', 'Furniture', 'Bookshelf', 2, 6000, '2024-02-18'),
(1014, 'Arun Reddy', 'Bangalore', 'Clothing', 'Jeans', 3, 2200, '2024-02-22'),
(1015, 'Lalita Shah', 'Delhi', 'Electronics', 'Smartwatch', 2, 9500, '2024-02-25');
select * from order1;
-- Easy Level
-- 1.Count total orders city-wise.
select city ,count(*) as total_orders from order1 group by city;
-- 2.Find total quantity sold category-wise.
select category,sum(quantity) as totalquantity from order1 group by category;
-- 3.Find average product price category-wise.
select category,avg(price) as avgproduct from order1 group by category;
-- 4 Find highest price city-wise.
select city,max(price) as highestprice from order1 group by city;
-- 5.Find minimum product price category-wise.
select category,min(price) as min_product from order1 group by category;
-- 6.Count total products category-wise.
select  category,count(*) as total_product from order1 group by category;
-- 7.Find total sales city-wise.
select city,sum(price*quantity) as totalsales from order1 group by city;
select * from order1;
-- 8.Find average quantity city-wise.
select city,avg(quantity) as avgquantity from order1 group by city;
-- 9.Find total quantity product-wise.
select product,sum(quantity) as totalquantity from order1 group by product;
-- 10.Find total sales product-wise.
select product,sum(price) as totalsales from order1 group by product;

-- Medium Level
-- 11  Find cities having more than 3 orders.
select * from order1;
select city as cities ,count(*) as orders from order1 group by city having count(*)>3;
-- 12 Find categories having total quantity above 5.
select category,sum(quantity) as totalquantity from order1 group by category having totalquantity>5;
-- 13 Find cities where average price is above 10000.
select city as cities ,avg(price) as avgprice from order1 group by cities having avg(price) >10000;
-- 14. Find categories having total sales above 50000.
select category as categories,sum(price) as totalsales from order1 group by category having totalsales>50000;
-- 15. Find products having total sales above 20000.
select product,sum(price) as totalsales from order1 group by product having totalsales>20000;
-- 16. Find cities having minimum price above 2000.
select city as cities ,min(price) as minimum_price from order1 group by cities having minimum_price>2000;
-- 17. Find categories having maximum product price above 20000.
select category as categories ,max(price) as maximum_price from order1 group by category having maximum_price>20000;
-- 18. Find products having quantity greater than 2.
select * from order1;
select product,count(*) as quantity from order1 group by product having quantity >2;
-- 19.Find cities having average sales above 15000.
select city,avg(price) from order1 group by city having avg(price)>15000;
-- 20 Find categories having average quantity above 2.
select category as categories ,avg(quantity) from order1 group by category having avg(quantity)>2;
-- Hard Level
-- 21 Find month-wise total sales.
select month(order_date) as month_wise ,sum(price) as totalsales from order1 group by month(order_date);
-- 22.Find category-wise highest sales amount.
select category,max(price) as highest_sales from order1 group by category ;
-- 23.Find city-wise total quantity and total sales.
select city as city_wise ,sum(price) as totalsales,count(*) as totalquantity from order1 group by city_wise;
-- 24.Find categories having more than 4 products.
select category,count(*) as products from order1 group by category having products >4;
-- 25.Find cities where total sales are greater than 50000.
select city,sum(price) as totalsales from order1 group by city having totalsales>50000;
select city,sum(price) as totalsales from order1 group by city having totalsales>50000;

-- joins
create database db;
use db;
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);
create database db;
use db;
INSERT INTO departments VALUES
(101, 'HR', 'Delhi'),
(102, 'Finance', 'Mumbai'),
(103, 'IT', 'Bangalore'),
(104, 'Marketing', 'Pune'),
(105, 'Sales', 'Chennai');
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees VALUES
(1, 'Rahul', 50000, 101, '2022-01-15'),
(2, 'Priya', 70000, 103, '2021-06-20'),
(3, 'Amit', 60000, 102, '2020-03-12'),
(4, 'Sneha', 80000, 103, '2019-08-25'),
(5, 'Vikas', 45000, 105, '2023-01-10'),
(6, 'Neha', 55000, 104, '2022-11-05'),
(7, 'Rohit', 90000, 103, '2018-04-30'),
(8, 'Anjali', 65000, 102, '2021-09-18'),
(9, 'Karan', 48000, 101, '2023-02-01'),
(10, 'Pooja', 75000, 105, '2020-07-22');
-- Easy Level (1-8)
select * from employees;
select * from departments;
-- Q1 Display all employees along with their department names. inner join along with
select e.emp_name,d.dept_name from employees as e inner join departments as d on e.dept_id=d.dept_id;
-- Q2

-- Display employee name and department location.
select e.emp_name,d.location from employees as e inner join departments as d on e.dept_id=d.dept_id;

-- Q3

-- Show employee name, salary, and department name.
select e.emp_name,e.salary,d.dept_name from employees as e inner join departments as d on e.dept_id= d.dept_id;

-- Q4

--  Display all employees working in the IT department.
select e.emp_name,d.dept_name from employees as e inner join departments as d on e.dept_id= d.dept_id
where d.dept_name = 'it';


-- Q5
select * from departments;
-- Show employee names working in Delhi location departments.
select e.emp_name,d.location from employees as e inner join departments as d on e.dept_id=d.dept_id
where location = 'delhi';

-- Moderate Level (1-10)
-- Q6

-- Display department names and total salary paid where the total salary is greater than 100000.
select * from departments;
select * from employees;
select d.dept_name,sum(salary) as totalsalary from employees as e inner join departments as d
on e.dept_id = d.dept_id  group by d.dept_name having totalsalary>100000;
-- Q7

-- Display departments having more than 1 employee whose salary is greater than 50000.
select d.dept_name,count(*) from employees as e inner join departments as d on
e.dept_id=d.dept_id where salary>50000 group by d.dept_name having count(*)>1;

-- Q8
select * from employees;
select * from departments;
-- Find the average salary of employees hired after 2020 in each department.
select d.dept_name,e.emp_name,avg(salary),hire_date,year(hire_date) from employees as e inner join departments as d
 where year(hire_date)>2020 group by e.emp_name,d.dept_name,hire_date;

-- Q9

-- Display department names and employee count where employee count is at least 2.
select d.dept_name,count(*) as employee from employees as e inner join departments as d on 
e.dept_id = d.dept_id group by d.dept_name having employee >=2;

-- 10

-- Show departments where the highest salary is above 80000.
select d.dept_name,max(salary) as highestsalary from employees as e inner join departments as d
on e.dept_id = d.dept_id group by d.dept_name having highestsalary>80000;

-- Q11

-- Find departments whose minimum salary is less than 50000.
select d.dept_name,min(salary) as minimumsalary from employees as e inner join departments as d
on e.dept_id  = d.dept_id group by d.dept_name having minimumsalary<50000;

-- 12

-- Display department names and total employees hired after 2021.
select d.dept_name,count(*) as totalemployee  ,hire_date,year(hire_date) from employees as e inner join departments as d
on e.dept_id = d.dept_id where year(hire_date)>2021 group by d.dept_name,hire_date;


-- 13 

-- Show departments where average salary is between 50000 and 75000.
select d.dept_name,avg(salary) from employees as e inner join departments as d
on e.dept_id = d.dept_id group by d.dept_name having avg(salary) between 50000 and 75000;


-- 14

-- Find department-wise total salary for employees earning more than 55000.
select d.dept_name,sum(salary) from employees as e inner join departments as d
on e.dept_id = d.dept_id where salary>55000 group by d.dept_name;

-- 15

-- Display locations having more than one employee.
select d.location ,count(*) as employee from employees as e inner join departments as d
on e.dept_id = d.dept_id group by d.location having employee>1;

-- 16
-- Find departments whose average salary is greater than ₹60,000.
SELECT d.dept_name,
       AVG(e.salary) AS avg_salary
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 60000;
-- 17 Find the department that has the maximum number of employees.
SELECT D.DEPT_NAME,COUNT(EMP_ID) AS TOTALEM FROM EMPLOYEES AS E INNER JOIN DEPARTMENTS AS D
ON E.DEPT_ID = D.DEPT_ID GROUP BY D.DEPT_NAME  ORDER BY TOTALEM DESC LIMIT 1;


-- 18

-- Find departments where at least two employees earn above 60000. 
select d.dept_name,count(*) as employee from employees as e inner join departments as d
on e.dept_id = d.dept_id where salary>60000 group by d.dept_name having employee>=2 ;

-- 19 Find the total salary expenditure of each department.
SELECT D.DEPT_NAME,SUM(SALARY) AS TOTAL FROM EMPLOYEES AS E INNER JOIN DEPARTMENTS AS D
ON E.DEPT_ID = D.DEPT_ID GROUP BY D.DEPT_NAME ;

-- 20 Find the highest salary in each department.
SELECT D.DEPT_NAME,MAX(SALARY) FROM EMPLOYEES AS E JOIN DEPARTMENTS AS D
ON D.DEPT_ID = E.DEPT_ID GROUP BY D.DEPT_NAME;

-- Find locations where total salary exceeds 120000.
select d.location,sum(salary) from employees as e inner join departments as d on e.dept_id = d.dept_id
group by d.location having sum(salary)>120000;

-- 21 Find departments having more than 1 employee.
SELECT D.DEPT_NAME,COUNT(*) FROM EMPLOYEES AS E INNER JOIN DEPARTMENTS AS D
ON D.DEPT_ID = E.DEPT_ID GROUP BY D.DEPT_NAME HAVING COUNT(*)>1;

-- 22 Find departments having both:(AVG ND COUNT)
SELECT d.dept_name,
       AVG(e.salary) AS avg_salary,
       COUNT(*) AS emp_count
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 60000
AND COUNT(*) > 1;
-- 23 Average salary above 60000 More than 1 employee
select d.dept_name,count(*) as employee,avg(salary) from employees as e inner join departments as d on e.dept_id = d.dept_id group by d.dept_name
having avg(salary)>60000 and count(*)>1;

-- 24 Find department-wise total salary but only for departments where the maximum salary exceeds 70000.
select d.dept_name,sum(salary),max(salary) as m from employees as e inner join departments as d
on e.dept_id = d.dept_id group by d.dept_name having m>70000;

-- 25  Display departments where the difference between maximum and minimum salary exceeds 30000.
select d.dept_name,max(salary)- min(salary)  as gap from employees as e inner join departments as d
on e.dept_id = d.dept_id group by d.dept_name having max(salary)- min(salary) >30000;


