create database Bank;
use Bank;

create table Branch(
branch_id int primary key,
branch_name varchar(20),
branch_city varchar(20)
);

create table Customer(
customer_id int primary key,
customer_name varchar(20),
customer_city varchar(20)
);

create table Savings(
customer_id int,
branch_id int,
saving_accno varchar(20),
balance varchar(20),
foreign key (customer_id) references Customer(customer_id),
foreign key (branch_id) references Branch(branch_id)
);

create table Loan(
customer_id int,
branch_id int,
loan_accno varchar(20),
balance varchar(20),
foreign key (customer_id) references Customer(customer_id),
foreign key (branch_id) references Branch(branch_id)
);



insert into Branch values
(401,"Thiruvananthapuram","Thiruvananthapuram"),
(402,"Kottayam","Kottayam"),
(403,"Ernakulam","Kochi"),
(404,"Kozhikode","Kozhikode");

insert into Customer values
(6001,"Ananthakrishnan","Thiruvananthapuram"),
(6002,"Irfan","Thiruvananthapuram"),
(6003,"Suneeth","Thiruvananthapuram"),
(6004,"Sreejith","Kottayam"),
(6005,"Jafar","Kazhakoottam"),
(6006,"Radika","Pampady"),
(6007,"Jameela","Kanjikuzhi"),
(6008,"Bindu","Kottayam"),
(6009,"Purushothaman","Kollam"),
(6010,"Vincy","Kottayam"),
(6011,"Abdul Rahman","Thrissur"),
(6012,"Vishwanathan","Ernakulam"),
(6013,"Marykutty","Mattancheri"),
(6014,"Hajara","Ernakulam"),
(6015,"Revathy","Kozhikode"),
(6016,"Hameed","Perambra"),
(6017,"Suchithra","Kozhikode"),
(6018,"Saneesh","North Paravoor"),
(6019,"Gokul Das","Kozhikode"),
(6020,"Abraham","Kappad");

insert into Savings values
(6001,401,6400101,15000),
(6002,401,6400102,200000),
(6005,401,6400105,30000),
(6007,401,6400107,70000),
(6004,402,6400204,400000),
(6006,402,6400206,100000),
(6007,402,6400207,40000),
(6008,402,6400208,74000),
(6010,402,6400210,128507),
(6011,403,6400311,700000),
(6001,403,6400301,200000),
(6012,403,6400312,500000),
(6013,403,6400313,250000),
(6015,404,6400415,100000),
(6016,404,6400416,90756);

insert into Loan values
(6005,401,4600105,100000),
(6003,401,4600103,200000),
(6009,401,4600109,150000),
(6019,401,4600119,100000),
(6011,403,4600311,1000000),
(6013,403,4600313,500000),
(6014,403,4600314,300000),
(6018,403,4600318,300000),
(6006,403,4600306,100000),
(6009,403,4600309,200000),
(6014,404,4600414,100000),
(6016,404,4600416,150000),
(6017,404,4600417,200000),
(6019,404,4600419,300000),
(6020,404,4600419,400000),
(6008,404,4600408,100000),
(6009,404,4600111,200000);



select *
from Branch;

select *
from Customer;

select *
from Savings;

select *
from Loan;

create view Savings_details as
select *
from ((Savings natural join Branch)natural join Customer);

create view Loan_details as
select *
from ((Loan natural join Branch)natural join Customer);
/*
create view All_account_details as
(select *
from Savings_details
union
select *
from Loan_details)
order by customer_id;

*/
select "(a) List out the details of the customers who live in the same city as they have savings or loan account" as " ";

(select customer_id,customer_name,customer_city
from Savings_details
where customer_city=branch_city)
union
(select customer_id,customer_name,customer_city
from Loan_details
where customer_city=branch_city);





select "(b) List out the customers who have an account in a given branch-city" as " ";

(select customer_name
from Savings_details
where branch_city="Kochi")
union
(select customer_name
from Loan_details
where branch_city="Kochi");





select "(c) List out the customers who have an account in more than one branch." as " ";

