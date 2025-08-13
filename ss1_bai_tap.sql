use module_3;

create table class(
id int auto_increment,
name varchar(100) not null,
primary key (id)
);

create table teachers(
id int auto_increment,
name_teacher varchar(100) not null,
age int not null,
country varchar(100) not null,
primary key (id)
);

insert into teachers (name_teacher, age, country) value ("HaiTT", 27, "Quảng Nam");