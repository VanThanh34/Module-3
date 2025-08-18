create database cinema;
use cinema;

create table movies(
movie_id int auto_increment,
movie_name varchar(200) not null,
movie_genre varchar(50) not null,
movie_duration int not null,
movie_date date not null,
primary key(movie_id)
);

create table rooms(
room_id int auto_increment,
room_name varchar(10) not null,
room_capacity int not null,
primary key(room_id)
);

create table showtimes(
showtime_id int auto_increment,
movie_id int,
room_id int,
showtime_start_time datetime not null,
showtime_price decimal not null,
primary key(showtime_id),
foreign key(movie_id) references movies(movie_id),
foreign key(room_id) references rooms(room_id)
);

create table customers(
customer_id int auto_increment,
customer_name varchar(100) not null,
primary key(customer_id)
);

create table phone(
phone_id int auto_increment,
customer_id int,
phone_num int not null,
primary key(phone_id),
foreign key(customer_id) references customers(customer_id)
);

create table tickets(
ticket_id int auto_increment,
customer_id int,
showtime_id int,
ticket_seat varchar(10) not null,
ticket_booking_date datetime not null,
primary key(ticket_id),
foreign key(customer_id) references customers(customer_id),
foreign key(showtime_id) references showtimes(showtime_id)
);