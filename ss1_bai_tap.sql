use module_3_ss1;

create table classes(
id int auto_increment,
name varchar(100) not null,
primary key (id)
);

create table teachers(
id_teacher int auto_increment,
name_teacher varchar(100) not null,
age int not null,
country varchar(100) not null,
primary key(id_teacher)
);
 insert into classes (name) value ("Thành");
 insert into teachers (name_teacher, age, country) value ("HảiTT", 27, "Quảng Nam");