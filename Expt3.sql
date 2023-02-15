create database College;
use College;
create table Course(
course_id varchar(20) primary key,
name varchar(20),
fee varchar(15),
duration int
);

create table Student(
roll_no int,
name varchar(20),
date_of_birth date,
course_id varchar(20),
foreign key (course_id) references Course(course_id)
);

insert into Course values(1,"Btech","20000",4);
insert into Course values(2,"Mtech","30000",2);
insert into Course values(3,"Bsc","10000",3);
insert into Course values(4,"Msc","10000",2);
insert into Course values(5,"BCA","20000",3);
insert into Course values(6,"MCA","30000",2);

insert into Student values(1,"Aafiya","2000-01-01","1");
insert into Student values(1,"Aafiya","2000-01-01","3");
insert into Student values(1,"Aafiya","2000-01-01","5");
insert into Student values(1,"Aafiya","2000-01-01","4");
insert into Student values(1,"Aafiya","2000-01-01","2");
insert into Student values(1,"Aafiya","2000-01-01","6");
insert into Student values(21,"Aswathi","2001-11-13","1");
insert into Student values(21,"Aswathi","2001-11-13","5");
insert into Student values(21,"Aswathi","2001-11-13","3");
insert into Student values(30,"Gopika","2006-11-13","1");
insert into Student values(18,"Arya","2002-10-05","3");
insert into Student values(50,"Navami","2001-04-23","2");
insert into Student values(40,"Jerusha","2002-10-28","3");
insert into Student values(41,"Jimli","2002-10-03","6");



select *
from Student;

select *
from Course;






select "Names of all students who are greater than 18 years of age and have opted B.Tech Course" as " ";

select S.name
from (Student as S join Course as C on S.course_id=C.course_id)
where S.course_id="1" and  date_format(from_days(datediff(now(),date_of_birth)),'%y') >18;






select "Details of those courses whose fee is greater than that of B.Tech Course" as " ";

select *
from Course
where fee> (	select fee
			from Course
			where course_id="1");






select "Details of the students who have opted more than 2 courses" as " ";

select *
from Student
where roll_no in(		select roll_no
				from Student
				group by roll_no
				having count(*)>2);






select "Details (name, fee and duration) of the course which have been opted by maximum number
of students and those of the course which is opted by the least number of students" as " ";

(select C.name,fee,duration
from (Student as S join Course as C on S.course_id=C.course_id)
group by S.course_id
order by count(*) desc limit 1)
union
(select C.name,fee,duration
from (Student as S join Course as C on S.course_id=C.course_id)
group by S.course_id
order by count(*) limit 1);







select "Details of the student(s) who have opted every course." as " ";


select *
from Student
group by roll_no
having count(*)= (
				select count(*)
				from Course		);




drop table Student;
drop table Course;
drop database College;