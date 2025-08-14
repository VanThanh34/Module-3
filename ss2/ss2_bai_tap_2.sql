create database module3_ss2_bt2;
use module3_ss2_bt2;

create table customers(
customer_id int auto_increment,
customer_name varchar(50) not null,
customer_age int not null,
primary key (customer_id)
);

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

insert into customers (customer_name, customer_age) value ("Thành", 23);
insert into customers (customer_name, customer_age) value ("Tâm", 21);
insert into customers (customer_name, customer_age) value ("Bảo", 26);

select * from customers where customer_name like ('t%');