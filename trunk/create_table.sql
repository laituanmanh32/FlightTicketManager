
------------Bang Khach Hang---------------------
create table KhachHang
(MSKH           char(12)        NOT NULL     PRIMARY KEY,
constraint      check_MSKH check (regexp_like (MSKH, '[NL|TE][0-9]{10}')),
HoTen           VARCHAR2(25)    NOT NULL,
NgaySinh        date            NOT NULL,
GioiTinh        VARCHAR(3)      NOT NULL check (regexp_like(GioiTinh,'[Nam|Nu]')), 
QuocTich        VARCHAR(15)     NOT NULL,
SoDT            number     NOT NULL check (regexp_like (SoDT,'[+84([0-9]){9}[0-9|]')),
DiaChi          VARCHAR(50)     NOT NULL,
MSTTTG          VARCHAR(10)     NOT NULL,
MSPHH           VARCHAR(10)     NOT NULL,
MSCB            VARCHAR(10)     NOT NULL,
KhoiLuongVuot   number           NOT NULL
);

-------------Bang KhachHangNL-------------
create table KhachHangNL
(
MSKH           char(12)        NOT NULL     PRIMARY KEY,
constraint      check_MSKH check (regexp_like (MSKH, '[NL][0-9]{10}')),
CMND         number      NOT NULL UNIQUE,
Passport     VARCHAR     NOT NULL,
constraint      check_Passport check(regexp_like(Passport,'[B[0-9]{7}]'))
)


create table KhachHangTE
(
MSKH           char(12)        NOT NULL     PRIMARY KEY,
constraint      check_MSKH check (regexp_like (MSKH, '[TE][0-9]{10}')),
MSNGH       VARCHAR(10)       NOT NULL,
ThongTinKSinh      VARCHAR(50) NOT NULL,
)
--hello--
create table TrangThaiTG
(
MSTTTG    int       NOT NULL     AUTO_INCREMENT,
ID        int       NOT NULL
)

create table PhiVCHH
(
)

create table ChuyenBay
(
)

create table GheKhach
(
)

create table MayBay
(
)

create table LoaiMayBay
(
)

create table GheNgoi
(
)

create table TuyenBay
(
)

create table Ga
(
)

create table ThucPham
(
)

create table GiaThucPham
(
)

create table ChuyenBayThucPham
(
)

create table NhanVien
(
)

create table BangCap
(
)

create table PhiCong
(
)

create table TiepVien
(
)

create table CaLamViec
(
)

create table NhanVienMD
(
)

create table NhanVienMD
(
)

create table NVMatDat_CaLV
(
)

create table VanHanh
(
)

create table Lai
(
)

create table KiemTra
(
)

create table ChuyenMonBD
(
)