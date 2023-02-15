create database Library;
use Library;

create table Book(
accession_no int primary key,
title varchar(40),
publisher varchar(40),
year year,
date_of_purchase date,
status varchar(40)
);

create table Member(
member_id int primary key,
name varchar(20),
number_of_books_issued int,
max_limit int
);

create table Books_issue(
accession_no int,
member_id int,
date_of_issue date,
foreign key (accession_no) references Book(accession_no),
foreign key (member_id) references Member(member_id)
);


insert into Book values
(1,"Aadu Jeevitham","DC books","2008","2008-08-02","issued"),
(2,"Aadu Jeevitham","H and C Books","2008","2010-04-22","reference"),
(3,"Khasakinte Ithihasam","Ascend Publishers","2010","2022-07-02","issued"),
(4,"Alice in Wonderland","H and C Books","2010","2022-05-01","cannot be issued"),
(5,"Gullivers Travels","Kairali Books","2010","2013-02-02","present in the library"),
(6,"Crime and Punishment","DC books","2010","2013-02-02","preseny in the library"),
(7,"Database systems","Pearson","2010","2013-02-02","issued"),
(9,"Database systems","Peterson","2010","2022-06-12","reference"),
(14,"Crime and Punishment","H and C Books","2010","2013-02-02","cannot be issued"),
(15,"Aadu Jeevitham","DC books","2008","2008-08-02","issued"),
(16,"Database systems","Pearson","2010","2013-02-02","issued"),
(17,"Aadu Jeevitham","DC books","2008","2008-08-02","issued"),
(18,"Aadu Jeevitham","DC books","2008","2008-08-02","issued"),
(19,"Crime and Punishment","DC books","2010","2013-02-02","issued"),
(20,"Gullivers Travels","Kairali Books","2010","2013-02-02","present in the library");

insert into Member values 
(120,"Aswathi",3,3),
(121,"Aafiya",1,4),
(122,"Arya",2,4),
(123,"Anu",2,4);

insert into Books_issue values 
(1,120,"2022-11-04"),
(7,120,"2021-04-03"),
(3,120,"2021-04-03"),
(15,121,"2020-09-05"),
(16,122,"2022-01-20"),
(17,122,"2022-01-20"),
(18,123,"2022-02-03"),
(19,123,"2022-02-03");

select *
from Book;

select *
from Member;

select *
from Books_issue;





select "a)List all those books which are due from the students. A Book is considered as Due if it has been
issued 15 days back and not yet returned" as " ";

select accession_no,title,publisher
from (Book natural join Books_issue)
where datediff(curdate(),date_of_issue)>15;





select "b)List all members who cannot be issued any more books" as " ";

select name
from Member
where max_limit=number_of_books_issued;





select "c)List the details of the book which is taken by the maximum number of members and the book which
is taken by the least number of members" as " ";

/*
(select title,publisher,count(*)
from Book
where status="issued"
group by title,publisher
order by count(*) desc limit 1)
union
(select title,publisher,count(*)
from Book
where status="issued"
group by title,publisher
order by count(*) limit 1);

*/
create view BOOK_ISSUE as
select title,publisher,count(*) as issuecount
from Book
where status="issued"
group by title,publisher;

(select title,publisher,count(*)
from Book
where status="issued"
group by title,publisher
having count(*)=(
			select max(issuecount)
			from BOOK_ISSUE))
union
(select title,publisher,count(*)
from Book
where status="issued"
group by title,publisher
having count(*)=(
			select min(issuecount)
			from BOOK_ISSUE));







select "d)List the details of the book which is taken by every member and the one that is not yet issued" as " ";

create view BOOK_COUNT as
select title,publisher,count(*) as bookcount
from Book
group by title,publisher;


(select title,publisher
from Book
where status="issued"
group by title,publisher
having count(*) =(
select count(*)
from Member ))
union
(select title,publisher
from Book
where status="present in the library" or status="cannot be issued" or status="reference"
group by title,publisher
having count(*) = (
			select bookcount
			from BOOK_COUNT
			where Book.title=title and Book.publisher=publisher));






drop view BOOK_ISSUE;
drop view BOOK_COUNT;
drop table Books_issue;
drop table Book;
drop table Member;
drop database Library;