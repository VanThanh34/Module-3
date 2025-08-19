create database quan_ly_khu_nghi_duong;
use quan_ly_khu_nghi_duong;

create table vi_tri(
vi_tri_id int auto_increment,
vi_tri_name varchar(45),
primary key(vi_tri_id)
);

create table trinh_do(
trinh_do_id int auto_increment,
trinh_do varchar(45),
primary key(trinh_do_id)
);

create table bo_phan(
bo_phan_id int auto_increment,
bo_phan_name varchar(45),
primary key(bo_phan_id)
);

create table nhan_vien(
nhan_vien_id int auto_increment primary key,
nhan_vien_name varchar(45),
vi_tri_id int,
trinh_do_id int,
bo_phan_id int,
nhan_vien_dob date not null,
nhan_vien_id_card varchar(12) not null,
nhan_vien_salary double not null,
nhan_vien_phone int not null,
nhan_vien_email varchar(45) not null,
nhan_vien_address varchar(45) not null,
foreign key(vi_tri_id) references vi_tri(vi_tri_id),
foreign key(trinh_do_id) references trinh_do(trinh_do_id),
foreign key(bo_phan_id) references bo_phan(bo_phan_id)
);

create table loai_khach(
loai_khach_id int auto_increment primary key,
loai_khach_name varchar(45) not null
);

create table khach_hang(
khach_hang_id int auto_increment primary key,
loai_khach_id int,
khach_hang_name varchar(45) not null,
khach_hang_dob date not null,
khach_hang_id_card varchar(45) not null,
khach_hang_phone varchar(45) not null,
khach_hang_email varchar(45) not null,
khach_hang_address varchar(45) not null,
foreign key(loai_khach_id) references loai_khach(loai_khach_id)
);

create table kieu_thue(
kieu_thue_id int auto_increment primary key,
kieu_thue_name varchar(45) not null,
kieu_thue_price double not null
);

create table loai_dich_vu(
loai_dich_vu_id int auto_increment primary key,
loai_dich_vu_name varchar(45) not null
);

create table dich_vu(
dich_vu_id int auto_increment primary key,
dich_vu_name varchar(45) not null,
dich_vu_useable_area double not null,
dich_vu_so_tang int not null,
dich_vu_so_nguoi_toi_da int not null,
dich_vu_price double not null,
kieu_thue_id int,
loai_dich_vu_id int,
dich_vu_status varchar(45) not null,
foreign key(kieu_thue_id) references kieu_thue(kieu_thue_id),
foreign key(loai_dich_vu_id) references loai_dich_vu(loai_dich_vu_id)
);

create table hop_dong(
hop_dong_id int auto_increment primary key,
nhan_vien_id int,
khach_hang_id int,
dich_vu_id int,
hop_dong_date_start date not null,
hop_dong_date_end date not null,
hop_dong_tien_dat_coc double not null,
hop_dong_total_price double not null,
foreign key(nhan_vien_id) references nhan_vien(nhan_vien_id),
foreign key(khach_hang_id) references khach_hang(khach_hang_id),
foreign key(dich_vu_id) references dich_vu(dich_vu_id)
);

create table dich_vu_di_kem(
dich_vu_di_kem_id int auto_increment primary key,
dich_vu_di_kem_name varchar(45) not null,
dich_vu_di_kem_price int not null,
dich_vu_di_kem_quantity int not null,
dich_vu_di_kem_status varchar(45)
);

create table hop_dong_chi_tiet(
hop_dong_chi_tiet_id int auto_increment primary key,
hop_dong_id int,
dich_vu_di_kem_id int,
hop_dong_chi_tiet_quantity int not null,
foreign key(hop_dong_id) references hop_dong(hop_dong_id),
foreign key(dich_vu_di_kem_id) references dich_vu_di_kem(dich_vu_di_kem_id)
);


