create database test;
go
create table student1
(
 ID INT Primary Key,
 FirstName varchar(30),
 );
 go
 Insert into student1(ID,FirstName)
 Values(1,'anjali')
 Insert into student1(ID,FirstName)
 Values(2,'xyz')
 select * from student1;
 
 -- update
 update student1
 set ID=10 
 where FirstName='xyz'
 
 Insert into student1(ID,FirstName)
 Values(100,'abc')
 select * from student1

 --delete
 delete from student1 where id=10

 -- add column
 alter table student1
 add phoneno INT
 
 update student1
 set phoneno=9058
 where id=100
 update student1
 set phoneno=9315
 where id=1
 select* from student1
 
 -- aggregate functions
 -- count
 select count(*) from student1

 --min & max
 select min(id) from student1
 select max(id) from student1

 -- sum & avg
 select sum(phoneno) from student1
