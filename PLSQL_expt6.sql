--Given the scheme Person (pid, pname, DOB) . Find the age of each person using cursor.

create table person(
	pid int primary key,
    pname varchar(20),
    DOB date
    );

insert into person values(1,'achu',date'2001-03-01');
insert into person values(2,'kichu',date '2005-03-05');

select *
from person;

set serveroutput on
declare
	cursor c1 is 
		select *
        from person;
	per c1%rowtype;
    age number;
    
begin
	open c1;
    loop
		fetch c1 into per;
        exit when c1%notfound;
        age :=trunc(months_between(sysdate,per.DOB)/12);
        dbms_output.put_line(per.pname ||' age='||age);
	end loop;
    close c1;
end;
/