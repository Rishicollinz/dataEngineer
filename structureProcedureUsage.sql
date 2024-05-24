use trial;
select * from Students;
call updateData(5,'Sri',@age,@grade);
select @age,@grade;