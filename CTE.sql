-- CTE -- common table expression 
-- storing a result on a temporary so that our code will be readable so that we can access it many times
-- after the semicolon  u cannot access it 
-- syntax
-- with anyname as this thing

with test as 
(select actor_id,count(film_id) as moviescount from sakila.film_actor group by actor_id)
-- with cte we will not use semicolon

select sum(moviescount) from test where actor_id>10;
-- at end we use semicolon


use  windowsdb;
select * from employees;
-- this is the chronological order of sql 
-- first--  from,where,group by ,having,select,order by ,limit 
select * from (
select *,max(salary) over(partition by dept) as deptmax from employees) as temp where salary=deptmax;
-- below it with cte
with cte as 
(select *,max(salary) over(partition by dept) as deptmax from employees)
select * from cte where salary=deptmax;
with xyz as( 
select dept,max(salary)  as deptmax from employees group by dept)
select * from xyz;
select * from employees join xyz where employees.dept = xyz.dept and employees.salary = xyz.deptmax;


