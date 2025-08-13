create database module_3;
use module_3;

create table students(
id int auto_increment,
name_student varchar(100) not null,
date_create datetime default now(),
primary key(id)
);

insert into students value (1, "Thành","2025-08-13");
insert into students (name_student) value ("Tâm"),("Bảo");
insert into students (name_student) value ("Hải");

