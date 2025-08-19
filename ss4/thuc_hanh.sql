create database module3_ss4_thuc_hanh;
use module3_ss4_thuc_hanh;

create table classes(
class_id int auto_increment primary key,
class_name varchar(60) not null,
class_start_date date not null,
class_status bit
);

alter table students modify student_status varchar(50);
create table students(
student_id int auto_increment primary key,
student_name varchar(30) not null,
student_address varchar(50),
student_status bit,
class_id int not null,
foreign key(class_id) references classes(class_id)
);

create table phones(
phone_id int auto_increment primary key,
student_id int not null,
phone_num varchar(20),
foreign key(student_id) references students(student_id)
);

create table subjects(
sub_id int auto_increment primary key,
sub_name varchar(30) not null,
sub_credit tinyint not null default 1 check(sub_credit >=1),
sub_status bit default 1
);


create table marks(
mark_id int auto_increment primary key,
sub_id int not null,
student_id int not null,
mark float default 0 check(mark between 0 and 100),
exam_times tinyint default 1,
unique(sub_id, student_id),
foreign key(sub_id) references subjects(sub_id),
foreign key(student_id) references students(student_id)
);

insert into classes (class_name, class_start_date, class_status) values
('C0325', '2025-03-25', 1),
('C0425', '2025-04-25', 1),
('C0525', '2025-05-25', 0);
select * from classes;
insert into students (student_name, student_address, student_status, class_id) values
('Thanh Hà','Nha Trang','Đang học', 1),
('Trí Đông','Kon Tum','Đang học', 2),
('Trung Chiến','Đà Nẵng','Đang học', 2),
('Văn Thành','Quảng Trị','Đang học', 3),
('Văn Tịnh','Quảng Nôm','Đang học', 3),
('Văn Tâm','Thanh Hoá','Đang học', 3),
('Long Nhật','Thanh Hoá','Nghỉ học', 3);
insert into students (student_name, student_address, student_status, class_id) values
('Trí Đông','Kon Tum','Đang học', 2),
('Trung Chiến','Đà Nẵng','Đang học', 2);
select * from students;

insert into phones (student_id, phone_num) values
(1, '0912345678'),
(2, '0987654321'),
(2, '0823822567'),
(3, '0933333333'),
(5, '0977777777');

insert into subjects (sub_name, sub_credit, sub_status) values
('Lý thuyết', 3, 1),
('Thực hành', 2, 1),
('Audit', 5, 1);

insert into marks (sub_id, student_id, mark, exam_times) values
(1, 1, 88, 1),
(2, 1, 97, 1),
(3, 1, 95, 2),

(1, 2, 62, 1),
(2, 2, 70, 1),
(3, 2, 80, 1),

(1, 3, 68, 1),
(2, 3, 20, 1),
(3, 3, 70, 2),

(1, 4, 76, 1),
(2, 4, 70, 1),
(3, 4, 70, 1),

(1, 5, 52, 1),
(2, 5, 50, 1),
(3, 5, 70, 1);

insert into marks (sub_id, student_id, mark, exam_times) values
(1, 6, 64, 1),
(2, 6, 70, 1),
(3, 6, 70, 2),

(1, 7, 68, 1),
(2, 7, 70, 1),
(3, 7, 70, 2);
-- Hiển thị số lượng sinh viên ở từng lớp
select * from students s
join classes c
on s.class_id = c.class_id;

-- Tính điểm trung bình các môn học của học viên
select s.student_id as 'ID học viên', s.student_name as 'Họ tên học viên', avg(m.mark) as 'Điểm trung bình'
from students s 
join marks m
on s.student_id = m.student_id
group by s.student_id, s.student_name
order by `Điểm trung bình` desc;

-- Hiển thị thông tin học viên có điểm trung bình lớn nhất
select s.student_id as 'ID học viên', s.student_name as 'Họ tên học viên', avg(m.mark) as 'Điểm trung bình'
from students s 
join marks m 
on s.student_id = m.student_id 
group by s.student_id, s.student_name
having avg(m.mark) = (
    select max(avg_mark)
    from (
        select avg(m2.mark) as avg_mark
        from marks m2
        group by m2.student_id
    ) as tb
);
