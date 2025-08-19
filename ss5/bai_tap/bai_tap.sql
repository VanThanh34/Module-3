create database module3_ss5_bai_tap;
use module3_ss5_bai_tap;

create table products(
id int auto_increment primary key,
product_code varchar(50) unique not null,
product_name varchar(50) not null,
product_price double(10,2) not null,
product_amount int not null,
product_description varchar(50) null,
product_status bit
);
INSERT INTO Products (product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES
('P001', 'iPhone 15',      25000000, 10, 'Điện thoại Apple mới nhất', 1),
('P002', 'Samsung S24',    22000000, 15, 'Điện thoại Samsung cao cấp', 1),
('P003', 'Xiaomi Redmi 13', 7500000, 25, NULL, 1),
('P004', 'Dell XPS 13',    32000000, 5, 'Laptop văn phòng cao cấp', 1),
('P005', 'Asus TUF Gaming',28000000, 7, 'Laptop gaming giá tốt', 1),
('P006', 'Tai nghe Sony WH-1000XM5', 8500000, 20, NULL, 1),
('P007', 'Chuột Logitech G Pro', 1200000, 30, 'Chuột gaming không dây', 1),
('P008', 'MacBook Air M2', 28000000, 12, 'Laptop Apple mỏng nhẹ', 1),
('P009', 'Apple Watch S9', 11000000, 18, 'Đồng hồ thông minh Apple', 1),
('P010', 'Máy in Canon LBP2900', 3500000, 8, NULL, 0);


-- Tạo unique index
create unique index idx_product_code on products(product_code);
explain select product_code from products;

-- Tạo composite index
create index idx_product_name_price on products(product_name, product_price);
explain select * from products where product_name = 'iPhone 15';

select * from products where product_name = 'iPhone 15';
select * from products where product_code = 'P002';

-- Tạo view
create view product_view as
select product_code, product_name, product_price, product_status 
from products;

select * from product_view;

-- Sửa view
create or replace view product_view  as
select product_code, product_name
from products
where product_code in ('P001', 'P002');
select * from product_view;

-- Xoá view 
drop view product_view;

-- Tạo SP lấy hết thông tin
delimiter $$
create procedure find_all_product()
begin 
select * from products;
end $$
delimiter ;

call find_all_product();

-- Tạo SP thêm 1 sản phẩm
delimiter $$
create procedure add_product(
in prod_code varchar(50),
in prod_name varchar(50),
in prod_price double(10,2),
in prod_amount int ,
in prod_des varchar(50),
in prod_status bit )
begin 
insert into products(product_code, product_name, product_price, product_amount, product_description, product_status) 
values (prod_code, prod_name, prod_price, prod_amount, prod_des, prod_status);
end $$
delimiter ;

call add_product('P011', 'iPhone14', 22000000, 15, null, 1);
select * from products;

-- Tạo SP sửa thông tin sản phẩm theo id
delimiter $$
create procedure update_prod_by_id(
in prod_id int,
in prod_code varchar(50),
in prod_name varchar(50),
in prod_price double(10,2),
in prod_amount int ,
in prod_des varchar(50),
in prod_status bit 
)
begin
update products set product_code = prod_code, 
product_name = prod_name ,
product_price = prod_price ,
product_amount = prod_amount ,
product_description = prod_des ,
product_status = prod_status 
where id = prod_id;
end $$
delimiter ;
drop procedure update_prod_by_id;
call update_prod_by_id(1, 'P100', 'iPhone16', 35000000, 7, 'Điện thoại VIP nhất', 1);
select * from products where id = 1;

-- Tạo SP xoá sản phẩm theo id
delimiter $$
create procedure delete_prod_by_id(in prod_id int)
begin 
delete from products where id = prod_id;
end $$
delimiter ;
call delete_prod_by_id(11);
select * from products;