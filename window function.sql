-- windows function-- it  performs the calculations on multipule rows and gives you the output with each row 
-- windows function;
-- over () = it displays the output with aggregate function when aggregate function perform
-- we use over () with every aggregate column to get the output
use shadidb;
show tables;
select name,emp_id ,avg(salary)   over() from employees;
select name,emp_id,department ,avg(salary) over() from employees;
select * from employees;
select emp_id,name,salary,max(salary) over(),salary-avg(salary) over() from employees;
select emp_id,name,salary,avg(salary) over(),salary-avg(salary) over() from employees;
select emp_id,name,count(*) over(),max(salary) over(),min(salary) over() from employees;
select emp_id,name,count(*) over(),max(salary) over() from employees;
select emp_id,name,salary,sum(salary) over(),concat(round((salary/sum(salary) over())*100),'%') from employees;
select emp_id,name,salary,sum(salary) over(),
concat(round((salary/sum(salary) over())*100),'%') from employees; 
select emp_id,name,salary,sum(salary) over(order by salary) from employees;
select emp_id,name,department,salary,sum(salary) over( order by department ) from employees;
select *,max(salary) over() from employees;
select salary,sum(salary) over(order by salary) from employees; -- over by (define according to whom to want to access)alter

-- partition by 
-- it is a clause to join similar values or grouped  together
select *,sum(salary) over() from employees; -- total salary shows
select *,sum(salary) over(partition by department),sum(salary) over() from employees;
select *,sum(salary) over(partition by department order by salary),sum(salary) over() from employees;
select *,sum(salary) over(partition by name) from employees;
select *,sum(salary) over(partition by manager_id) from employees;
select *,sum(salary) over(partition by department order by salary) from employees;
select *,sum(salary) over(partition by emp_id) from employees;
-- order by used to get the cummulative sum
select *,sum(salary) over(partition by department order by salary) from employees;
select name,salary,sum(salary) over(partition by department)
,(salary/sum(salary) over(partition by department))*100 from employees;
-- for same department then use partition by for particular or individual otherwise
-- it will take all
select name,department,salary,sum(salary) over(partition by department)
,(salary/sum(salary) over(partition by department))*100 from employees;
-- in this we havenot used partition thats why it consider total salary for all


-- Windows 
drop database windowsdb;
create database windowsdb;
use windowsdb;


-- ============================================
--  Create the employees table
-- ============================================
CREATE TABLE employees (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);
 
-- ============================================
--  Insert sample data (12 employees)
-- ============================================
INSERT INTO employees VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      65000, 2022),
  (7,  'Grace',   'Sales',   55000, 2021),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   58000, 2019),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);



select * from employees;
select * ,sum(salary) over(partition by hire_year) from employees;
select * ,sum(salary) over(partition by hire_year order by salary) from employees;
-- for individual use order by 
select * ,sum(salary) over(partition by hire_year) from employees;
select *,max(salary) over(partition by dept ) from employees;
select *,max(salary) over(partition by dept order by hire_year ) from employees;
-- order by means in 2021 it take the max(salary) from last two in 2021 and 2021
-- otherwise it take 2019,2020,2021 comparision
select *,sum(salary) over(partition by dept ) from employees; 
-- we can also partition by in more than one column
select * ,avg(salary) over(partition by dept),
case
when salary>avg(salary) over(partition by dept) then 'above avg salary'
else 'less than avg salary'
end as new
 from employees;
 
-- windows function
-- row_number() - it generate a unique number provide krna
select *,row_number() over() from employees; 
select *,row_number() over(order by emp_id) from employees; -- same output primary key
select *,row_number() over(partition by dept) from employees;-- it gives individual 1 2 3 then 1 2 3 upto then in each department
select *,row_number() over(order by salary) from employees; -- salary from low to high
select *,row_number() over(order by  DEPT) from employees;
Select *,rank() over() from employees;
-- rank() consider all 1 
Select *,rank() over(partition by dept) from employees;
select *,(salary),sum(salary) over() ,rank() over(order by salary ) from employees;
select *,rank() over(partition by dept order by salary desc) from employees;
-- if we have two salary same then rank give same then skip above but row_number
-- doesnot affect  it gives unique number.
-- difference btw windows function and group by
-- difference btw row_number,rank,dence_rank
-- difference btw where and having clause
-- types of joins in sql
-- natural join and cross join
-- what is superkey,uniquekey,primary key,foreign-key

-- doesnot affect  it gives unique number.
-- difference btw windows function and group by
-- difference btw row_number,rank,dence_rank
-- difference btw where and having clause
-- types of joins in sql
-- natural join and cross join
-- what is superkey,uniquekey,primary key,foreign-key