-- 1. Thêm dữ liệu
-- Bảng vi_tri
insert into vi_tri (vi_tri_name) values
('Giám đốc'),
('Quản lý'),
('Nhân viên lễ tân'),
('Nhân viên phục vụ'),
('Nhân viên bảo vệ');

-- Bảng trinh_do
insert into trinh_do (trinh_do) values
('Trung cấp'),
('Cao đẳng'),
('Đại học'),
('Sau đại học');

-- Bảng bo_phan
insert into bo_phan (bo_phan_name) values
('Hành chính'),
('Lễ tân'),
('Phục vụ'),
('An ninh'),
('Quản lý');

-- Bảng nhan_vien
insert into nhan_vien (nhan_vien_name, vi_tri_id, trinh_do_id, bo_phan_id, nhan_vien_dob, nhan_vien_id_card, nhan_vien_salary, nhan_vien_phone, nhan_vien_email, nhan_vien_address)
values
('Nguyễn Văn A', 1, 4, 5, '1980-05-20', '123456789012', 30000000, 912345678, 'vana@gmail.com', 'Hà Nội'),
('Trần Thị B', 2, 3, 5, '1985-08-15', '223456789012', 20000000, 934567891, 'thib@gmail.com', 'Hồ Chí Minh'),
('Lê Văn C', 3, 2, 2, '1990-10-12', '323456789012', 10000000, 945678912, 'vanc@gmail.com', 'Đà Nẵng'),
('Phạm Thị D', 4, 1, 3, '1995-03-18', '423456789012', 8000000, 956789123, 'thid@gmail.com', 'Huế'),
('Hoàng Văn E', 5, 1, 4, '1992-12-05', '523456789012', 7000000, 967891234, 'vane@gmail.com', 'Cần Thơ');

-- Bảng loai_khach
insert into loai_khach (loai_khach_name) values
('Diamond'),
('Platinum'),
('Gold'),
('Silver'),
('Member');

-- Bảng khach_hang
insert into khach_hang (loai_khach_id, khach_hang_name, khach_hang_dob, khach_hang_id_card, khach_hang_phone, khach_hang_email, khach_hang_address)
values
(1, 'Nguyễn Hoàng', '1985-06-15', '012345678901', '0911111111', 'hoang@gmail.com', 'Hà Nội'),
(2, 'Trần Quỳnh', '1990-07-20', '112345678901', '0922222222', 'quynh@gmail.com', 'Hồ Chí Minh'),
(3, 'Lê Minh', '1995-08-25', '212345678901', '0933333333', 'minh@gmail.com', 'Đà Nẵng'),
(4, 'Phạm Lan', '1988-09-30', '312345678901', '0944444444', 'lan@gmail.com', 'Huế'),
(5, 'Hoàng Hạnh', '1992-10-10', '412345678901', '0955555555', 'hanh@gmail.com', 'Cần Thơ');

-- Bảng kieu_thue
insert into kieu_thue (kieu_thue_name, kieu_thue_price) values
('Theo giờ', 50000),
('Theo ngày', 300000),
('Theo tháng', 5000000);

-- Bảng loai_dich_vu
insert into loai_dich_vu (loai_dich_vu_name) values
('Villa'),
('House'),
('Room');

-- Bảng dich_vu
insert into dich_vu (dich_vu_name, dich_vu_useable_area, dich_vu_so_tang, dich_vu_so_nguoi_toi_da, dich_vu_price, kieu_thue_id, loai_dich_vu_id, dich_vu_status)
values
('Villa Hướng Biển', 200, 2, 8, 5000000, 2, 1, 'Còn trống'),
('Villa Sân Vườn', 180, 2, 6, 4500000, 2, 1, 'Còn trống'),
('Nhà Nghỉ A', 100, 1, 4, 2000000, 2, 2, 'Còn trống'),
('Phòng Standard', 30, 1, 2, 500000, 1, 3, 'Còn trống'),
('Phòng Deluxe', 40, 1, 3, 800000, 1, 3, 'Còn trống');

