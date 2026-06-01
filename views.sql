-- Views are virtual tables which is used to store the query not original data  we can reuse it many time like a function 
-- it does not store any data bcx if u want to repeat the logic then u can store that in views we cannot share it 
-- views are used to give to access to specific rows and column
-- it is used to make complex query easier 
-- in views we can write multiple aggregations into a view
-- it is used to make query reusable accros many users u dont write need to write eveytime


create database if not exists viewdb;
use viewdb;


CREATE TABLE departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id   INT PRIMARY KEY,
    name     VARCHAR(50),
    dept_id  INT,
    salary   DECIMAL(10,2),
    city     VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES
(1,'HR'), (2,'IT'), (3,'Finance');

INSERT INTO employees VALUES
(101,'Aman',    2, 70000, 'Jaipur'),
(102,'Priya',   1, 45000, 'Delhi'),
(103,'Rahul',   2, 90000, 'Mumbai'),
(104,'Sneha',   3, 55000, 'Jaipur'),
(105,'Vikram',  2, 30000, 'Pune');
select * from employees;
select * from departments;
select * from departments where dept_id<3;
-- views use
-- create view viewname
select * from departments;
create view dept_view as select * from departments where dept_id<3;
select * from dept_view;
select * from employees;
-- use view
select city,sum(salary) from employees group by city;
create view citysum as select city,sum(salary) from employees group by city;
select * from citysum;
select emp_id,name from employees;
create view emp_2 as select emp_id,name from employees;
select * from emp_2; -- it cannot access which is not include in the view while putting
-- it restrict the no. of rows and column
insert into emp_2 values(107,'yash');
select * from emp_2; -- it also changes in the view or original table also  but not always
select * from employees;
-- delete
delete from emp_2 where emp_id = 101;
select * from emp_2; -- delete from both view or original table
select * from employees;
-- update
update emp_2 set name = 'amanna' where emp_id = 102;
select * from employees;
select * from emp_2;

-- a view generally becomes non_updatable (read only) if its definition contains any of the following,
-- like group by or having clauses,distinct, set operations - union,insersect,except/minus
-- joins,(in many dbms you can update only one side.some disallow it entirely )
-- subquery in the select list
-- window function(row_number),(rank),etc;
create or replace view emp_view as 
select e.emp_id,e.name,d.dept_name from employees as e
join departments as d where e.dept_id = d.dept_name;
select * from employees;
select * from emp_view;
update emp_2 set emp_id = 100,name = 'happy',dept_name = 'jga';
select * from emp_2;
SELECT e.emp_id,e.name,dept_name from employees as e
INNER JOIN departments as  d
ON e.dept_id = d.dept_id;
select * from employees;
select  * from departments;


