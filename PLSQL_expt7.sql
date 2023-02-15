create table Employee (
    empid int primary key,
    empname varchar(20),
    joining_date date,
    relieving_date date,
    salary int
);

  insert into Employee values(1,'Rajesh','01-JAN-2013','01-JAN-2014',40000);
  insert into Employee values(2, 'Suresh', '01-FEB-2008', '01-JAN-2016', 60000);
  insert into Employee values(3, 'Maya', '01-NOV-2010', '01-JAN-2019', 70000);


declare 
    cursor cur_employee is
        select empid,empname,joining_date,relieving_date,salary
        from Employee;

    a_employee cur_employee%rowtype;
    year_service number;
    pension decimal;
begin
    open cur_employee;
    loop 
        fetch cur_employee into a_employee;
        exit when cur_employee%NOTFOUND;
        year_service:= trunc(months_between(a_employee.relieving_date, a_employee.joining_date) / 12);
        pension:= (year_service*a_employee.salary)/100;
        dbms_output.put_line('Person ' || a_employee.empid || ': ' || a_employee.empname || ', Pension: ' || pension || ', Service: ' || year_service);
    end loop;
    close cur_employee;
end;
/
