CREATE DATABASE sql_practice;
USE sql_practice;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    manager_id INT
);
INSERT INTO employees VALUES
(101,'Alice Johnson','IT',72000,NULL),
(102,'Bob Smith','IT',65000,101),
(103,'Carol White','HR',58000,NULL),
(104,'David Brown','HR',54000,103),
(105,'Eva Green','Finance',80000,NULL),
(106,'Frank Black','Finance',75000,105),
(107,'Grace Lee','IT',68000,101),
(108,'Henry Wilson','Marketing',60000,NULL),
(109,'Ivy Turner','Marketing',56000,108),
(110,'Jack Davis','Finance',70000,105),
(111,'Karen Moore','IT',63000,101),
(112,'Leo Harris','HR',50000,103),
(113,'Mia Clark','Marketing',62000,108),
(114,'Nate Lewis','Finance',78000,105),
(115,'Olivia Walker','IT',71000,101),
(116,'Paul Hall','HR',53000,103),
(117,'Quinn Young','Marketing',59000,108),
(118,'Rachel King','Finance',82000,105),
(119,'Sam Scott','IT',66000,101),
(120,'Tina Adams','HR',55000,103);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50),
    join_year INT
);
INSERT INTO customers VALUES
(201,'Aarav Mehta','Mumbai','India',2021),
(202,'Priya Sharma','Delhi','India',2020),
(203,'Rohan Gupta','Pune','India',2022),
(204,'Sunita Patel','Ahmedabad','India',2021),
(205,'Vikram Rao','Bangalore','India',2019),
(206,'Neha Singh','Chennai','India',2023),
(207,'Arjun Kumar','Hyderabad','India',2020),
(208,'Deepa Nair','Kochi','India',2022),
(209,'Sanjay Joshi','Jaipur','India',2021),
(210,'Meera Iyer','Coimbatore','India',2023),
(211,'Ravi Verma','Lucknow','India',2020),
(212,'Anita Das','Kolkata','India',2019),
(213,'Kiran Reddy','Vizag','India',2022),
(214,'Pooja Shah','Surat','India',2021),
(215,'Amit Bose','Nagpur','India',2023),
(216,'Tara Menon','Trivandrum','India',2020),
(217,'Nikhil Kulkarni','Nashik','India',2022),
(218,'Swati Chatterjee','Bhopal','India',2019),
(219,'Rahul Pandey','Patna','India',2021),
(220,'Divya Tiwari','Indore','India',2023);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price INT,
    stock_qty INT
);
INSERT INTO products VALUES
(301,'Laptop','Electronics',55000,30),
(302,'Smartphone','Electronics',22000,80),
(303,'Headphones','Electronics',3500,120),
(304,'Monitor','Electronics',18000,45),
(305,'Keyboard','Accessories',1500,200),
(306,'Mouse','Accessories',900,250),
(307,'Desk Chair','Furniture',8500,40),
(308,'Standing Desk','Furniture',22000,15),
(309,'Webcam','Electronics',4200,70),
(310,'USB Hub','Accessories',1200,180),
(311,'Notebook','Stationery',150,500),
(312,'Pen Set','Stationery',250,600),
(313,'Printer','Electronics',12000,25),
(314,'Scanner','Electronics',9000,20),
(315,'External SSD','Electronics',7500,60),
(316,'Lamp','Furniture',2200,90),
(317,'Whiteboard','Office Supplies',3800,35),
(318,'Cable Organiser','Accessories',600,300),
(319,'Power Bank','Electronics',2800,100),
(320,'Smart Watch','Electronics',15000,55);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    amount INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO orders VALUES
(1001,201,301,1500,'2024-01-05'),
(1002,202,302,2300,'2024-01-12'),
(1003,203,303,800,'2024-02-03'),
(1004,201,304,3200,'2024-02-14'),
(1005,204,301,1100,'2024-03-01'),
(1006,205,302,4500,'2024-03-15'),
(1007,202,303,950,'2024-03-22'),
(1008,206,304,2100,'2024-04-05'),
(1009,203,301,1750,'2024-04-18'),
(1010,207,302,3300,'2024-04-30'),
(1011,204,303,680,'2024-05-10'),
(1012,208,304,2900,'2024-05-22'),
(1013,205,301,1200,'2024-06-08'),
(1014,201,302,2700,'2024-06-15'),
(1015,209,303,500,'2024-06-28'),
(1016,206,304,3800,'2024-07-07'),
(1017,207,301,1600,'2024-07-19'),
(1018,210,302,4100,'2024-07-25'),
(1019,208,303,720,'2024-08-02'),
(1020,209,304,2200,'2024-08-14');
select * from orders;
select * from customers;
select * from employees;
-- section a
-- Q1. List each department along with the number of employees in it.
select department,count(emp_id) from employees group by department order by department;
-- Q2. Find departments where the average salary is greater than 60,000.
select department,avg(salary) from employees group by department having avg(salary)>60000 order by department;
-- Q3. Show the total salary paid per department, ordered by total salary descending.
select department,sum(salary) as total_salary from employees group by department order by total_salary desc;
-- Q4. Find departments that have more than 4 employees AND an average salary above 55,000.
select department,count(*) as employee ,avg(salary) from employees group by department
having employee > 4 and avg(salary)>55000 order by department;
-- Q5. Using the orders table, find customer_ids who have placed more than 2 orders and whose total order
-- amount exceeds 5,000.
select customer_id,count(*) ,sum(amount) as totalamount from orders group by customer_id having count(*)>2
or  totalamount>5000 order by customer_id;

