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

