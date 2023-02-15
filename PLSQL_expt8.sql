--Write a pl/sql code to insert several names, roll nos and marks of three subjects for the
--students of a class into a table named student and compute their rank list and insert the rank
--information into the same table.

create table rank(
		name varchar(20),
        marks int,
        rank int
        );
        
insert into rank(name,marks) values('achu',120);
insert into rank(name,marks) values('kichu',200);
insert into rank(name,marks) values('sachu',160);
insert into rank(name,marks) values('machu',160);


select * from rank;


set serveroutput on
declare
	cursor c1 is
		select name,marks,rank() over (order by marks desc) as rank2
        from rank;
        
		rank1 number;
        one c1%rowtype;
        
begin
	open c1;
	loop
		fetch c1 into one;
        exit when c1%notfound;
        
        dbms_output.put_line(one.name||' rank='|| one.rank2);
        
        update rank
        set rank=one.rank2
        where name=one.name;
	end loop;
end;
/
select *
from rank;
        
        
        
        
