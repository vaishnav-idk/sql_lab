create database productsales;
use productsales;

create table product(pdtid varchar(20) primary key,
pname varchar(20),
price numeric(10,2),
qtyinstock int);

create table sale(saleid varchar(20) primary key,
deliveryaddress varchar(150));

create table saleitem(pdtid varchar(20),
saleid varchar(20),
qty int , primary key(pdtid,saleid),
    foreign key(pdtid) references product(pdtid),
    foreign key(saleid) references sale(saleid));
  
desc product;
desc sale;
desc saleitem;

DELIMITER //
CREATE TRIGGER updateAvailableQuantity AFTER INSERT
ON saleitem
FOR EACH ROW
begin
	UPDATE product , saleitem
    set product.qtyinstock = product.qtyinstock - saleitem.qty 
    where saleitem.pdtid = product.pdtid ;
END //
DELIMITER ;

INSERT INTO `product`(`pdtid`, `pname`, `price`, `qtyinstock`) VALUES ('1','pencil',10.0,500);
INSERT INTO `product`(`pdtid`, `pname`, `price`, `qtyinstock`) VALUES ('2','pen',15.0,1000);

INSERT INTO `sale`(`saleid`, `deliveryaddress`) VALUES ('1a','Trivandrum');
INSERT INTO `sale`(`saleid`, `deliveryaddress`) VALUES ('1b','Kollam');

INSERT INTO `saleitem`(`pdtid`, `saleid`, `qty`) VALUES ('1','1a',10);
INSERT INTO `saleitem`(`pdtid`, `saleid`, `qty`) VALUES ('2','1b',30);

select * from product;
select * from sale;
select * from saleitem;
