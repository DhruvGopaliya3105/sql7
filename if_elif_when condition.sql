use sakila;
select * from employee;
# if(condition,true statement,false statement)
select first_name,department,salary,if(department='it',true,false) from employee;
select first_name,department,salary,if(department='it',salary*1.1,salary*1.05) from employee;
select first_name,department,salary,if(department='it',salary*1.1,false) from employee;
select first_name,department,salary,
if(department='it',salary*1.1,if(department='hr',salary*1.05,salary)) from employee;
-- it is more effecive using case and end 
select first_name,department,salary,
case 
when department='it' then true
else 'non it'
end
from employee;
select first_name,department,salary,
case 
when department='it'  or department='hr' then 'a category' 
else 'b category'
end
from employee;
select first_name,department,salary,
case 
when department='it'  then salary*1.1 
when  department='hr' then salary*1.05
else salary -- same salary written
end as 'new salary' -- what u want accodingly
from employee;
 -- if the hiring date of an employee is before 2020 then print its job_title+senior
 -- if year 2021 then associate print on that 
 -- then otherwise same name
 select * from employee;
 select first_name,year(hire_date),job_title,
 case
 when year(hire_date)<2020 then  concat('senior',job_title)
 when  year(hire_date)=2021 then  concat('associate',job_title)
 else job_title
 end as new
 from employee;
 -- if the salary is greater than 70000 avg salary
 -- if the salary>85000 then high salary
 -- if the salary>1 lakh then extreme high salary
 -- otherwise category name as low salart
 select first_name,salary,
 case
 when salary>75000 and salary<85000 then 'avg salary'
 when salary>85000 and salary<100000 then 'high salary'
 when salary>100000 then 'extreme high salary'
 else  'low salary'
 end as last
 from employee;
 -- select the job_title and print the column value based on the following condition
-- if same job_title then print enginerr has 1 person accordingly
select job_title ,count(job_title),
case
when count(job_title)=1 then concat(job_title,'position have',count(job_title),'person')
when count(job_title)>1 then concat(job_title,'position have',count(job_title),'persons')
end as new
from employee group by job_title;