-- section b
-- Q1. Show each customer's name along with the total number of orders they have placed.
select c.customer_name,count(o.order_id) as total_order from customers as c inner join orders as o on
c.customer_id=o.customer_id group by c.customer_name;
-- Q2. List each product name with the total revenue generated from orders.
select * from orders;
select * from products;
select p.product_name,sum(o.amount) as totalrevenue from products as p inner join orders as o on
p.product_id = o.product_id group by p.product_name;
-- Q3. Show each product category with the total quantity in stock.
select category,sum(stock_qty) as totalqty from products group by category order by category;
-- Q4. Find customers who have spent more than 3,000 in total, showing their name, city and total spend.
select c.customer_name,sum(o.amount) as totalamount,c.city from customers as c inner join orders as o on
c.customer_id = o.customer_id group by c.customer_name,c.city;
-- Q5. For each product category, find the average order amount and the number of distinct customers who
-- ordered products in that category.
select distinct o.customer_id ,p.category as product_category,avg(o.amount) from orders as o inner join
products as p on o.product_id = p.product_id group by o.customer_id, p.category;
select * from products;
select * from customers;
select * from employees;

-- Q1. List every employee along with their manager's name. Employees with no manager should still appear
-- (show NULL or 'No Manager').
-- employee apne manager_id leke dekhenege manager ki emp_id ko self join this is self table se join
select e.emp_name,m.emp_name from employees as e left join employees as m on e.manager_id = m.emp_id;
-- Q2. Show only those employees whose salary is higher than their manager's salary. 
-- left join nhi kyuki null show ho jayegi 
select * from employees;
select e.emp_name,e.salary,m.emp_name,m.salary from employees as e inner join employees as m
on e.manager_id = m.emp_id where e.salary>m.salary;

-- Q3. List all employees who are managed by 'Alice Johnson', showing the employee name and their department
SELECT e.emp_name,
       e.department
FROM employees as  e
INNER JOIN employees  as m
ON e.manager_id = m.emp_id -- same for all manager ka name we want to know esliye manager id 
WHERE m.emp_name = 'Alice Johnson'; -- manager name direct

-- Q4. For each manager, show their name, department, and the average salary of their direct reports. Only
-- include managers who have at least 3 direct reports.
select m.emp_name,e.department,avg(e.salary),count(*) as teamsize  from employees as e inner join employees as m
on e.manager_id = m.emp_id group by m.emp_name,e.department having teamsize>=3;

-- Q5. Find pairs of employees who work in the same department and earn within 5,000 of each other (show
-- each pair only once, no self-pairs).


-- Q1. Find all employees who earn more than the average salary of all employees.
select avg(salary) from employees;
select avg(salary) from employees;
select emp_name,department,salary from employees where salary>(select avg(salary) from employees);
-- Q2. Show the details of the employee who earns the highest salary in the company.
select max(salary) from employees;
select * from employees where salary=(select max(salary) from employees);
-- Q3. List all products whose price is greater than the average price of all products in the 'Electronics'
-- category.
select * from products where price>(select avg(price) from products where category = 'electronics');

-- Q4. Find all employees in the same department as the employee with the highest salary. Exclude that
-- top-earner from the results.
-- Q5. List orders where the order amount is greater than the average order amount, displaying the order_id,
-- customer_id, and amount.
select * from orders;
select avg(amount) from orders;
select * from orders where amount>(select avg(amount) from orders);

-- Q1. Find all employees who work in departments that have at least one employee earning more than
-- 75,000.
select * from orders;
select * from customers;
select * from employees;
SELECT *
FROM employees
WHERE department IN
(
    SELECT DISTINCT department
    FROM employees
    WHERE salary > 75000
);

-- Q2. List products whose price is less than ALL prices in the 'Furniture' category.

select * from products where price < all (select price from products where category= 'furniture');

-- Q3. Find customers who have placed at least one order. Use the IN operator with a subquery.
select * from employees;
select * from products;
select * from customers;
SELECT customer_name,customer_id,city
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
);

-- Q4. Find all employees whose salary is greater than ANY employee in the HR department.

select emp_name,salary,department from employees where salary> any (select salary from employees where department = 'hr');
