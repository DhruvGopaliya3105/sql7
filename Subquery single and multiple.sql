
-- subquerry it is query which is present another query .it is also called as nested subquery
-- outer or inner two types are -- jo question phle aaye wo inner or jisse nikalega wo outer join(jispr depend h wo )
-- inner query will exeute first .
drop database shadidb;
create database shadidb;
use shadidb;
create table biodata(id int,name varchar(20),age int);
insert into biodata values (1,'Rahul',28) , (2,'anjali',28),
(3,'aishwariya',40),(4,'naina',23);
select * from biodata;

select  age  from  biodata where name='rahul';-- age og rahul
select * from biodata where age=29;
select * from biodata where age=(select age   from biodata where name='rahul');

select max(age) from biodata;
select * from biodata where age=40;
select * from  biodata where age=(select max(age) from biodata);
select * from  biodata where age=(select min(age) from biodata);
select  char_length(name)  from biodata  where name='rahul';
select name from  biodata where char_length(name)=5; -- in place of 5 we wrtie the whole query
select   name from biodata where char_length(name)=(select char_length(name) from  biodata where name='rahul');


-- single row  subquery  - it is  type of  subquery  in which  inner query returns only one row



use sakila ;
select * from film;
 -- find the movie name  where  rental rate  is  same  for the movie of  african egg
 select    rental_rate from film  where title = 'AFRICAN EGG';
 select rental_rate from film where title='african egg';
 select title,rental_rate from film where rental_rate=(select rental_rate from film where title='african egg');
 select  title ,rental_rate  from  film where rental_rate =2.99;
select  title ,rental_rate  from  film 
where rental_rate =( select    rental_rate from film  where title = 'AFRICAN EGG');

-- get the movie name and movie id where rental is equal to  min rental rate;
select min(rental_rate) from film;
select min(rental_rate) from film;
select title,film_id from film where rental_rate=(select min(rental_rate) from film);
select film_id,title,rental_rate from film where rental_rate=(select min(rental_rate) from film);
select  title , film_id,rental_rate  from film   where rental_rate=(select  min(rental_rate) from film  );
select * from film;
--  get  the movie id ,movie name and duration where duration  is greater tehan  avg duration  of the movies.
select avg(rental_duration) from film;
select film_id,title,rental_duration from film where rental_duration>(select avg(rental_duration) from film);
select  film_id  , title  ,rental_duration  from film where  rental_duration>(select avg(rental_duration) from film);
-- get  the movie id for  the movies where release yaer of movie should be  equal to the realsing year  of the alone trip and 
-- rating  should be same  as to  
-- of the apollo teen
select release_year from film where title = 'alone trip';
select rating from film where title = 'apollo teen';
select film_id,title from film where release_year = (select release_year from film where title='alone trip')
and rating = (select rating from  film where title= 'apollo teen');
select * from film;
select release_year from film where title='alone trip';
select rating from  film where title= 'apollo teen';
 select  film_id  from  film  where  release_year =(select  release_year  from  film where  title='ALONE TRIP')
 and rating= (select rating  from  film where title = 'APOLLO TEEN');
 
 -- in multy row  subquery (it will return multy row) we can not  perform mathmatical operation in this 
 
  use  shadidb;
  select * from biodata;
 select   age  from  biodata where  naame ='anjali' or name ='aishwariya';
 
 select  * from  biodata where   age in ( select   age  from  biodata where  name ='anjali' or name ='aishwariya');
  select  * from  biodata where   age in ( select   age  from  biodata where  name ='anjali' or name ='aishwariya') and  name != 'rahul';

   select  * from  biodata where   age  not in ( select   age  from  biodata where  name ='anjali' or name ='aishwariya') and  name != 'rahul';


