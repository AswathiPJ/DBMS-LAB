create database Student_details;
use Student_details;

create table Student(
rollno int primary key,
name varchar(20),
category varchar(20),
district varchar(20),
state varchar(20)
);
  
create table Student_rank(
rollno int,
mark int,
_rank int,
foreign key (rollno) references Student(rollno)
);


insert into Student values(21,"Aswathi","general","Kottayam","Kerala");
insert into Student values(14,"Amrutha","OBC","Malappuram","Kerala");
insert into Student values(30,"Aravind","SC","Kottayam","Kerala");
insert into Student values(39,"Fathima","EWS","Kannur","Kerala");
insert into Student values(1,"Aafiya","OBC","Thiruvanathapuram","Kerala");
insert into Student values(44,"Fayas","general","Malappuram","Kerala");
insert into Student values(50,"Maya","EWS","Kozhikkode","Kerala");
insert into Student values(10,"Abhishek","SC","Alappuzha","Kerala");
insert into Student values(40,"Davood","general","Anantnag","Kashmir");
insert into Student values(29,"Amal","SC","Kollam","Kerala");




insert  into Student_rank values(21,90,10);
insert  into Student_rank values(14,50,90);
insert  into Student_rank values(30,70,30);
insert  into Student_rank values(39,77,25);
insert  into Student_rank values(1,50,90);
insert  into Student_rank values(44,75,25);
insert  into Student_rank values(50,85,12);
insert  into Student_rank values(10,71,29);
insert  into Student_rank values(40,64,77);
insert  into Student_rank values(29,70,30);







select *
from Student;

select *
from Student_rank;





select "List the details of the students with the same category and same rank" as " ";

select s1.name,s1.category,r1._rank
from (Student as s1 natural join Student_rank as r1 ),(Student as s2 natural join Student_rank as r2)
where s1.category=s2.category and r1._rank=r2._rank and s1.rollno != s2.rollno  
order by category;






select "List out the details of the students (rollno, name, category, district, rank) who secured the highest
rank for each category in each state" as " ";

select s2.rollno,s2.name,s2.category,s2.district,s1.rank
from( 
	select category,state,min(_rank) as "rank"
	from (Student natural join Student_rank)
	group by category,state
				) as s1,(Student as s2 natural join Student_rank as r2)
where s1.rank=r2._rank;






select "List the names of the students(roll no, name, category, district, mark, rank) having either marks
same but ranks different or marks different but ranks same together with the status (whether they
belong to the first category or second category)" as " ";

create view Student_with_rank as
select *
from Student natural join Student_rank;

create table Status(
	status varchar(30)
);

insert into Status values("same mark different rank"),
				 ("same rank different mark");

(select distinct s1.rollno,s1.name,s1.category,s1.district,s1.mark,s1._rank,status
from Student_with_rank as s1,Student_with_rank as s2,Status
where s1.mark=s2.mark and s1._rank != s2._rank and status="same mark different rank"
order by s1.mark)
union
(select distinct s1.rollno,s1.name,s1.category,s1.district,s1.mark,s1._rank,status
from Student_with_rank as s1,Student_with_rank as s2,Status
where s1._rank = s2._rank and s1.mark!=s2.mark and status="same rank different mark"
order by s1._rank);




select "Find the category with the highest academic performance and the one with the least academic
performance" as " ";

(select category,avg(mark)
from (Student natural join Student_rank)
group by category
order by avg(mark) desc limit 1)
union
(select category,avg(mark)
from (Student natural join Student_rank)
group by category
order by avg(mark) limit 1);






select "Find the category whose academic performance is below the average academic performance" as " ";

select category,avg(mark)
from (Student natural join Student_rank)
group by category
having avg(mark)<(
			select avg(mark)
			from Student_rank );




drop view Student_with_rank;
drop table Student_rank;
drop table Student;
drop database Student_details;