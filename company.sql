create database companies;
use companies;

create table jobs(job_id varchar(20) primary key, job_title varchar(40), 
min_salary numeric(10,3), max_salary numeric(10,3));

create table employees(employee_id varchar(20) primary key, first_name varchar(20),
last_name varchar(20), email varchar(40), phone_number varchar(20), hire_date date, job_id varchar(20),
salary numeric(10,3), manager_id varchar(20), department_id varchar(20));

create table dependents(
dependent_id varchar(20) primary key,
first_name varchar(20),
last_name varchar(20),
relationship varchar(20),
employee_id varchar(20));

create table departments(
department_id varchar(20) primary key,
department_name varchar(20),
location_id varchar(20));

create table regions
(region_id varchar(20) primary key,
region_name varchar(30));

create table countries
(country_id varchar(20) primary key,
country_name varchar(35),
region_id varchar(20));

create table locations
(location_id varchar(20) primary key,
street_address varchar(40),
postal_code varchar(20),
city varchar(20),
state_province varchar(20),
country_id varchar(20));

alter table employees add foreign key(job_id) references jobs(job_id);
alter table employees add foreign key(department_id) references departments(department_id);
alter table dependents add foreign key(employee_id) references employees(employee_id);
alter table departments add foreign key(location_id) references locations(location_id);
alter table locations add foreign key(country_id) references countries(country_id);
alter table countries add foreign key(region_id) references regions(region_id);


/*Data for the table regions */

INSERT INTO regions(region_id,region_name) VALUES 
(1,'Europe'),(2,'Americas'),(3,'Asia'),(4,'Middle East and Africa');

/*Data for the table countries */

INSERT INTO countries(country_id,country_name,region_id) VALUES
('AR','Argentina',2),('AU','Australia',3),('BE','Belgium',1),
('BR','Brazil',2),('CA','Canada',2),('CH','Switzerland',1),
('CN','China',3),('DE','Germany',1),('DK','Denmark',1),
('EG','Egypt',4),('FR','France',1),('HK','HongKong',3),
('IL','Israel',4),('IN','India',3),('I7','Italy', 1),
('JP','Japan',3),('KW','Kuwait',4),('MX','Mexico',2),
('NG','Nigeria',4),('NL','Netherlands',1),('SG','Singapore',3),
('UK','United Kingdom', 1),('US','United States of America',2),
('ZM','Zambia',4),('ZW','Zimbabwe', 4);

/*Data for the table locations */

INSERT INTO
locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake’',' Texas','US'), 
(1500,'2011 Interiors Blvd','99236','South San Francisco','California','US'),
(1700,'2004 Charade Rd','98199','Seattle','Washington','US'),
(1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA'),
(2400,'8204 Arthur St',NULL,'London',NULL,'UK'),
(2500,'Magdalen Centre, The Oxford Science Park','OX997B','Oxford','Oxford','UK'),
(2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');

/*Data for the table jobs */

INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES 
(1,'Public Accountant',4200.00,9000.00),
(2,' Accounting Manager',8200.00,16000.00),
(3,'Administration Assistant',3000.00,6000.00),
(4,'President',20000.00,40000.00),
(5,'Administration Vice President', 15000.00,30000.00),
(6,'Accountant',4200.00,9000.00),
(7,'Finance Manager',8200.00,16000.00),
(8,'Human Resources Representative', 4000.00,9000.00),
(9,'Programmer',4000.00,10000.00),
(10,'Marketing Manager',9000.00,15000.00),
(11,'Marketing Representative',4000.00,9000.00),
(12,'Public Relations Representative',4500.00,10500.00),
(13,'Purchasing Clerk',2500.00,5500.00),
(14,'Purchasing Manager',8000.00,15000.00),
(15,'Sales Manager',10000.00,20000.00),
(16,'Sales Representative',6000.00,12000.00),
(17,'Shipping Clerk',2500.00,5500.00),
(18,'Stock Clerk',2000.00,5000.00),
(19,'Stock Manager',5500.00,8500.00);
/*Data for the table departments */

INSERT INTO departments(department_id,department_name,location_id)
VALUES (1,'Administration',1700),(2,'Marketing',1800),(3,'Purchasing', 1700),(4,'Human Resources', 2400),(5,'Shipping',1500),(6,'IT',1400),
(7,'Public Relations', 2700),(8,'Sales',2500),(9,'Executive', 1700),(10,'Finance',1700),(11,'Accounting', 1700);
/*Data for the table employees */

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES
(100,'Steven','King','steven.king@sqltutorial.org','5151234567','1987-06-17',4,24000.00,NULL,9),
(101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','5151234568','1989-09-21',5,17000.00,100,9),
(102,'Lex','De Haan','lex.de haan@sgltutorial.org','5151234569','1993-01-13',5,17000.00,100,9),
(103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','5904234567','1990-01-03',9,9000.00,102,6),
(104,'Bruce','Ernst','bruce.ernst@sgltutorial.org','5904234568','1991-05-21',9,6000.00,103,6),
(105,'David','Austin','david.austin@sqltutorial.org','5904234569','1997-06-25',9,4800.00,103,6),
(106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','5904234560','1998-02-05',9,4800.00,103,6),
(107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','5904235567','1999-02-07',9,4200.00,103,6),
(108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','5151244569','1994-08-17',7,12000.00,101,10),
(109,'Daniel','Faviet','daniel.faviet @sqltutorial.org','5151244169','1994-08-16',6,9000.00,108,10),
(110,'John','Chen','john.chen@sqltutorial.org','5151244269','1997-09-28',6,8200.00,108,10),
(111,'1smael','Sciarra','ismael.sciarra@sqltutorial.org','5151244369','1997-09-30',6,7700.00,108,10),
(112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','5151244469','1998-03-07',6,7800.00,108,10),
(113,'Luis','Popp','luis.popp@sgltutorial.org','5151244567','1999-12-07',6,6500.00,108,10); 

/*Data for the table dependents */

INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES 
(1,'Penelope','Gietz','Child',103),
(2,'Nick','Higgins','Child',104),
(3,'Ed','Whalen','Child',105),
(4,'Jennifer','King','Child',100),
(5,'Johnny','Kochhar','Child',101),
(6,'Bette','De Haan','Child', 102),
(7,'Grace','Faviet','Child',109),
(8,'Matthew','Chen','Child',110),
(9,'Joe','Sciarra','Child', 111),
(10,'Christian','Urman','Child',112);

select * from employees;
select * from dependents;
select * from jobs;

RENAME TABLE departments TO dept;
ALTER TABLE employees ADD COLUMN commission int;
ALTER TABLE employees modify salary smallint;
