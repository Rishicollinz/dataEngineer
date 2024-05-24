show databases;
show tables;
select * from customers;
create database Keycheck;
use Keycheck;
create table customers(
id int auto_increment,
name varchar(255) not null,
age int not null,
address varchar(255) not null,
salary int not null,
constraint pk_key
primary key(id,age)
);
desc customers;
show index from customers;
create table orders(
customer_id int,
date datetime not null,
id int primary key auto_increment,
amount int not null,
constraint fk_key
foreign key (customer_id) 
references customers(id)
);
desc orders;
drop table customers;
show index from orders;