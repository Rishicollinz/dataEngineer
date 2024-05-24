show databases;
use testDB;
show tables;
create table family(
fname varchar(255),
fid int
);
desc family;
insert into family values ('rishiFamily',1),('srifamily',2),('subafamily',3);
select * from familylist;
alter table family drop column id;
alter table familylist add column id int auto_increment primary key;
alter table family rename column fid to idf;
desc familylist;
rename table family to familylist;
create table childlist(
cid int primary key auto_increment,
childname varchar(255) not null,
id varchar(255), 
constraint fkname foreign key (id) references familylist(id)
);