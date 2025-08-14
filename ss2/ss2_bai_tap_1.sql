create database module3_ss2_bt1;
use module3_ss2_bt1;


create table phieu_xuat(
id_phieu_xuat int auto_increment,
so_px int not null,
ngay_xuat datetime default now(),
don_gia_xuat double not null,
so_luong_xuat int not null,
primary key(id_phieu_xuat)
);

create table vat_tu(
id_vat_tu int auto_increment,
ma_vtu varchar(50) not null,
ten_vtu varchar(50),
don_gia_xuat double not null,
so_luong_xuat int not null,
primary key (id_vat_tu)
);

create table chi_tiet_phieu_xuat(
id_chi_tiet_phieu_xuat int auto_increment,
id_phieu_xuat int,
id_vat_tu int,
foreign key (id_phieu_xuat) references phieu_xuat(id_phieu_xuat),
foreign key (id_vat_tu) references vat_tu(id_vat_tu),
primary key (id_chi_tiet_phieu_xuat)
);

create table phieu_nhap(
so_phieu_nhap int auto_increment,
ngay_nhap datetime default now(),
primary key(so_phieu_nhap)
);

create table chi_tiet_phieu_nhap(
id_chi_tiet_phieu_nhap int auto_increment,
id_vat_tu int,
so_phieu_nhap int,
don_gia_nhap double not null,
so_luong_nhap int not null,
primary key(id_chi_tiet_phieu_nhap),
foreign key (id_vat_tu) references vat_tu(id_vat_tu),
foreign key (so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);

create table don_dat_hang(
so_don_hang int auto_increment,
ngay_dat_hang datetime default now(),
primary key(so_don_hang)
);

create table chi_tiet_don_dat_hang(
id_chi_tiet_don_dat_hang int auto_increment,
id_vat_tu int,
so_don_hang int,
primary key(id_chi_tiet_don_dat_hang),
foreign key(id_vat_tu) references vat_tu(id_vat_tu),
foreign key(so_don_hang) references don_dat_hang(so_don_hang)
);

create table nha_cung_cap(
so_don_hang int,
ma_nha_cung_cap int auto_increment,
ten_nha_cung_cap varchar(50) not null,
dia_chi varchar(50) not null,
primary key(ma_nha_cung_cap),
foreign key(so_don_hang) references don_dat_hang(so_don_hang)
);

create table phone_nha_cung_cap(
ma_nha_cung_cap int,
phone varchar(10),
primary key (ma_nha_cung_cap,phone),
foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);