-- constraints = constraints are the rules which are applied to the table column to prevent invalid data
-- in the table (applied on the specific column of the table) 
-- how to create a database

create database const_db;
use const_db;
select database();
-- ddl (data definition language) create
-- if not exist means it will not show u error 
create table if not exists test1( id int,age int );
-- dml (data manipulation language)
insert  into test1 values (101,32) ,(102,null);
select * from test1;


create database const_db;
use const_db;
select database();
-- ddl (data definition language) create
-- if not exist means it will not show u error 
create table if not exists test2( id int,age int not null);
-- dml (data manipulation language)
insert  into test2 values (101,32) ,(102,null); -- not null(empty u cant put) invalid data entry you can put zero not null
select * from test2;



create database const_db;
use const_db;
select database();
-- ddl (data definition language) create
-- if not exist means it will not show u error 
create table if not exists test3( id int unique,age int not null);
-- dml (data manipulation language)
insert  into test3 values (101,32) ,(101,32); -- duplicate  values not allowed for ids(it should be unique) you can put same value for age
-- also u put null valus to id bcz null means no data
select * from test3;


create database const_db;
use const_db;
select database();
-- ddl (data definition language) create
-- if not exist means it will not show u error 
create table if not exists test4( id int default 100,age int);
-- dml (data manipulation language)
insert  into test4(age) values(20); -- it takes direcly the default value bcz of explicitely we given the value
-- also u put null valus to id bcz null means no data
select * from test4;


create database const_db;
use const_db;
select database();
-- ddl (data definition language) create
-- if not exist means it will not show u error 
create table if not exists test4( id int default 100,age int);
-- dml (data manipulation language)
insert  into test4(age) values(20); -- it takes direcly the default value bcz of explicitely we given the value
-- also u put null valus to id bcz null means no data
select * from test4;


create database const_db;
use const_db;
select database();
-- ddl (data definition language) create
-- if not exist means it will not show u error 
create table if not exists test4( id int default 100,age int);
-- dml (data manipulation language)
insert  into test4(age) values(20); -- it takes direcly the default value bcz of explicitely we given the value
-- also u put null valus to id bcz null means no data
select * from test4;


create database const_db;
use const_db;
select database();
-- ddl (data definition language) create
-- if not exist means it will not show u error 
create table if not exists test4( id int default 100,age int);
-- dml (data manipulation language)
insert  into test4(age) values(20); -- it takes direcly the default value bcz of explicitely we given the value
-- also u put null valus to id bcz null means no data
select * from test4;


create database const_db;
use const_db;
select database();
-- ddl (data definition language) create
-- if not exist means it will not show u error 
create table if not exists test4( id int default 100,age int);
-- dml (data manipulation language)
insert  into test4(age) values(20); -- it takes direcly the default value bcz of explicitely we given the value
-- also u put null valus to id bcz null means no data
select * from test4;


create database const_db;
use const_db;
select database();
-- ddl (data definition language) create
-- if not exist means it will not show u error 
create table if not exists test4( id int default 100,age int);
-- dml (data manipulation language)
insert  into test4(age) values(20); -- it takes direcly the default value bcz of explicitely we given the value
-- also u put null valus to id bcz null means no data
select * from test4;
create database const_db;
use const_db;
select database();
-- ddl (data definition language) create
-- if not exist means it will not show u error 
create table if not exists test4( id int default 100,age int);
-- dml (data manipulation language)
insert  into test4(age) values(20); -- it takes direcly the default value bcz of explicitely we given the value
-- also u put null valus to id bcz null means no data
select * from test4;



create database const_db;
use const_db;
select database();
-- ddl (data definition language) create
-- if not exist means it will not show u error 
create table if not exists test5( id int primary key ,age int );
-- dml (data manipulation language)
insert  into test5  values (101,32);
insert into test5 values(null,27); -- we cannot put null values or duplicate(101,33)
select * from test5;


-- make a primary key using two column
-- id + age = both primary together single not bcz of same 
create table if not exists test6 (id int,age int ,salary int,primary key(id,age));
insert into test6 values(1,50,500000),(2,40,20000),(1,51,600000),(3,50,100);
select * from test6;
desc test6;


create table if not exists test7 (id int,age int check (age>18));
insert into test7 values(1,50);
insert into test7 values(1,10);
select * from test7; -- you can also put functins in this like betweeen ,and ...

create table if not exists test8 (id int,age int check (age between 18 and 22));
insert into test8 values(1,20);
insert into test8 values(1,10);
select * from test8; -- you can also put functins in this like betweeen ,and ...



-- parent table
create table s_class(cname varchar(20) primary key); -- 7a 8b 8c
insert into s_class values(10) ,(8),(9);
select * from s_class;
 -- child class
create table student (id int,name varchar(20),cname varchar(20),
foreign key (cname) references s_class (c_name));
insert into student values (1,'naina','10');
insert into student values (2,'abhi','12') -- will give u error
select * from student;

-- both are independent to each other if we want to make a relation btw then make a relation btw then
-- 






