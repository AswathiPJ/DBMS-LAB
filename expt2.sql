create database Library;
use Library;

create table Book(
	accession_no int,
	title varchar(40),
	publisher varchar(40),
	author varchar(40),
	date_of_purchase date,
	date_of_publishing date,
	status varchar(40)
);

insert into Book values(1,"Aadu Jeevitham","DC books","Benyamin","2008-08-02","2008-07-15","issued");
insert into Book values(2,"Aadu Jeevitham","H and C Books","Benyamin","2010-04-22","2008-07-15","reference");
insert into Book values(3,"Khasakinte Ithihasam","Ascend Publishers","OV Vijayan","2022-07-02","2010-03-09","issued");
insert into Book values(4,"Alice in Wonderland","H and C Books","Lewis Carrol","2022-05-01","2010-03-09","cannot be issued");
insert into Book values(5,"Gulliver's Travels","Kairali Books","Jonathan Swift","2013-02-02","2010-03-09","present in the library");
insert into Book values(6,"Crime and Punishment","DC books","Dostoevsky","2013-02-02","2010-03-09","issued");
insert into Book values(7,"Database systems","Pearson","Elmasri","2013-02-02","2010-03-09","present in the library");
insert into Book values(8,"Database systems","Pearson","Navathe","2013-02-02","2010-03-09","issued");
insert into Book values(9,"Database systems","Peterson","Elmasri","2022-06-12","2010-03-09","reference");
insert into Book values(10,"Aadu Jeevitham","DC books","Benyamin","2008-08-02","2008-07-15","issued");
insert into Book values(11,"Aadu Jeevitham","DC books","Benyamin","2008-12-01","2008-07-15","reference");
insert into Book values(12,"Crime and Punishment","DC books","Dostoevsky","2013-02-02","2010-03-09","cannot be issued");
insert into Book values(13,"Aadu Jeevitham","DC books","Benyamin","2008-12-01","2008-07-15","cannot be issued");
insert into Book values(14,"Crime and Punishment","H and C Books","Dostoevsky","2013-02-02","2010-03-09","cannot be issued");
insert into Book values(15,"Aadu Jeevitham","DC books","Benyamin","2009-02-22","2008-07-15","issued");
insert into Book values(16,"Aadu Jeevitham","DC books","Benyamin","2009-02-22","2008-07-15","reference");
insert into Book values(17,"Aadu Jeevitham","DC books","Benyamin","2009-02-22","2008-07-15","reference");
insert into Book values(18,"Aadu Jeevitham","DC books","Benyamin","2009-02-22","2008-07-15","cannot be issued");
insert into Book values(19,"Aadu Jeevitham","DC books","Benyamin","2009-02-22","2008-07-15","present in the library");
insert into Book values(20,"Aadu Jeevitham","DC books","Benyamin","2009-02-22","2008-07-15","present in the library");
insert into Book values(21,"Aadu Jeevitham","DC books","Benyamin","2009-02-22","2008-07-15","present in the library");
insert into Book values(22,"Database systems","Peterson","Elmasri","2022-06-12","2010-03-09","reference");
insert into Book values(23,"Gulliver's Travels","Kairali Books","Jonathan Swift","2013-02-02","2010-03-09","present in the library");


select "BOOK DETAILS" as " ";

select * 
from Book;




select "Total number of copies of each book in the library" as " ";

select title,author,publisher,count(*) "number of copies"
from Book
group by title,author,publisher;




select "Total number of reference copies for each book in the Library" as " ";

select title,author,publisher,count(*) "number of reference copies"
from Book
where status="reference"
group by title,author,publisher;




select "For each book in the Library obtain a count of the total number of issued copies, number of copies
existing at present in the library and the number of reference copies." as " ";

select title,author,publisher,
		sum(status="issued") as "no of issued copies",
		sum(status="present in the library") as "no of copies present in the library",
		sum(status="reference") as "no of reference copies"
from Book
group by title,author,publisher;




select "Details of various books of each publisher with status of the books set to cannot be issued" as " ";

select *
from Book
where status="cannot be issued"
order by publisher;




select "details of the books which are new arrivals. The books which are purchased during the last 6 months are categorized as new arrivals" as " ";

select *
from Book
where date_of_purchase >= date_sub(now(), interval 6 month);




select "details of each famous book . Each Famous book should be purchased within 1 year of 
its date-of-publishing and the number of total copies is more than 10" as " ";

																	
select title,author,publisher
from Book
where date_of_publishing >= date_sub(date_of_purchase, interval 1 year)
group by title,author,publisher
having count(*)>10;
	
			


drop table Book;
drop database Library;