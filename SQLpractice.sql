create database hr;
create table department
 (
 dept_id int Primary key,
 dept_name varchar(50),);
create table employee
(
 emp_id INT PRIMARY KEY,
 first_name varchar(50),
 last_name varchar(50),
 job_title varchar (50),
 salary int,
 present_status varchar(50),
 dep_id int foreign key references department(dept_id),
 emp_type varchar(50),
 hourly_rate decimal(10,2),
 starting_date date
 
 );

 create table performance(
 emp_id int foreign key references employee(emp_id),
 eval_id int Primary key,
 performance_rating  varchar(50),
 eval_rating int,
 );

 create table payroll(
 pay_id int primary key,
 emp_id int foreign key references employee(emp_id),
 bonus int );

 insert into employee values (1,'Anjali','Gupta','Manager',1000,'Active',101,'Salaried',Null,'2024-10-01'),
(2,'Kishan','Payadi','Tester',1000,'Active',102,'Salaried',Null,'2024-10-02'),
 (3,'Harsh','dogra','Technical Lead',800,'Active',103,'Salaried',Null,'2024-10-03'),
 (4,'Vaibhav','uniyal','HR',500,'Active',102,'Salaried',Null,'2024-10-04'),
 (5,'Deepak','gupta','HR',null,'Active',103,'Hourly',40,'2024-10-05'),
 (6,'Naveen','singh','Tester',null,'Active',101,'Hourly',60,'2024-10-06')
 

 insert into performance values(1,1,'Excellent',5),
 (2,2,'Need improvement',2),
 (3,3,'Average',3),
 (4,4,'Need improvement',2),
 (5,5,'Good',4),
 (6,6,'Good',4)
 
 
 insert into department values
 (101,'Engineer'),
 (102,'Sales'),
 (103,'Marketing')
 

 insert into payroll values(101,1,5000),
 (102,2,2000),
 (103,3,800),
 (104,4,900),
 (105,5,1500),
 (106,6,4500)

 --Query
 --a) List the names of all employees who work in the "Sales" department.
 select * from employee as e
 join department as d on e.dep_id=d.dept_id
 where dept_name='Sales';

 --* b) Find the average salary for each job title.
select job_title,avg(salary) as avg_salary from employee
group by job_title;

--c)Identify the employees who have received a performance rating of "Excellent" in the past year.
select first_name,last_name from employee as e 
join performance as p on e.emp_id=p.emp_id where performance_rating='Excellent';

--  * d) Calculate the total number of employees in each department.
select department.dept_name , count(employee.emp_id) as total_employees from department left join employee on department.dept_id=employee.dep_id
group by department.dept_name;

--* e) Find the maximum and minimum salaries among employees in the "Engineering" department.
select min(salary) as min_salary, max(salary) as max_salary from employee as e join department as d 
on e.dep_id=d.dept_id
where d.dept_name='Engineer';

--* f) Determine the number of years of service for each employee.
select first_name,last_name , Datediff(year,starting_date,getdate()) as total_year from employee;

--* g) Create a report that categorizes employees into "Salaried" (employee type = 'Salaried') and "Hourly" (employee type = 'Hourly') based on their employment type.
select emp_type ,count(emp_id) as total from employee
group by emp_type;

--* h) Calculate the bonus for each employee, considering a 5% bonus for employees with a performance rating of "Excellent."
select e.first_name,e.last_name,
case when p.performance_rating='Excellent' then (e.salary*0.5)
else 0
end as bonus
from employee e left join performance p on e.emp_id=p.emp_id

--* i) Update the employee status to "Inactive" if their last evaluation rating is below 3.
update employee
    set present_status='Inactive'
	 from employee as e join performance as p on e.emp_id =p.emp_id 
	where eval_rating<3
	select * from employee

--* j) Calculate the overtime pay for hourly employees based on their worked hours. Award overtime pay at 1.5 times the regular hourly rate for hours worked beyond 40.