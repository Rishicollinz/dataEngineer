use trial;
create table family(
id int auto_increment primary key,
name varchar(255) not null
);
insert into family(name) values ('RishiFamily'),('SriFamily'),('ArunFamily');

create table members(
id int auto_increment primary key,
name varchar(255) not null,
family_id int not null,
constraint fk_key
Foreign key(family_id) 
references family(id)
);
insert into members(name,family_id) values ('Rishi',1),('Dh',1),('Sri',2),('sree',2),('Arun',3),('Pras',3),('shen',3);
select res from (
select f.name as res, count(f.name) as quantity from family as f join members as m on f.id=m.family_id group by m.family_id order by quantity desc limit 1
)as sbu;
select * from members;
select id,name,family_id, dense_rank() over(order by id desc) as ranking from members;
start TRANSACTION ;
savepoint save1;
delete from members where id=2;
rollback to save1;
commit;