-- Bảng hop_dong
insert into hop_dong (nhan_vien_id, khach_hang_id, dich_vu_id, hop_dong_date_start, hop_dong_date_end, hop_dong_tien_dat_coc, hop_dong_total_price)
values
(1, 1, 1, '2025-08-01', '2025-08-05', 2000000, 15000000),
(2, 2, 2, '2025-08-10', '2025-08-15', 1500000, 12000000),
(3, 3, 4, '2025-08-20', '2025-08-21', 200000, 500000);

-- Bảng dich_vu_di_kem
insert into dich_vu_di_kem (dich_vu_di_kem_name, dich_vu_di_kem_price, dich_vu_di_kem_quantity, dich_vu_di_kem_status)
values
('Thuê xe máy', 150000, 10, 'Còn'),
('Đưa đón sân bay', 500000, 5, 'Còn'),
('BBQ ngoài trời', 1000000, 3, 'Còn'),
('Massage', 300000, 4, 'Còn');

-- Bảng hop_dong_chi_tiet
insert into hop_dong_chi_tiet (hop_dong_id, dich_vu_di_kem_id, hop_dong_chi_tiet_quantity)
values
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(3, 4, 2);

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select *
from nhan_vien
where (nhan_vien_name like 'H%' 
       or nhan_vien_name like 'T%' 
       or nhan_vien_name like 'K%')
  and char_length(nhan_vien_name) <= 15;

-- 3. hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from khach_hang
where timestampdiff(year, khach_hang_dob, curdate()) between 18 and 50
  and (khach_hang_address = 'Đà Nẵng' or khach_hang_address = 'Quảng Trị');

-- 4. đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. chỉ đếm những khách hàng nào có tên loại khách hàng là “diamond”.
select kh.khach_hang_id,
       kh.khach_hang_name,
       count(hd.hop_dong_id) as so_lan_dat_phong
from khach_hang kh
join loai_khach lk on kh.loai_khach_id = lk.loai_khach_id
join hop_dong hd on kh.khach_hang_id = hd.khach_hang_id
where lk.loai_khach_name = 'Diamond'
group by kh.khach_hang_id, kh.khach_hang_name
order by so_lan_dat_phong asc;

-- 5. hiển thị idkhachhang, hoten, tenloaikhach, idhopdong, tendichvu, ngaylamhopdong, ngayketthuc, tongtien cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select 
    kh.khach_hang_id as idkhachhang,
    kh.khach_hang_name as hoten,
    lk.loai_khach_name as tenloaikhach,
    hd.hop_dong_id as idhopdong,
    dv.dich_vu_name as tendichvu,
    hd.hop_dong_date_start as ngaylamhopdong,
    hd.hop_dong_date_end as ngayketthuc,
    (dv.dich_vu_price + ifnull(sum(hdct.hop_dong_chi_tiet_quantity * dvdk.dich_vu_di_kem_price),0)) as tongtien
from khach_hang kh
left join loai_khach lk on kh.loai_khach_id = lk.loai_khach_id
left join hop_dong hd on kh.khach_hang_id = hd.khach_hang_id
left join dich_vu dv on hd.dich_vu_id = dv.dich_vu_id
left join hop_dong_chi_tiet hdct on hd.hop_dong_id = hdct.hop_dong_id
left join dich_vu_di_kem dvdk on hdct.dich_vu_di_kem_id = dvdk.dich_vu_di_kem_id
group by kh.khach_hang_id, kh.khach_hang_name, lk.loai_khach_name,
         hd.hop_dong_id, dv.dich_vu_name, hd.hop_dong_date_start, hd.hop_dong_date_end, dv.dich_vu_price
order by kh.khach_hang_id;

-- 6. hiển thị iddichvu, tendichvu, dientich, chiphithue, tenloaidichvu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2019 (quý 1 là tháng 1, 2, 3)
select 
    dv.dich_vu_id as iddichvu,
    dv.dich_vu_name as tendichvu,
    dv.dich_vu_useable_area as dientich,
    dv.dich_vu_price as chiphithue,
    ldv.loai_dich_vu_name as tenloaidichvu
