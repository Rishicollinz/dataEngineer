delimiter $$
use `trial`$$
create procedure newpr()
begin
	declare var int default 0;
    declare myname varchar(255);
    declare ids int;
    declare mycursor cursor for select * from members;
    -- handle function 
    open mycursor;
    goodLoop: loop
		fetch mycursor into ids,myname;
        if done then
			leave goodLoop;
		end if;
	end loop;
    close mycursor;
end$$
delimiter ;