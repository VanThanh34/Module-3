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
 insert into classes (name) value ("Tâm");
 insert into classes (name) value ("Bảo");
 insert into teachers (name_teacher, age, country) value ("HảiTT", 27, "Quảng Nam");
 insert into teachers (name_teacher, age, country) value ("ThànhVV", 23, "Quảng Trị");
 insert into teachers (name_teacher, age, country) value ("TâmLV", 21, "Thanh Hoá");
 
 delete from classes where id = 3;
 update teachers set name_teacher = "BảoV" where id_teacher = 3; 