from dich_vu dv
join loai_dich_vu ldv on dv.loai_dich_vu_id = ldv.loai_dich_vu_id
where dv.dich_vu_id not in (
    select distinct hd.dich_vu_id
    from hop_dong hd
    where year(hd.hop_dong_date_start) = 2019
      and month(hd.hop_dong_date_start) in (1,2,3)
);

-- 7. hiển thị thông tin iddichvu, tendichvu, dientich, songuoitoida, chiphithue, tenloaidichvu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2018 nhưng chưa từng được khách hàng đặt phòng trong năm 2019.
select 
    dv.dich_vu_id as iddichvu,
    dv.dich_vu_name as tendichvu,
    dv.dich_vu_useable_area as dientich,
    dv.dich_vu_so_nguoi_toi_da as songuoitoida,
    dv.dich_vu_price as chiphithue,
    ldv.loai_dich_vu_name as tenloaidichvu
from dich_vu dv
join loai_dich_vu ldv on dv.loai_dich_vu_id = ldv.loai_dich_vu_id
where dv.dich_vu_id in (
    select distinct hd.dich_vu_id
    from hop_dong hd
    where year(hd.hop_dong_date_start) = 2018
)
and dv.dich_vu_id not in (
    select distinct hd.dich_vu_id
    from hop_dong hd
    where year(hd.hop_dong_date_start) = 2019
);

-- 8. hiển thị thông tin hotenkhachhang có trong hệ thống, với yêu cầu hotenkhachhang không trùng nhau (3 cách) 
-- cách 1: distinct
select distinct kh.khach_hang_name as hotenkhachhang
from khach_hang kh;

-- cách 2: group by
select kh.khach_hang_name as hotenkhachhang
from khach_hang kh
group by kh.khach_hang_name;

-- cách 3: subquery với select + distinct
select kh.khach_hang_name as hotenkhachhang
from (
    select distinct khach_hang_name
    from khach_hang
) kh;


-- 9. thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select 
    month(hd.hop_dong_date_start) as thang,
    count(distinct hd.khach_hang_id) as soluongkhachhang
from hop_dong hd
where year(hd.hop_dong_date_start) = 2025
group by month(hd.hop_dong_date_start)
order by thang;

-- 10. hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. kết quả hiển thị bao gồm idhopdong, ngaylamhopdong, ngayketthuc, tiendatcoc, soluongdichvudikem 
select 
    hd.hop_dong_id as idhopdong,
    hd.hop_dong_date_start as ngaylamhopdong,
    hd.hop_dong_date_end as ngayketthuc,
    hd.hop_dong_tien_dat_coc as tiendatcoc,
    ifnull(sum(hdct.hop_dong_chi_tiet_quantity), 0) as soluongdichvudikem
from hop_dong hd
left join hop_dong_chi_tiet hdct 
       on hd.hop_dong_id = hdct.hop_dong_id
group by hd.hop_dong_id, hd.hop_dong_date_start, hd.hop_dong_date_end, hd.hop_dong_tien_dat_coc
order by hd.hop_dong_id;



select * from khach_hang_view;
-- Tạo view(bảng ảo)
create view khach_hang_view as select khach_hang_name, khach_hang_dob from khach_hang;
-- Update view
update khach_hang_view set khach_hang_name = 'Nguyễn Hoàng Quân' where khach_hang_dob = '1985-06-15';

-- Tạo index(chỉ mục) giúp tìm kiếm nhanh 
create index idx_khach_hang_id on khach_hang(khach_hang_id);
explain select khach_hang_id from khach_hang where khach_hang_id = 2;

-- Tạo Stored Procedure 
Delimiter $
create procedure find_by_name( in name varchar(50))
begin 
select * from khach_hang where khach_hang_name like 'N%';
end $
Delimiter ;

-- Gọi Stored Procedure
call find_by_name("Quan");