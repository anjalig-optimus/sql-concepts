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
 select * from student1;