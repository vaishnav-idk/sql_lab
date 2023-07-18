create database store;
use store;

create table product(pdtid varchar(20) primary key,
pname varchar(20),
price numeric(10,2),
qtyinstock int);

DELIMITER //
create procedure insertproduct(
	in pdt_id varchar(20), 
	in p_name varchar(20),
    in p_price numeric(10,2),
    in quantity int)
begin
IF quantity > 0 then
INSERT INTO product (pdtid,pname,price,qtyinstock) VALUES (pdt_id,p_name,p_price,quantity) ;
END IF;
end //
DELIMITER ;

truncate table product;
CALL insertproduct('123','Pen',10.33,500);
CALL insertproduct('124','Pencil',5,0);

select * from product;
