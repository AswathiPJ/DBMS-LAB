create database student_academic_system;
use student_academic_system;


create table student(
name varchar(20),
rollno int(2),
utyregno varchar(10) PRIMARY KEY,
address varchar(50),
admission_yr int,
passout_yr int,
branch varchar(5),
clstr varchar(15),
email varchar(50),
phoneno varchar(15)
);
 



create table faculty(
name varchar(20),
id varchar(30) PRIMARY KEY,
email varchar(50),
designation varchar(30),
joing_date date,
relieved_date date
);


create table qualification(
utyregno varchar(10),
total int,
grade char(20),
year varchar(5),
FOREIGN KEY(utyregno) references student(utyregno)
);

create table project(
utyregno varchar(10),
title varchar(40),
guide varchar(15),
prd_of_impl int,
core_area varchar(10),
FOREIGN KEY(utyregno) references student(utyregno)
);


INSERT INTO student VALUES
('Reade', 1, 'KTE59XX70', '72025 Sherman Parkway', 2020, 2024, 'EEE', 'Aswin', 'rblumer0@mapy.cz', '7044958412'),
('Gracia', 2, 'KTE96XX57', '9723 Buhler Crossing', 2020, 2024, 'CSE', 'Amalia', 'gcrufts1@mlb.com', '6059232571'),
('Larine', 3, 'KTE99XX66', '57 Anderson Park', 2017, 2021, 'MEC', 'Arya', 'lduffill2@histats.com', '9301870105'),
('Cyrill', 4, 'KTE05XX60', '8 Forest Circle', 2017, 2021, 'CIV', 'Hrishikesh', 'cdemaid3@imageshack.us', '6098931285'),
('Alberto', 5, 'KTE84XX84', '65863 Stephen Pass', 2017, 2021, 'MEC', 'Arya', 'amacmychem4@domainmarket.com', '7478791342'),
('Rowland', 6, 'KTE78XX78', '1954 Lerdahl Junction', 2017, 2021, 'CSE', 'Shaju', 'rkimmitt5@google.co.jp', '6436096352'),
('Querida', 7, 'KTE97XX42', '75 Mayer Hill', 2017, 2021, 'CSE', 'Shaju', 'qboyles6@dedecms.com', '7259647900'),
('Cortney', 8, 'KTE33XX46', '72058 Farragut Junction', 2017, 2021, 'EEE', 'Abru', 'ckelbie7@simplemachines.org', '8767658796'),
('Wendell', 9, 'KTE08XX56', '5452 Clarendon Lane', 2018, 2022, 'ECE', 'Aswin', 'wsandever8@studiopress.com', '8376102289'),
('Ruggiero', 10, 'KTE08XX40', '2050 Quincy Park', 2018, 2022, 'ECE', 'Aswin', 'rdionisio9@a8.net', '9047797177'),
('Othelia', 11, 'KTE22XX47', '94542 Russell Court', 2019, 2023, 'MEC', 'Hrishikesh', 'olidyarda@guardian.co.uk', '8771090635'),
('Evanne', 12, 'KTE32XX50', '7 Reindahl Avenue', 2017, 2021, 'CIV', 'Hrishikesh', 'echarnickb@cdbaby.com', '8917709000'),
('Werner', 13, 'KTE67XX12', '477 Banding Point', 2017, 2021, 'MEC', 'Arya', 'wfargiec@uol.com.br', '6222432090'),
('Rickie', 14, 'KTE94XX98', '4974 Clarendon Court', 2018, 2022, 'CSE', 'Amalia', 'ralessandruccid@bluehost.com', '6431856826'),
('Joell', 15, 'KTE84XX57', '609 Lawn Drive', 2020, 2024, 'EEE', 'Aswin', 'jrobroee@adobe.com', '6280780207'),
('Percival', 16, 'KTE52XX11', '6 Vahlen Hill', 2018, 2022, 'ECE', 'Aswin', 'pcruttendenf@cmu.edu', '9673248954'),
('Kara-lynn', 17, 'KTE63XX38', '8 Delaware Park', 2018, 2022, 'CSE', 'Amalia', 'kquiltyg@amazon.com', '8107687778'),
('Matty', 18, 'KTE30XX07', '173 Cherokee Court', 2020, 2024, 'CIV', 'Arya', 'mmeiningerh@51.la', '7379857870'),
('Cristi', 19, 'KTE99XX47', '582 Reinke Pass', 2018, 2022, 'CSE', 'Amalia', 'cscholeyi@blinklist.com', '9571826511'),
('Orel', 20, 'KTE64XX48', '54 Heath Center', 2020, 2024, 'CIV', 'Arya', 'osharpj@over-blog.com', '9903333410');




