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

create database teacher;
go
drop database teacher

create table prof
(
 teacherid INT Primary key,
 email varchar(50),
 teachername varchar(50)
 );
 select * from prof
 Insert into prof values(1,'anjali@gmail.com','anjali'),(2,'naveen@gmail.com','naveen'),(3,'kishan@gmail.com','kishan')
 
 -- wildcard
 select * from prof
 where teachername like 'a%';

 alter table prof
 add age INT
 update prof
 set age=21
 where teacherid=1
 update prof
 set age=20
 where teacherid=2
 update prof
 set age=22
 where teacherid=3

 --operators
 select teachername from prof where age in(22,23)
 select teachername from prof where age between 22 and 25

 --aliases
 select teachername as intern from prof
 select * from prof as optimus
 select teacherid as id from prof

 --joins
 select student1.FirstName ,prof.teachername from student1 
 inner join prof on prof.teacherid =student1.id 

 select * from prof
 left join student1
 on student1.id=prof.teacherid

 select * from prof
 right join student1
 on student1.id=prof.teacherid

  select * from prof
 full outer join student1
 on student1.id=prof.teacherid

 --union
 select id from student1
 union
 select teacherid from prof

 Insert into prof values (4,'deepak@gmail.com','deepak',22)

 --groupby
select count(age) as ageCount, teachername from prof
group by teachername

SELECT count(age) as Counting,age FROM prof group by age;

--having
select count(age) from prof group by age having age<22

--all
select all age
from prof where age>20

Insert into prof values (5,'harsh@google.com','harsh',null)

--cases
select teachername ,teacherid,age from prof
order by (
case
   when age is null then teacherid
   else age
end);

select teachername ,teacherid,age from prof
order by age desc;

 --views
 create table employee2
 (
 id int primary key,
 first_name varchar(50),
 last_name varchar(50),
 salary int,
 joining_date date
 );

 create view hire_employee
 as
 select e.id,e.first_name,e.last_name
 from employee2 as e

 insert into employee2 values (1,'Anjali','Gupta',5000,'2024-10-03'),(2,'Deepak','Gupta',500,'2024-10-04'),(3,'Kishan','Payadi',900,'2024-10-03')
 select * from hire_employee

 create table block
 (
 block_id int Primary key,
 block_name varchar(50),
 salary int 
 );

 insert into block values (101,'kalpana',5000),(102,'bhabha',800),(103,'aryabhatt',900)

 create view employee_block as
 select e.id,e.first_name from employee2 as e join block as b on e.salary=b.salary
 where id>0

  create view employee_block2 as
 select e.id,e.first_name, b.block_name from employee2 as e join block as b on e.salary=b.salary
 where id>0

 select * from employee_block2

 insert into employee_block values (5,'vaibhav') 
  insert into employee_block values(6,'naveen')

  -- we can't insert new rows in the view which is created by the join of two tables
insert into employee_block2 values(7,'naveen', 'Kalpana')

--cte
--help to inc readiness and more efficient
-- to make queries less complex
--mostly used in replace of sql

--cte query
WITH AverageSalary AS (
    SELECT AVG(Salary) AS AvgSalary
    FROM employee2
)
SELECT e.first_name, e.Salary, a.AvgSalary
FROM employee2 e, AverageSalary a
WHERE e.Salary > a.AvgSalary;

--stored procedure
--reduce network traffic
--db becomes more secure
--can be used over and over again
--stored in cache

create procedure sp
as
begin
select * from employee2 where id=1
end

create procedure sp2
as
begin
select * from employee2 where id=1
select * from employee2 where first_name='kishan'
end

--calling a procedure just by writing its name or execute name
exec sp
sp2

--drop proc
drop proc sp2

--alter proc with parameters
alter proc sp
@emp2_name varchar(50)
as
begin
select * from employee2 where first_name=@emp2_name;
end

sp 'kishan'

--TRIGGERS
--ENFORCE DATA INTEGRITY
--effective when dml commands take place
--AFTER/FOR TRIGGERS OCCUR AFTER THE DML COMMANDS
--INSTEAD TRIGGER USED FOR OVERRIDING

SELECT CAST(25.4 AS INT)