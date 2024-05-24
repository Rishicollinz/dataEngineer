show databases;
CREATE DATABASE testDB;
use testDB;
show tables;
CREATE TABLE Customers (
    CustomerID int,
    CustomerName varchar(255),
    ContactName varchar(255),
    Address varchar(255),
    City varchar(255),
    PostalCode int,
    Country varchar(255)
);
INSERT INTO Customers (CustomerID,CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
('4','Cardl', 'Tm B. Ersen', 'gen 21', 'Svanger', '5006', 'Norway'),
('5','Greager', 'Pr Olen', 'Gaien 15', 'Saes', '4556', 'Norway'),
('6','Tty Tee', 'inn En', 'troad 19B', 'Lrpool', '58521', 'UK');
select * from Customers;
create table person2(
id int Not Null,
name varchar(255)
);
show tables;
select * from person;
Insert into person values ('1','Rishi');
select * from Customers where PostalCode between 4000 and 5000;
select Address,city from Customers;
select 10+20 as addition;
select current_timestamp();
show tables;
create table if not exists Students(
studId int AUTO_INCREMENT,
name varchar(255) NOT NULL,
standard varchar(255) NOT NULL,
PRIMARY KEY (studId)
);
select * from Students;
desc Students;
insert into Students(name,standard) values ('Sri','10'),('Aslam','11');
create table if not exists Students2 as select studId,name,standard from Students;
select * from stud2;
show tables;
Rename table Students2 to stud2;
truncate table stud2;
drop table stud2;
create table stud2 like Students;
desc stud2;
create table stud3 select * from Students;
select * from stud3;
desc stud3;
create table stud4 like Students;
insert into stud4 select * from Students;
select * from stud4;
desc stud4;
CREATE temporary TABLE Buyers(
   ID int NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),
   PRIMARY KEY (ID)
);
select * from Buyers;
show tables;
select * from stud4;
Alter table stud4 add column age int;
alter table stud4 drop column age;
desc stud4;
alter table stud4 add constraint myUnique2 unique key (name);
ALTER TABLE stud4 MODIFY age INT NOT NULL;
desc stud4;
alter table stud4 add column gender varchar(255) NOT NULL;
alter table stud4 add column address varchar(255) Unique key;
alter table stud4 drop constraint myUnique2;
show index from stud4;
alter table stud4 modify address varchar(255);
alter table stud4 rename column name to Name;
alter table stud4 modify column gender varchar(255);
ALTER TABLE stud4 MODIFY gender VARCHAR(255);
alter table stud4 add column leader tinyint NOT NULL;
desc stud4;

show tables;
SHOW FULL TABLES IN testDB WHERE TABLE_TYPE LIKE 'VIEW';