INSERT INTO qualification VALUES
('KTE59XX70', 76, 'secondClass', 2021),
('KTE59XX70', 87, 'firstClass', 2022),
('KTE59XX70', 79, 'secondClass', 2023),
('KTE59XX70', 76, 'secondClass', 2024),
('KTE96XX57', 98, 'distinct', 2021),
('KTE96XX57', 99, 'distinct', 2022),
('KTE96XX57', 77, 'secondClass', 2023),
('KTE96XX57', 85, 'firstClass', 2024),
('KTE99XX66', 75, 'secondClass', 2018),
('KTE99XX66', 99, 'distinct', 2019),
('KTE99XX66', 82, 'firstClass', 2020),
('KTE99XX66', 94, 'distinct', 2021),
('KTE05XX60', 80, 'secondClass', 2018),
('KTE05XX60', 81, 'firstClass', 2019),
('KTE05XX60', 92, 'distinct', 2020),
('KTE05XX60', 97, 'distinct', 2021),
('KTE84XX84', 96, 'distinct', 2018),
('KTE84XX84', 77, 'secondClass', 2019),
('KTE84XX84', 97, 'distinct', 2020),
('KTE84XX84', 83, 'firstClass', 2021),
('KTE78XX78', 86, 'firstClass', 2018),
('KTE78XX78', 81, 'firstClass', 2019),
('KTE78XX78', 90, 'firstClass', 2020),
('KTE78XX78', 92, 'distinct', 2021),
('KTE97XX42', 81, 'firstClass', 2018),
('KTE97XX42', 96, 'distinct', 2019),
('KTE97XX42', 92, 'distinct', 2020),
('KTE97XX42', 92, 'distinct', 2021),
('KTE33XX46', 80, 'secondClass', 2018),
('KTE33XX46', 88, 'firstClass', 2019),
('KTE33XX46', 85, 'firstClass', 2020),
('KTE33XX46', 79, 'secondClass', 2021),
('KTE08XX56', 84, 'firstClass', 2019), 
('KTE08XX56', 90, 'firstClass', 2020),
('KTE08XX56', 90, 'firstClass', 2021),
('KTE08XX56', 90, 'firstClass', 2022),
('KTE08XX40', 80, 'secondClass', 2019),
('KTE08XX40', 75, 'secondClass', 2020),
('KTE08XX40', 78, 'secondClass', 2021),
('KTE08XX40', 95, 'distinct', 2022),
('KTE22XX47', 87, 'firstClass', 2020),
('KTE22XX47', 84, 'firstClass', 2021),
('KTE22XX47', 97, 'distinct', 2022),
('KTE22XX47', 80, 'secondClass', 2023),
('KTE32XX50', 77, 'secondClass', 2018),
('KTE32XX50', 77, 'secondClass', 2019),
('KTE32XX50', 85, 'firstClass', 2020),
('KTE32XX50', 87, 'firstClass', 2021),
('KTE67XX12', 97, 'distinct', 2018),
('KTE67XX12', 99, 'distinct', 2019),
('KTE67XX12', 91, 'distinct', 2020),
('KTE67XX12', 75, 'secondClass', 2021),
('KTE94XX98', 95, 'distinct', 2019),
('KTE94XX98', 100, 'distinct', 2020),
('KTE94XX98', 84, 'firstClass', 2021),
('KTE94XX98', 100, 'distinct', 2022),
('KTE84XX57', 79, 'secondClass', 2021),
('KTE84XX57', 88, 'firstClass', 2022),
('KTE84XX57', 87, 'firstClass', 2023),
('KTE84XX57', 92, 'distinct', 2024),
('KTE52XX11', 92, 'distinct', 2019),
('KTE52XX11', 80, 'secondClass', 2020),
('KTE52XX11', 87, 'firstClass', 2021),
('KTE52XX11', 80, 'secondClass', 2022),
('KTE63XX38', 81, 'firstClass', 2019),
('KTE63XX38', 80, 'secondClass', 2020),
('KTE63XX38', 97, 'distinct', 2021),
('KTE63XX38', 80, 'secondClass', 2022),
('KTE30XX07', 94, 'distinct', 2021),
('KTE30XX07', 86, 'firstClass', 2022),
('KTE30XX07', 75, 'secondClass', 2023),
('KTE30XX07', 96, 'distinct', 2024),
('KTE99XX47', 86, 'firstClass', 2019),
('KTE99XX47', 96, 'distinct', 2020),
('KTE99XX47', 80, 'secondClass', 2021),
('KTE99XX47', 97, 'distinct', 2022),
('KTE64XX48', 96, 'distinct', 2021),
('KTE64XX48', 91, 'distinct', 2022),
('KTE64XX48', 94, 'distinct', 2023),
('KTE64XX48', 86, 'firstClass', 2024);


