show databases;
use trial;
show tables;
create table Students(
id int primary key auto_increment,
name varchar(255) not null,
age int check(age>=18),
grade int not null
);
show tables;
Insert into Students(name,age,grade) values ('Rishi',20,12),('Aslam',21,13),('Muba',22,9);
select * from Students;
Create view studentView as 
	select * from Students 
	where grade > 10 
	order by age desc 
    with check option;
Update studentView set name='aslam' , age=25 where id=2;
select * from viewStudent;
drop view studentView;
drop table Students;
delete from studentView where id=2;
Rename table studentView to viewStudent;
SHOW FULL TABLES IN trial WHERE TABLE_TYPE LIKE 'VIEW';
show tables;
create index studIndex on Students(name);
show index from Students;
Select * from Students cross join persons;