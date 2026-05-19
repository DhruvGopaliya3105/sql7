-- row_number()-- it simply gives the serial number
-- rank()-- it gives the same rank ti duplicate valus and skip the next rank
-- dense_rank()-- it gives the same rank without skipping the next rank
-- for similar group-- use partition
-- it is compulsory to provie order by on rank and dence_rank

select *,dense_rank()  over(partition by department order by salary) from employees;
select *,dense_rank()  over(partition by department order by hire_year) from employees;
select * from employees;
-- where only used when that columnn is exist in the table otherwise not or it is first running thats why
-- that column will be put in bracket then assign into varaible ..
select * from employees as e
where salary=(select max(salary) from employees where dept=e.dept);
-- subquery treated as a table 
-- first bracket wli solve then end m where 
select * from 
(select * ,max(salary) over(partition by dept) as deptsalary from employees) as trh
where salary=deptsalary;
select * from
(select *,rank () over(partition by dept order by salary desc) as rnk from employees) as temp
where rnk=1;
-- order by salary desc means highest salary
-- you have the find out the second highest salary 
select * from
(select *,dense_rank () over( order by salary desc)  as drank from employees) as xyz
where drank=2; -- dense rank bcz if there is same data is avaible then dense rank consider it 2 otherwise 11 then 3
select * from employees where salary=(
select max(salary) from employees where salary<(select max(salary) from employees));
-- for second highest/lowest always use subquery
select * from employees where salary<(select max(salary) from employees);
select * from
(select *,dense_rank () over( order by salary)  as drank from employees) as xyz
where drank=4; 


 