create database bank;
use bank;
create table branch(branch_name varchar(20) primary key, branch_city varchar(20), assets numeric(10,5));
create table customer(customer_name varchar(20) primary key,customer_street varchar(20), customer_city varchar(20));
create table loan(loan_no varchar(10) primary key, branch_name varchar(20), amount numeric(15,3), foreign key(branch_name) references branch(branch_name));
create table borrower(customer_name varchar(20),loan_no varchar(10),primary key(customer_name,loan_no));

alter table borrower add foreign key(customer_name) references customer(customer_name);
alter table borrower add foreign key(loan_no) references loan(loan_no);

create table account(account_number int primary key,branch_name varchar(20),balance numeric(15,3),foreign key(branch_name) references branch(branch_name));
create table depositor(customer_name varchar(20),account_number int,
	primary key(customer_name,account_number),
    foreign key(customer_name) references customer(customer_name),
    foreign key(account_number) references account(account_number));
   
   
INSERT INTO branch VALUES ('Peroorkada','Trivandrum', 2574.34);  
INSERT INTO branch VALUES ('Pattoor','Trivandrum', 65716.97);    
INSERT INTO branch VALUES ('Chinnakada','Kollam', 15796.31);  
INSERT INTO branch VALUES ('Vyttila','Ernakulam', 87423.54);  
INSERT INTO branch VALUES ('Perumbavoor','Ernakulam', 97311.02); 

INSERT INTO customer VALUES ('Jake', 'Harrison', 'Trivandrum');
INSERT INTO customer VALUES ('Ronald', 'Harrison', 'Trivandrum');
INSERT INTO customer VALUES ('Smith', 'City Gardens', 'Kollam');
INSERT INTO customer VALUES ('Neethu', 'City Gardens', 'Kollam');
INSERT INTO customer VALUES ('Raju', 'Greenlane', 'Aleppey');
INSERT INTO customer VALUES ('Basha', 'VT Nagar', 'Ernakulam');

INSERT INTO loan VALUES ('A1', 'Pattoor', 5400.0);
INSERT INTO borrower VALUES ('Jake', 'A1');

INSERT INTO loan VALUES ('B1', 'Chinnakada', 13000.0);
INSERT INTO borrower VALUES ('Smith', 'B1');

INSERT INTO account VALUES (23715046, 'Pattoor', 1789451.46);
INSERT INTO account VALUES (54782069, 'Peroorkada', 54213.67);
INSERT INTO account VALUES (78400656, 'Chinnakada', 213654.97);
INSERT INTO account VALUES (23050047, 'Chinnakada', 5412369.21);
INSERT INTO account VALUES (10032478, 'Vyttila', 97215.34);
INSERT INTO account VALUES (55400871, 'Vyttila', 3456.21);

INSERT INTO depositor VALUES ('Jake', 23715046);
INSERT INTO depositor VALUES ('Ronald', 54782069);
INSERT INTO depositor VALUES ('Smith', 78400656);
INSERT INTO depositor VALUES ('Neethu', 23050047);
INSERT INTO depositor VALUES ('Raju', 10032478);
INSERT INTO depositor VALUES ('Basha', 55400871);

SELECT customer_name from customer where customer_name not in (select customer_name from borrower);

SELECT customer_name from customer where customer_street = (SELECT distinct(customer_street) from customer where customer_street 
in(SELECT customer_street from customer where customer_name = 'Smith')) and
customer_city = (SELECT distinct (customer_city) from customer where customer_city in
(SELECT customer_city from customer where customer_name = 'Smith'))
and customer_name <> 'Smith';

SELECT account.branch_name
  FROM customer
  INNER JOIN depositor
  ON customer.customer_name = depositor.customer_name
  INNER JOIN account
  ON depositor.account_number = account.account_number 
  where customer_street = 'Harrison';
