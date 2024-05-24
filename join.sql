SHOW DATABASES;
USE tutorialsDB;
SHOW tables;
create table registry(
rollno int unique key not null,
name varchar(255) not null
);

Insert into registry values (1,'Rishi'),(2,'SRI'),(3,'Prasu'),(4,'Suba');
select * from registry;

create table results(
rollno int unique key not null,
sub1 int not null,
sub2 int not null,
sub3 int not null
);

insert into results values (1,100,50,50),(2,100,100,15),(3,50,75,25),(4,25,17,63);

select * from results where rollno%2=0;

select r1.rollno,r1.name from registry as r1 
join results as m1 
on r1.rollno=m1.rollno 
where m1.sub1+m1.sub2+m1.sub3<=150;

Insert into results2 select rollno,sub1,sub2 from results;
select * from results2;
update results2 set sub1=74 where rollno=2;
Create table results3 Like results;
desc results3;

create view resultView as select * from results where rollno >= 2 with check option;
select * from resultView;
drop view resultView;