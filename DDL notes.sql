-- ddl for change in structure or change in data is dml
use datatypedb;
create table test10(id int,name varchar(20));
insert into test10 values (1,'amit'),(2,'shimi'),(3,'yash');
select * from test10;
-- ddl drop statement (drop will delete the  rows  and table structure both )
-- ddl statement (truncate delete the data or  table then recreate the table structure)
drop table test10;
select * from test10;
truncate test10; -- not table direct tablename
select * from test10;

-- alter 
drop table test10;
drop table test10;
create table test10(id int,name varchar(20));
insert into test10 values (1,'amit'),(2,'shimi'),(3,'yash');
select * from test10;
alter table test10 add column (salary int);
select * from test10;
alter table test10 add column (age int default 18);
select * from test10;
alter table test10  drop  column salary;
select * from test10;
alter table test10 rename column salary to newsalary; -- rename 
select * from test10;
alter table test10 add constraint primary key(id);
desc test10; -- desc is used for to get the information of the table     

-- add a column before a name column 
-- change the data type of name column to integer data type
-- add a not null constraint to name and age column
-- add a foreign key of a column name as departmentid references to department column
select database(); -- if u want to make or create table then use this sakila.then name 
select actor_id,first_name from sakila.actor;

-- i want all these  two  table to another table
-- CTAS  = create table as select 
-- insert update delete also knows  DML
create table tushar985 as
select actor_id,first_name from sakila.actor;
select * from tushar985; 
insert into tushar985 values(19999,'japan');
-- for safe update then it is able to correct 
SET SQL_SAFE_UPDATES = 0;
update tushar985 set first_name='RAJ' WHERE ACTOR_ID=2 OR  ACTOR_ID=3; -- update all rows ESLIYE PUT DELETE
DELETE FROM TUSHAR985 WHERE FIRST_NAME = 'RAJ'; -- deleted rows
SELECT * FROM TUSHAR985;
SELECT * FROM TUSHAR985;

-- what is ddl and dml 
-- difference btw truncate, delete, and drop
-- what is normalisation 
-- difference char and varhcar data types





