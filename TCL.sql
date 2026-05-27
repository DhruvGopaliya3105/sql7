-- transaction are the set of sql statements which works as a unit
-- tcl is  a transaction control language .this tcl ensure my data is correct and accurate by following the 4 
-- properties
# 1 . atomicity - whether it is complete or we will not do it complete (all or nothing)
# 2 . consistency - the database moves from one step to another one by one .one by one work is done(one step to another execution)
# 3 . isolation - transaction separate (only show for u not for everyone) first comes isolation
-- nobody can see that changes until it is committed
# 4 . durability - saved permanently (once committed chnages are permanent even if the server crashes)

create database rajdb;
use rajdb;
create table raj45(id int);
insert into raj45 values(10);
select * from raj45; -- this data is permanent or durability bcz of permanently


-- if u are in a doubt then tcl use insert,update,delete ko manage
start transaction; -- i only manage that not my sql
insert into raj45 values (100),(99);
select * from raj45; -- this are isolated 
-- if i want to see this all transaction esliye we want durability then use commit and see anywhere
commit; -- this makes data saved and see anywhere
-- transaction start where --> 
-- start transaction -- then it is in our hands it is not permanent saved by automatically
-- keyword start transaction
-- when will the transaction end when u use then it is automatically saved 
-- we use commit or rollback or ddl statement execute


start transaction;
SET SQL_SAFE_UPDATES = 0;
update raj45 set id  = 500;
select * from raj45;
rollback; -- cancel button not saved
-- all the transaction are revert to the previous state no changes are done if use commit then saved you can see
-- without using start transaction it is not ur hands it is in hands of sql
select * from raj45;
delete from raj45;
select * from raj45;

-- autocommit by default value is 1; put zero for set
start transaction;
insert into raj45 values(10),(11),(56),(68);
delete from raj45 where id = 10;
select * from raj45;
commit;
rollback;

start transaction;
insert into raj45 values(768),(500),(400);
select * from raj45;
update raj45 set id = 1000;
select * from raj45;
rollback; -- it goes to starting beginning
select * from raj45;
-- if u want a specific then  
savepoint raj45_savepoint_ins;
update raj45 set id = 1000; 
rollback to raj45_savepoint_ins;-- for specific then use savepoint
rollback;
select * from raj45;

-- drop or truncate are ddl statement  cannot be rollback
-- delete is a dml statemnt  it can be rollback its speed is slow it delete row one by one
