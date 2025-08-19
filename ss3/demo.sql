create database if not exists module3_ss3_demo;
use module3_ss3_demo;
alter table classes add column class_date_start date;
alter table classes add column class_credit int not null;
create table classes(
class_id int auto_increment,
class_name varchar(10),
primary key(class_id)
);

alter table students modify class_id int;
create table students(
class_id int not null,
student_id int auto_increment,
student_name varchar(50) not null,
student_dob date not null,
primary key(student_id),
foreign key(class_id) references classes(class_id)
);


create table teachers(
teacher_id int auto_increment,
teacher_name varchar(50),
primary key(teacher_id)
);

create table teacher_class(
teacher_id int,
class_id int,
primary key(teacher_id, class_id),
foreign key(teacher_id) references teachers(teacher_id),
foreign key(class_id) references classes(class_id)
);

drop table student_phone;
drop table teacher_phone;
alter table phone rename to phones;
drop table phones;
alter table phones modify teacher_id int default null;
alter table phones modify student_id int default null;
create table phones(
phone_id int auto_increment,
teacher_id int default null,
student_id int default null,
phone_num int,
primary key(phone_id, phone_num),
foreign key(teacher_id) references teachers(teacher_id),
foreign key(student_id) references students(student_id)
);


create table accounts(
teacher_id int unique default null,
student_id int unique default null,
account_id int auto_increment unique,
user_name varchar(50) not null,
pass_word varchar(50) not null,
primary key(account_id),
foreign key(teacher_id) references teachers(teacher_id),
foreign key(student_id) references students(student_id)
);

drop table account;
drop table teacher_account;
drop table student_account;
-- alter table modules rename column module_score to module_name;
-- alter table modules modify module_name varchar(50) not null;
create table modules(
module_id int auto_increment,
module_name varchar(50) not null,
primary key(module_id)
);

-- alter table points modify score int not null;
create table points(
student_id int,
point_id int auto_increment unique,
module_id int,
score int not null,
primary key(student_id, module_id),
foreign key(student_id) references students(student_id),
foreign key(module_id) references modules(module_id)
);


insert into classes (class_name) value ("C0325");
insert into classes (class_name) value ("C0525");
insert into classes (class_name) value ("C0625");
insert into classes (class_name) value ("C0825");
insert into classes (class_name) value ("C0925");
update classes set class_date_start = '2025-03-15' where class_id = 1;
update classes set class_date_start = '2025-05-15' where class_id = 2;
update classes set class_date_start = '2025-06-15' where class_id = 3;
update classes set class_date_start = '2025-12-15' where class_id = 4;
update classes set class_date_start = '2025-12-30' where class_id = 5;
update classes set class_credit = 2 where class_id = 1;
update classes set class_credit = 3 where class_id = 2;
update classes set class_credit = 4 where class_id = 3;
update classes set class_credit = 5 where class_id = 4;
update classes set class_credit = 6 where class_id = 5;
-- Xoá toàn bộ dữ liệu, reset auto_increment về lại 1
-- TRUNCATE TABLE students;
insert into students (class_id, student_name, student_dob) value (2,"Thành", "2002-04-13");
insert into students (class_id, student_name, student_dob) value (1,"Hà", "2000-02-29");
insert into students (class_id, student_name, student_dob) value (1,"Hùng", "2000-02-29");
insert into students (class_id, student_name, student_dob) value (3,"Nghiêm", "1994-02-13");
insert into students (class_id, student_name, student_dob) value (3,"Tiến", "1995-02-13");
insert into students (class_id, student_name, student_dob) value (2,"Toàn", "1995-02-13");
insert into students (class_id, student_name, student_dob) value (null,"Nhật", "1999-02-13");
select * from students;

insert into accounts(student_id, user_name, pass_word) value (2, "bin13", "1304");
insert into accounts(student_id, user_name, pass_word) value (3, "ha123", "1234");
insert into accounts(student_id, user_name, pass_word) value (4, "nghiem123", "1234");
insert into accounts(teacher_id, user_name, pass_word) value (1, "hai123", "1234");
insert into accounts(teacher_id, user_name, pass_word) value (2, "chanh123", "1234");



insert into teachers (teacher_name) value ("HảiTT");
insert into teachers (teacher_name) value ("ChánhTV");

insert into phones (teacher_id, phone_num) value(1, 123456789);
insert into phones (teacher_id, phone_num) value(1, 123456000);
insert into phones (teacher_id, phone_num) value(2, 456456789);
insert into phones (student_id, phone_num) value(2, 0823822567);
insert into phones (student_id, phone_num) value(2, 0823822789);
insert into phones (student_id, phone_num) value(4, 0823123456);
insert into phones (student_id, phone_num) value(5, 0823987654);



insert into teacher_class value (1,1);
insert into teacher_class value (1,2);
insert into teacher_class value (2,2);
insert into teacher_class value (2,3);

insert into teacher_account (teacher_id) value (1);
insert into teacher_account (teacher_id) value (2);

insert into modules (module_name) value ("MD1");
insert into modules (module_name) value ("MD2");
insert into modules (module_name) value ("MD3");
insert into modules (module_name) value ("MD4");
insert into modules (module_name) value ("MD5");
insert into modules (module_name) value ("MD6");

insert into points (student_id, module_id, score) value (2, 3, 80);
insert into points (student_id, module_id, score) value (1, 3, 90);
insert into points (student_id, module_id, score) value (3, 4, 95);
insert into points (student_id, module_id, score) value (4, 2, 80);
insert into points (student_id, module_id, score) value (5, 3, 85);

-- Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào và loại trừ những học viên chưa được xếp lớp
select s.student_id, s.student_name, c.class_name
from students s
join classes c on s.class_id = c.class_id;

-- Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào và bao gồm những học viên chưa được xếp lớp
select s.student_id, s.student_name, c.class_name
from students s
left join classes c on s.class_id = c.class_id;

-- Lấy thông tin của các học viên tên ‘Tien’ và ‘Toan’
select * from students where student_name in ('Tiến', 'Toàn');

-- Lấy ra số lượng học viên của từng lớp
select c.class_id, c.class_name, COUNT(s.student_id) as total_students
from classes c
left join students s on c.class_id = s.class_id
group by c.class_id, c.class_name;

-- Lấy ra danh sách học viên và sắp xếp tên theo alphabet
select student_id, student_name, student_dob, class_id
from students
order by student_name asc;

-- Lấy ra danh sách học viên và điểm trung bình
select c.class_id, c.class_name,  avg(p.score) as avg_class
from classes c
join students s
  on s.class_id = c.class_id
join points p
  on s.student_id = p.student_id
group by c.class_id, c.class_name;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from students where student_name like 'h%';

select * from students;
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from classes where class_date_start like '_____12___';

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from classes where class_credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update students set class_id = 2 where student_name = "Hùng";

-- Hiển thị các thông tin: student_id, student_name, score. Dữ liệu sắp xếp dựa theo điểm thi, nếu trùng thì sắp xếp theo tên tăng dần
select s.student_id, s.student_name, p.score
from students s 
join points p
where s.student_id = p.student_id
order by score desc, student_name asc;

