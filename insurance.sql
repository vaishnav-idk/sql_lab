create database insurance;

use insurance;

create table person(driverid varchar(10) primary key, name varchar(25),address varchar(100));
create table car(license varchar(20) primary key, model varchar(25),year int);
create table accident(report_no varchar(10) primary key, date date,location varchar(100));
create table owns(driverid varchar(10),license varchar(20),primary key(driverid,license));   
create table participates(report_no varchar(10),license varchar(20),driverid varchar(10), damageamount int(15),primary key(report_no,license));

alter table owns add foreign key(driverid) references person(driverid);
alter table owns add foreign key(license) references car(license);
alter table participates add foreign key(report_no) references accident(report_no);
alter table participates add foreign key(license) references car(license);
alter table participates add foreign key(driverid) references person(driverid);
    
RENAME TABLE car TO vehicle;
ALTER TABLE person ADD COLUMN gender varchar(6);
ALTER TABLE accident DROP COLUMN location;
ALTER TABLE accident change report_no  report_number varchar(10);
ALTER TABLE participates modify damageamount numeric(15,5);

desc person;
INSERT INTO `person` (`driverid`, `name`, `address`, `gender`) VALUES ('1', 'Ram', 'Hyderabad, Telangana', 'M');
INSERT INTO `person` (`driverid`, `name`, `address`, `gender`) VALUES ('2', 'Davis', 'San Francisco, California', 'M');
INSERT INTO `person` (`driverid`, `name`, `address`, `gender`) VALUES ('3', 'Ivan', 'St. Petersburg, Russia', 'M');
INSERT INTO `person` (`driverid`, `name`, `address`, `gender`) VALUES ('4', 'Jane', 'Sydney, New South Wales', 'F');
INSERT INTO `person` (`driverid`, `name`, `address`, `gender`) VALUES ('5', 'Devi', 'Bengaluru, Karnataka', 'F');

INSERT INTO `vehicle` (`license`, `model`, `year`) VALUES ('1A','Mercedes','2017');
INSERT INTO `vehicle` (`license`, `model`, `year`) VALUES ('1B','Cadillac','2013');
INSERT INTO `vehicle` (`license`, `model`, `year`) VALUES ('1C','Ferrari','2012');
INSERT INTO `vehicle` (`license`, `model`, `year`) VALUES ('1D','BMW','2020');
INSERT INTO `vehicle` (`license`, `model`, `year`) VALUES ('1E','Audi','2022');

INSERT INTO `accident`(`report_number`, `date`) VALUES ('HYD2745189','02-08-2018');
INSERT INTO `accident`(`report_number`, `date`) VALUES ('SF54713600','23-01-2016');
INSERT INTO `accident`(`report_number`, `date`) VALUES ('STP3941784','07-10-2020');
INSERT INTO `accident`(`report_number`, `date`) VALUES ('SYD78103460','20-03-2022');
INSERT INTO `accident`(`report_number`, `date`) VALUES ('BLR6657418','05-07-2021');

INSERT INTO `owns`(`driverid`, `license`) VALUES ('1','1A');
INSERT INTO `owns`(`driverid`, `license`) VALUES ('2','1B');
INSERT INTO `owns`(`driverid`, `license`) VALUES ('3','1C');
INSERT INTO `owns`(`driverid`, `license`) VALUES ('4','1D');
INSERT INTO `owns`(`driverid`, `license`) VALUES ('5','1E');

INSERT INTO `participates`(`report_no`, `license`, `driverid`, `damageamount`) VALUES ('SF48627890','1B','2',547892.87);

select * from person where name like 'a%';

select * from participates where damageamount > 10000;

select * from accident where date between '2021-01-01' and '2023-12-31';