(select customer_name
from Savings_details
group by customer_name
having count(*)>1)
union
(select customer_name
from Loan_details
group by customer_name
having count(*)>1);





select "(d) List out details of the customer who have
i. neither a saving account but a loan" as " ";

select customer_name
from Loan_details
where customer_name not in
(select Savings_details.customer_name
from (Savings_details join Loan_details on Savings_details.customer_id=Loan_details.customer_id));





select "ii. neither a loan but has a saving account." as " ";

select distinct customer_name
from Savings_details
where customer_name not in
(select Savings_details.customer_name
from (Savings_details join Loan_details on Savings_details.customer_id=Loan_details.customer_id));





select "iii. having both loan and saving." as " ";

select Savings_details.customer_name
from (Savings_details join Loan_details on Savings_details.customer_id=Loan_details.customer_id);





select "(e) List the names of the customers who have no saving at all but having loan in more than two branches." as " ";

select customer_name
from Loan_details
where customer_name not in
(select Savings_details.customer_name
from (Savings_details join Loan_details on Savings_details.customer_id=Loan_details.customer_id))
group by customer_name
having count(*)>2;



select "(f) For each branch produce a list of the total number of customers, total number of customers with
loan only, total number of customers with saving only and the total number of customers with both
loan and saving." as " ";


create view no_loan as
select distinct l.branch_id, count(*) as no_l
from Loan_details as l
where l.customer_id not in (select s.customer_id from Savings_details as s where l.branch_id=s.branch_id)
group by branch_id
order by l.branch_id;

create view no_save as
select distinct l.branch_id, count(*) as no_s
from Savings_details as l
where l.customer_id not in (select s.customer_id from Loan_details as s where l.branch_id=s.branch_id)
group by branch_id
order by l.branch_id;

create view no_both as
select distinct l.branch_id, count(*) as no_bo
from Loan_details as l,Savings_details as s
where l.customer_id = s.customer_id and l.branch_id=s.branch_id
group by branch_id
order by l.customer_id;

create view branch_details as
select b.branch_id,b.branch_name,
ifnull(l.no_l,0) as no_of_customer_loan_only,
ifnull(s.no_s,0) as no_of_customer_savings_only,
ifnull(bo.no_bo,0) as no_of_customer_both,
ifnull(l.no_l,0)+ifnull(s.no_s,0)+ifnull(bo.no_bo,0) as no_of_customers_total
from Branch as b
left join no_both as bo on b.branch_id=bo.branch_id
left join no_loan as l on b.branch_id=l.branch_id
left join no_save as s on b.branch_id=s.branch_id;

select * from branch_details;




select "(g) Find the details of the branch which has issued max amount of loan." as " ";
/*
create view Max_loan as
select branch_name,sum(balance) as balance
from Loan_details
group by branch_name;
select branch_name,max(balance)
from Max_loan;
*/
create view maxloan as
select branch_id,branch_name,sum(balance) as total
from Loan_details
group by branch_id;

select * 
from maxloan
where total in (select max(total) from maxloan);





select "(h) Find the details of the branch which has not yet issued any loan at all." as " ";

select branch_id,branch_name,no_of_customer_loan_only
from branch_details
where no_of_customer_loan_only=0;





select "(i) For each customer produce a list consisting of the total saving balance, loan balance for those branches
where he has either a loan or a saving account or both." as " ";


create view all_account_details as
(select customer_id,customer_name,saving_accno as accno
from Savings_details)
union
(select customer_id,customer_name,loan_accno as accno
from Loan_details);

create view balance_details as
select a.customer_id,a.customer_name,ifnull(l.balance,0) as l_balance,ifnull(s.balance,0) as s_balance
from all_account_details as a
left join Loan as l on a.accno=l.loan_accno
left join Savings as s on a.accno=s.saving_accno;

select customer_id,customer_name,sum(l_balance) as loan_balance,sum(s_balance) as savings_balance
from balance_details
group by customer_id
order by customer_id;




drop table Savings;
drop table Loan;
drop table Branch;
drop table Customer;
drop database Bank;