-- Create Table
CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT



);
-- Insert Data
INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);
select * from employees;
select avg(salary) from employees;
select * from employees where salary>(select avg(salary) from employees);
select max(salary) from employees;
select * from employees where salary=(select max(salary) from employees);
select salary from employees where name ='alice';
-- if 2 name same
select salary from employees where emp_id=101;
select * from employees where salary>(select salary from employees where emp_id=101);
select * from employees;
select min(salary) from employees;
select department,name,salary from employees where salary=(select min(salary) from employees);
-- in multi row subquery returns more than one row but one column
-- examples
select salary from employees where name ='alice' or  name ='bob';
select * from employees where salary=50000 or salary =  80000;
select * from employees where department = 'hr' or department='it';
select * from employees
where department in (select  department from employees where department = 'hr' or department='it') ;
select * from employees
where department in (select department from employees where name ='alice' or  name ='bob') ;
select * from employees;
select salary from employees where emp_id=103 or emp_id=107;
select * from employees where salary not in (select salary from employees where emp_id=103 or emp_id=107);
select salary from employees where emp_id=103 or emp_id=107;
-- any operator  -- atleast ,min,max for comparison(koi  ek  bhi hoga to)
-- all for all   -- every value we want to consider(sbhi se )
-- in -- true if any value matches ()
-- find the employee detail who work in IT departmnet and have the salary greater than the salary of 
-- emp_id=101
select * from employees where department='it' and  salary>(select salary from employees where emp_id=101);
-- find the name of the person whose salary is greater than all the salaries of hr or it dept
select * from employees
where  salary>all(select salary from employees where department='hr ' or department='it'  );
-- find the employee and employee name of the user whose salary is greater than the salary of any employee
-- working under the manager id = 101
select  salary from employees where  manager_id=101;
select emp_id ,name,manager_id from employees where salary>any(select  salary from employees where  manager_id=101);
-- find the second highest salary from this table
select * from employees;
select max(salary) from employees;
select max(salary) from employees where salary<(select max(salary) from employees);






select * from employees;
select salary from employees where emp_id=101;
select * from employees where department='it' or salary>(select salary from employees where emp_id=101);


-- it meany it is greater than either one
select * from employees where salary >any(select salary from employees where emp_id=103 or emp_id=107);
select * from employees where salary <any(select salary from employees where emp_id=103 or emp_id=107);
select *  from employees where department='hr';
select * from employees where salary>any(select salary from employees where department='hr');
select * from employees where salary>all(select salary from employees where department='hr');
select *  from employees where department='it';
select * from employees where salary>any(select salary from employees where department='it');
select * from employees where salary>all(select salary from employees where department='it');

-- corelated subquery
select * from employees;
use shadidb;
select * from employees;
create table department (dept_id int,dept_name varchar(20),location varchar(20));
insert into department values(10,'hr','mumbai'),(20,'it','banglore'),(30,'finance','delhi');
select * from department;
-- find out name
select * from employees;
select * from department; 
select * from department where location in ('mumbai','banglore');
select * from employees where department = any(select dept_name from department where location in ('mumbai','banglore'));

select max(salary) from employees;
select * from employees where salary=(select max(salary) from employees);
-- corelated subquery
-- it is a type of subquery where inner query is executed for each value of the outer query
-- inner query also refer to the column of outer query
select * from employees;

select * from employees where department='it';
select avg(salary) from employees where department='it';
select * from employees where department='it' and salary>79000; -- this is fixed

-- corelated
select * from employees;
select * from department;
select  avg(salary) from employees where department = 'it';
select * from employees  as e where salary>(select avg(salary) from employees where department=e.department);

select * from employees;
-- those data who have the highest salaary as of their own department
select  max(salary) from employees where department = 'it';
select * from employees  as e where salary=(select max(salary) from employees where department=e.department);
use shadidb;
-- practice question
select * from employees as e  where salary= (select max(salary) from employees where department=e.department);
-- 3: Find departments where all employees earn above 70000
select * from employees as e  where salary= (select max(salary) from employees where department=e.department);
select  * from employees as e   where  70000< all ( select  salary from   employees where department=e.department );





-- windows function;
-- show = displays the output with aggregate fucntion o
-- we use over () with every aggregate column to get hthe output

select name,emp_id,avg(salary)   over() from employees;
select emp_id,name,salary,max(salary) over(),salary-avg(salary) over() from employees;
select emp_id,name,count(*) over(),max(salary) over(),min(salary) over() from employees;
select emp_id,name,salary,sum(salary) over(),
concat(round((salary/sum(salary) over())*100),'%') from employees;
-- rb trust fund ,liquid fund ,
select emp_id,name,salary,sum(salary) over(order by salary) from employees;
select emp_id,name,department,salary,sum(salary) over( order by department ) from employees;

