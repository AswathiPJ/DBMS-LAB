declare
	n number :=&n;
	i number (1);
	fact integer :=1;
begin
	if n=0 then
		dbms_output.put_line('Factorial is ' || 1);
	elsif n=1 then
		dbms_output.put_line('Factorial is ' || 1);
	else
		for i in 1..n loop
			fact:=i*fact;
		end loop;
		dbms_output.put_line('Factorial is ' || fact);
	end if;
end;
/	