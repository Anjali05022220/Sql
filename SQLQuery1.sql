
create table customer
(
   customer_number int primary key,
   fname varchar(30),
   mname varchar(20),
   lname varchar(20),
   city varchar(15),
   mobno varchar(10),
   occupation varchar(10),
   dob date
 )
 insert into customer values(1,'Ramesh','Chandra','Sharma','Delhi','9543198345','Service','1976-12-06'),
insert into customer values(2,'avinash','sunder','minha','delhi',9123456778,'service','1974-10-16'),
 (3,'rahul','null','rastogi','delhi',9765178901,'student','1981-09-26'),
 (4,'parul','null','gandhi','delhi',9876532010,'housewife','1976-11-03'),
 (5,'nisha','null','damle','mumbai',7954198761,'service','1975-12-03');
 select * from customer

 select count(customer_number) as total_no,city from Customer group by city;

 select  distinct city from customer;

 select count(customer_number)as no,occupation from Customer group by occupation;

 select * from customer order by fname;

 create table customer_master
(customer_number int primary key,
firstname varchar(20),
middlename varchar(20),
lastname varchar(20),
customer_city varchar(20),
customer_contact_no varchar(12),
occupation varchar(20),
customer_date_of_birth date);


create table branch_master
(branch_id int primary key,
branc_name varchar(20),
branch_city varchar(20));
--drop table branch_master;

create table loan_details
( customer_number int,
branch_id int,
loan_amount bigint,
constraint fk_customer_num foreign key(customer_number) references customer_master(customer_number));
--drop table loan_details;


create table account_master
( account_number int primary key,
customer_number int,
branch_id int,
opening_balance bigint,
account_opening_date date,
account_type varchar(20),
account_ststus varchar(20),
constraint fk_customer_no foreign key(customer_number) references customer_master(customer_number),
constraint fk_branch_id foreign key(branch_id) references branch_master(branch_id));



create table transaction_details
(transaction_number int primary key,
account_number int,
date_of_transaction date,
medium_of_transaction varchar(20),
transaction_type varchar(20),
transaction_amount bigint,
constraint fk_account_no foreign key(account_number) references account_master(account_number));

 


 	create table tblDepartment
	(
	Id int primary key Identity,
	DepartmentName varchar(50),
	Location Varchar(100),
	DepartmentHead varchar(50))

	 insert into tblDepartment values
	 ('IT','London','Rick'),
	 ('Payroll','Delhi','Ron'),
	 ('HR','NewYork','Christie')
	
select * from   tblDepartment
	   
	   
	   create table tblEmployee
(
Id int primary key identity,
Name varchar(50),
Gender varchar(50),
Salary int,
DepartmentId  int foreign key references tblDepartment(Id)
)

 select * from tblEmployee

  insert into tblEmployee values
  ('Tom','Male',3500,1),
  ('Pam','Female',4000,3),
  ('John','Male',7000,1),
  ('Sam','Male',5000,2)
  
  CREATE PROCEDURE usp_welcome
as
begin
print 'Welcome to SQL Server';
end

exec usp_welcome;
select * from tblEmployee

-----------

create proc usp_employee_details(@gender varchar(50),@deptid int)
as
begin
select name,gender,salary from employees
where gender=@gender and deptid=@deptid
end

exec usp_employee_details Male,2;


----4TH
create proc usp_empcount(@gender varchar(50))
as
begin
select count(gender)as totalempcount from employees
where gender=@gender
end
exec usp_empcount Male;