INSERT INTO project VALUES
('KTE59XX70', 'edu.stanford.Daltfresh', 'Aswin', 2, 'ECE'),
('KTE96XX57', 'org.pbs.Toughjoyfax', 'Hrishikesh', 3, 'CIV'),
('KTE99XX66', 'com.chronoengine.Matsoft', 'Arya', 3, 'MEC'),
('KTE05XX60', 'org.npr.Kanlam', 'Amalia', 2, 'CSE'),
('KTE84XX84', 'gov.census.Flowdesk', 'Amalia', 1, 'CSE'),
('KTE78XX78', 'com.springer.Quo Lux', 'Shaju', 3, 'CSE'),
('KTE97XX42', 'com.deviantart.Kanlam', 'Arya', 2, 'CIV'),
('KTE33XX46', 'br.com.uol.Job', 'Aswin', 1, 'ECE'),
('KTE08XX56', 'com.msn.Regrant', 'Arya', 1, 'CIV'),
('KTE08XX40', 'com.friendfeed.Greenlam', 'Arya', 2, 'MEC'),
('KTE22XX47', 'jp.co.yahoo.Span', 'Amalia', 1, 'CSE'),
('KTE32XX50', 'com.printfriendly.Quo Lux', 'Hrishikesh', 3, 'MEC'),
('KTE67XX12', 'com.blogtalkradio.Tampflex', 'Arya', 3, 'CIV'),
('KTE94XX98', 'jp.co.yahoo.Daltfresh', 'Hrishikesh', 1, 'CIV'),
('KTE84XX57', 'edu.wisc.Namfix', 'Aswin', 3, 'ECE'),
('KTE52XX11', 'org.wikipedia.Tresom', 'Hrishikesh', 2, 'CIV'),
('KTE63XX38', 'jp.co.amazon.Latlux', 'Arya', 2, 'MEC'),
('KTE30XX07', 'com.forbes.Matsoft', 'Arya', 2, 'CIV'),
('KTE99XX47', 'com.deviantart.Fintone', 'Aswin', 1, 'EEE'),
('KTE64XX48', 'org.unicef.Kanlam', 'Abru', 3, 'EEE');

