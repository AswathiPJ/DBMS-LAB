declare 
	n number :=&n;
	i number (1);
	result integer :=0;
begin 
	for i in 1..n loop
		if mod(n,i)=0 then
			result:=result+i;
		end if;
	end loop;
	if result=2*n then
		dbms_output.put_line(n||' is Perfect');
	else
		dbms_output.put_line(n|| ' is not Perfect');
	end if;
end;
/		