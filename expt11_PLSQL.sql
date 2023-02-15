--The following table shows the salary information of employees in a company. EMPLOYEE
--(empid, empname, designation, dept, salary) Write a trigger that displays the total number
--of tuples in the relation on each insertion, deletion and updation.

create table employee1(
			empname varchar(20),
            dept varchar(20)
            );
            

set serveroutput on

create or replace trigger total_number 
after insert or delete or update 
on employee1
for each row


declare
	count1 number;
    PRAGMA AUTONOMOUS_TRANSACTION;
    
begin
    select count(*) into count1 from employee1;
    dbms_ouput.put_line('Total number of tuples='|| count1);
end;
/

insert into employee1 values('achu','cse');
    

	