INSERT INTO faculty VALUES ('Abru', 'KTF52YY80', 'solenane0@example.com', 'Prof', '2022-05-01', '2022-10-22'),
('Arya', 'KTF45YY93', 'jliven1@posterous.com', 'Prof', '2021-07-24', '2022-07-13'),
('Hrishikesh', 'KTF85YY58', 'efeldmesser2@chicagotribune.com', 'Prof', '2020-09-03', null),
('Aswin', 'KTF11YY19', 'ecantos3@walmart.com', 'Ad_Hoc', '2018-01-14', null),
('Amalia', 'KTF37YY55', 'marling4@toplist.cz', 'Asst_Prof', '2021-08-30', '2022-09-23'),
('Shaju', 'KTF40YY60', 'clyle5@reddit.com', 'Asst_Prof', '2018-08-17', null);


/*
select *
from student;

select *
from faculty;

select *
from qualification;

select *
from project;
*/



select "1)The names, roll no and address of the students who have completed the course under a given branch for each year" as " ";

select name,rollno,address,passout_yr
from student
where branch="CSE"
order by passout_yr;





select "2)The names and roll nos of the students who completed the course for each year of pass out and
for each branch" as " ";

select name,rollno
from student
order by passout_yr,branch;





select "3)The details of projects under taken by the students of a particular branch"  as " ";

select p.title,p.guide,p.prd_of_impl,p.core_area
from student natural join project as p
where student.branch="CSE";





select "4)The name of the faculty who guided more than a specified no. of projects in each academic year" as " ";

select guide,passout_yr as academic_year,count(*) as "No of projects guided"
from project natural join student
group by passout_yr,guide
having count(*)>2
order by passout_yr;





select "5)The branch with highest academic performance, chosen for each academic year" as " ";


/*
create view academic_performance as
select branch,year,avg(total) as avg
from student natural join qualification
group by branch,year;

create view max_perf as
select year,max(avg) as max
from academic_performance
group by year;

select branch,q.year
from student as s natural join qualification as q,max_perf as m
where q.year=m.year
group by branch,year
having avg(total)=m.max;
*/

create view academic_performance as
select branch,year,avg(total) as avg
from student natural join qualification
group by branch,year
order by year,avg desc;

select year,branch,max(avg)
from academic_performance
group by year
order by year;






select "6)The details of the students who secured the highest total for each branch and for each academic year. " as " ";

create view topper as
select year,branch,max(total) as max_total
from student as s natural join qualification as q
group by year,branch;

select s.*,t.max_total,year
from (student s natural join qualification q) natural join topper t
where q.total=t.max_total
order by year;





select "7)The list of students who secured a given grade, for a given academic year." as " ";

select name
from student natural join qualification 
where grade="firstClass" and year=2024;





select "8)The list of projects undertaken in each department together with the project guide name and
emailid, for each academic year under a given core area." as " ";


select title,guide,email,passout_yr,branch
from student natural join project 
where core_area="CIV"
order by passout_yr,branch;





select " 9)The number of total grades for each branch of study and for each year of admission." as " ";

select branch,admission_yr,sum(grade="firstClass") as "No of first classes",sum(grade="secondClass") as "No of second classes",sum(grade="distinction") as "No of distinctions"
from student natural join qualification 
group by branch,admission_yr
order by admission_yr,branch;





select "10)The details of students in each branch admitted in a specified academic year." as " ";

select *
from student
where admission_yr=2020
order by branch;





select "11)The details of the students, sorted on the basis of year of admission and branch of study." as " ";

select *
from student
order by admission_yr,branch;





select "12)The best mark, worst mark and the avg mark for each branch for a given academic year." as " ";

select branch,year,max(total) as "Best mark",min(total) as "Worst mark",avg(total) as "Avg mark"
from student natural join qualification
where year=2024
group by branch,year;




drop table faculty;
drop table project;
drop table qualification;
drop table student;

drop database student_academic_system;