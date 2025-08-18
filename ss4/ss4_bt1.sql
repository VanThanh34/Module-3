create database module3_ss4_bt1;
use module3_ss4_bt1;

create table classes(
    class_id int auto_increment,
    class_name varchar(10),
    class_date_start date not null,
    class_credit int,
    primary key(class_id)
);

create table students(
    class_id int ,
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

create table phones(
    phone_id int auto_increment,
    teacher_id int default null,
    student_id int default null,
    phone_num varchar(15) unique,
    primary key(phone_id),
    foreign key(teacher_id) references teachers(teacher_id),
    foreign key(student_id) references students(student_id)
);

create table accounts(
    teacher_id int unique default null,
    student_id int unique default null,
    account_id int auto_increment,
    user_name varchar(50) not null,
    pass_word varchar(50) not null,
    primary key(account_id),
    foreign key(teacher_id) references teachers(teacher_id),
    foreign key(student_id) references students(student_id)
);

create table modules(
    module_id int auto_increment,
    module_name varchar(50) not null,
    primary key(module_id)
);

create table points(
    student_id int,
    point_id int auto_increment,
    module_id int,
    score int not null,
    primary key(student_id, module_id),
    unique(point_id),
    foreign key(student_id) references students(student_id),
    foreign key(module_id) references modules(module_id)
);

-- Thêm dữ liệu
insert into classes (class_name, class_date_start, class_credit) value ("C0325",'2025-03-15',2);
insert into classes (class_name, class_date_start, class_credit) value ("C0525",'2025-05-15',3);
insert into classes (class_name, class_date_start, class_credit) value ("C0625",'2025-06-15',4);
insert into classes (class_name, class_date_start, class_credit) value ("C0825",'2025-12-15',5);
insert into classes (class_name, class_date_start, class_credit) value ("C0925",'2025-12-30',6);

insert into students (class_id, student_name, student_dob) value (2,"Thành", "2002-04-13");
insert into students (class_id, student_name, student_dob) value (1,"Hà", "2000-02-29");
insert into students (class_id, student_name, student_dob) value (1,"Hùng", "2000-02-29");
insert into students (class_id, student_name, student_dob) value (3,"Nghiêm", "1994-02-13");
insert into students (class_id, student_name, student_dob) value (3,"Tiến", "1995-02-13");
insert into students (class_id, student_name, student_dob) value (2,"Toàn", "1995-02-13");
insert into students (class_id, student_name, student_dob) value (null,"Nhật", "1999-02-13");

insert into teachers (teacher_name) value ("HảiTT");
insert into teachers (teacher_name) value ("ChánhTV");

insert into accounts(student_id, user_name, pass_word) value (2, "bin13", "1304");
insert into accounts(student_id, user_name, pass_word) value (3, "ha123", "1234");
insert into accounts(student_id, user_name, pass_word) value (4, "nghiem123", "1234");
insert into accounts(teacher_id, user_name, pass_word) value (1, "hai123", "1234");
insert into accounts(teacher_id, user_name, pass_word) value (2, "chanh123", "1234");

insert into phones (teacher_id, phone_num) value(1, '123456789');
insert into phones (teacher_id, phone_num) value(1, '123456000');
insert into phones (teacher_id, phone_num) value(2, '456456789');
insert into phones (student_id, phone_num) value(2, '0823822567');
insert into phones (student_id, phone_num) value(2, '0823822789');
insert into phones (student_id, phone_num) value(4, '0823123456');
insert into phones (student_id, phone_num) value(5, '0823987654');

insert into teacher_class value (1,1);
insert into teacher_class value (1,2);
insert into teacher_class value (2,2);
insert into teacher_class value (2,3);

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

-- Hiển thị tất cả các thông tin lớp học có credit lớn nhất
select * from classes where class_credit = ( select max(class_credit) from classes);

-- Hiển thị các thông tin module có điểm thi lớn nhất
select m.module_id, m.module_name, p.score 
from modules m
join points p 
on m.module_id = p. module_id
where p.score = (select max(score) from points);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.student_id, s.student_name, avg(p.score) as avg_score
from students s
join points p
on s.student_id = p.student_id
group by s.student_id, s.student_name
order by avg_score desc;