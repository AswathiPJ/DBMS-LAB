declare

n number:=&n;			
i number;		
flag number;	

begin
				
i := 2;
flag := 1;

for i in 2..n/2
	loop
		if mod(n, i) = 0
		then
			flag := 0;
			exit;
		end if;
	end loop;

	if flag = 1
	then
		dbms_output.put_line('Number is prime');
	else
		dbms_output.put_line('Number is not prime');
	end if;
end;		
/

