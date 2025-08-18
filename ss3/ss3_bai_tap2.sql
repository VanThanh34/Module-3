create database module3_ss3_bt2;
use module3_ss3_bt2;

create table customers(
customer_id int auto_increment,
customer_name varchar(50) not null,
customer_age int not null,
primary key (customer_id)
);

alter table orders modify order_total_price double;
alter table orders modify order_date date;
create table orders(
order_id int auto_increment,
customer_id int,
order_date datetime default now(),
order_total_price double not null,
primary key(order_id),
foreign key(customer_id) references customers(customer_id)
);

create table products(
product_id int auto_increment,
product_name varchar(50) not null,
product_price double not null,
primary key(product_id)
);

create table order_detail(
order_id int not null,
product_id int not null,
order_quantity int not null,
primary key(order_id, product_id),
foreign key(order_id) references orders(order_id),
foreign key(product_id) references products(product_id)
);

insert into customers (customer_name, customer_age) value ('Minh Quan', 10);
insert into customers (customer_name, customer_age) value ('Ngoc Oanh', 20);
insert into customers (customer_name, customer_age) value ('Hong Ha', 50);
select * from customers;
insert into orders (customer_id, order_date, order_total_price) value (1, '2006-3-21', null);
insert into orders (customer_id, order_date, order_total_price) value (2, '2006-3-23', null);
insert into orders (customer_id, order_date, order_total_price) value (1, '2006-3-16', null);
select * from orders;
insert into products (product_name, product_price) value ("May Giat", 3);
insert into products (product_name, product_price) value ("Tu Lanh", 5);
insert into products (product_name, product_price) value ("Dieu Hoa", 7);
insert into products (product_name, product_price) value ("Quat", 1);
insert into products (product_name, product_price) value ("Bep Dien", 2);
select * from products;
insert into order_detail (order_id, product_id, order_quantity) value (1,1,3);
insert into order_detail (order_id, product_id, order_quantity) value (1,3,7);
insert into order_detail (order_id, product_id, order_quantity) value (1,4,2);
insert into order_detail (order_id, product_id, order_quantity) value (2,1,1);
insert into order_detail (order_id, product_id, order_quantity) value (3,1,8);
insert into order_detail (order_id, product_id, order_quantity) value (2,5,4);
insert into order_detail (order_id, product_id, order_quantity) value (2,3,3);
select * from order_detail;
-- Hiển thị thông tin gồm order_id, order_date, order_total_price của tất cả các hoá đơn trong bảng Order
select order_id, order_date, order_total_price 
from orders;

-- Hiển thị danh sách các khách hàng đã mua hàng và danh sách sản phẩm được mua bởi các khách
select c.customer_name, o.order_id, p.product_id, p.product_name
from customers c
join orders o
on c.customer_id = o.customer_id
join order_detail od
on o.order_id = od.order_id
join products p
on od.product_id = p.product_id;

-- Hiển thị danh sách khách hàng không mua bất kì sản phẩm nào
select c.customer_name, o.order_id
from customers c
left join orders o
on c.customer_id = o.customer_id
where o.order_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
select o.order_id, o.order_date, sum(od.order_quantity*p.product_price) as order_total_price
from orders o
join order_detail od
on o.order_id = od.order_id
join products p
on od.product_id = p.product_id
group by o.order_id, o.order_date;

