
create table t_product_masterss
(
product_id varchar(50) primary key,
product_name varchar(50),
cost_per_item int
);

create table t_user_masterss
(
user_id varchar(50) primary key,
user_name varchar(50)
);

create table t_transactionss
(
user_id varchar(50) foreign key references t_user_masterss ,
product_id varchar(50) foreign key references t_product_masterss,
transaction_date date,
transaction_type varchar(50),
transaction_amount int
);


insert into t_product_masterss values ('P1','Pen',10),('P2','Scale',15),('P3','Note Book',25)

insert into t_user_masterss values ('U1','Alfred Lawrence'),('U2','William Paul'),('U3','Edward Fillip')

insert into t_transactionss values
('U1','P1','2010-10-25','Order',150),
('U1','P1','2010-11-20','Payment',750),
('U1','P1','2010-11-20','Order',200),
('U1','P3','2010-11-25','Order',50),
('U3','P2','2010-11-26','Order',100),
('U2','P1','2010-12-15','Order',75),
('U3','P2','2011-01-15','Payment',250)

select * from t_product_masterss
select * from t_transactionss
select * from t_user_masterss

--write query for user_name,product_name ,ordered_quantity,amount_paid,last_transaction_date,
--balance where orders are in quantity and payment in rupees
select u.user_name , p.product_name,
sum(case when t.transaction_type='Order' then
     t.transaction_amount else 0 end) as ordered_quantity,	  
sum(case when t.transaction_type='Payment'then 
t.transaction_amount else 0 end )as amount_paid ,
max(t.transaction_date) as last_transaction_date,
((sum(case when t.transaction_type='Order' then
     t.transaction_amount*p.cost_per_item else 0 end))-sum(case when t.transaction_type='Payment'then 
t.transaction_amount else 0 end )) as balance 
from t_product_masterss as p join t_transactionss as t on p.product_id=t.product_id
join t_user_masterss as u on u.user_id =t.user_id group by u.user_name,p.product_name


--2nd


create table employee
( emp_id int primary key,
emp_name varchar(50),
department varchar(50),
hire_date date
);

create table dept
(
dept_id int primary key,
dept_name varchar(50)
);

create table sales
(
sale_id int primary key,
emp_id int foreign key references employee,
sale_date date,
amount decimal
);

create table perf_review
(
review_id int primary key,
emp_id int foreign key references employee,
review_date date,
score int
);

insert into dept values (1,'kalpana'),
(2,'bhabha'),
(3,'raman')

insert into employee values (101,'Anjali','bhabha','2024-10-03'),
(102,'kishan','kalpana','2024-10-05'),
(103,'vaibhav','bhabha','2024-10-10'),
(104,'harsh','raman','2024-10-09')

insert into sales values (10,101,'2025-10-07',5000.0),
(11,102,'2025-11-07',1500.0),
(12,103,'2025-11-07',800.0),
(13,101,'2025-11-05',500.0)

insert into perf_review values (1001,101,'2024-11-03',5),
(1002,102,'2024-12-05',3),
(1003,103,'2024-12-03',2),
(1004,104,'2024-12-03',4)

insert into perf_review values (1005,101,'2024-11-03',4),
(1006,102,'2024-12-05',2),
(1007,103,'2024-12-03',4),
(1008,104,'2024-12-03',1)

select * from employee
select * from dept
select * from sales
select * from perf_review

--calculate total sales for each employee and rank in desc order

select s.emp_id,sum(s.amount) as total_sales from sales as s
group by s.emp_id
order by total_sales desc

--by using rank
select emp_id,sum(amount) as total_sales ,rank() over(order by sum(amount) desc)
as rank from sales 
group by emp_id

--calculate avg score for each employee

select emp_id ,avg(score) as avg_score from perf_review
group by emp_id
order by avg_score desc

--calculate top selling employee in each department based on total sales