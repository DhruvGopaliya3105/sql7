create database if not exists datatypedb;
use datatypedb;
-- numeric data types
create table test1(id tinyint);
insert into test1 values(-1),(10);
insert into test1 values (-129); -- out of range(1 byte = 8 bit == 2**8)( negaive 0 to -128  and positiveto 127)
-- in negative it goes upto 0 to -128 in positive upto 127
select * from test1;
-- small int -> 2 byte medium int -> 3 byte

-- use unsigned to remove the negative number it goes now upto 255 all positive 
create table test2 (age tinyint unsigned);
insert into test2 values(255);  -- it is valid 0 to 255 it is in range
select * from test2;

-- use decimal
create table test3 (salary float,salary2 double);-- double take all decimal values and float only upto 2 or 3 digits
insert into test3 values(1989.9301934,1989.9301934);   
select * from test3;

create table test4(price double (6,2)); -- total is 6 out of 2 are decimal values 4 rem. are before decimal valus upto 
insert into test4 values(0.7326723); -- only 2 decimal values
insert into test4 values(44.7326723);
insert into test4 values(334.7326723);
insert into test4 values(4453.7326723); -- upto 4 allowed only before decimal
insert into test4 values(23225.7326723); -- 5 values are not allowed before decimal (4 we can access) out of range
select * from test4;

-- string data type
-- char use for fixed character overall we know about it  already define 
create table test6(countrycode char(3));
insert into test6 values('ind');
insert into test6 values('india'); -- error
insert into test5 values ('he       '); -- char not consider ending space  only starting space it take
select *,char_length(countrycode) from test

-- varchar -- 
create table test6(countrycode varchar(3));
insert into test6 values('ind');
insert into test5 values('india');
insert into test5 values ('he       '); -- char not consider ending space  only starting space it take
select *,char_length(countrycode) from test5


