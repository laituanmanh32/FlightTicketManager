/*  Pre-setting   */
ALTER session SET NLS_DATE_FORMAT     ='dd/mm/yyyy';
ALTER session SET NLS_TIMESTAMP_FORMAT='hh24';
/***********************************************/
------------1. Bang Khach Hang---------------------
CREATE TABLE KhachHang
  (
    MSKH VARCHAR(12) NOT NULL ,
    CONSTRAINT check_MSKH CHECK (regexp_like (MSKH, '^(NL|TE)[0-9]{10}$')),
    HoTen    VARCHAR(25) NOT NULL,
    NgaySinh DATE NOT NULL,
    GioiTinh VARCHAR(3) NOT NULL,
    CONSTRAINT check_GioiTinh CHECK (regexp_like(GioiTinh,'(Nam|Nu)')),
    QuocTich VARCHAR(15) NOT NULL,
    SoDT     NUMBER NOT NULL CHECK (regexp_like (SoDT,'^(+84)[0-9]{9}[0-9|]?$')),
    DiaChi   VARCHAR(50) NOT NULL,
    MSTTTG   NUMBER NOT NULL,
    /*Foreign key*/
    MSPHH NUMBER NOT NULL,
    /*Foreign key*/
    MSCB VARCHAR(20) NOT NULL,
    /*Foreign key*/
    KhoiLuongVuot NUMBER NOT NULL,
    PRIMARY KEY (MSKH)
  );
------------ Generate auto increase ID ---------------
CREATE OR REPLACE
  FUNCTION ID_GEN
    (
      seed     IN NUMBER,
      precious IN NUMBER
    )
    RETURN VARCHAR2
  IS
    loop_index NUMBER(2);
    loop_limit NUMBER(2);
    temp       VARCHAR(100);
  BEGIN
    temp       := TO_CHAR(seed);
    loop_limit := precious - LENGTH(temp);
    <<gen_loop>>
    FOR loop_index IN 1..loop_limit
    LOOP
      temp := '0'||temp;
    END LOOP gen_loop;
    RETURN temp;
  END ID_GEN;
  /
  ------------ Calculator age from birthday -------------
CREATE OR REPLACE
FUNCTION GET_AGE
  (
    birthdate IN DATE
  )
  RETURN NUMBER
IS
  AGE NUMBER(10);
BEGIN
  AGE := extract(YEAR FROM CURRENT_DATE) - extract(YEAR FROM birthdate);
  RETURN AGE;
END GET_AGE;
/
------------ Sequence for ID increment ----------------
CREATE sequence KhachHang_MSKH_NL_sq;
CREATE sequence KhachHang_MSKH_TE_sq;
  ------------ Trigger to handler everything in KhachHangTable --------
CREATE OR REPLACE TRIGGER KhachHang_Handler_trg BEFORE
  INSERT ON KhachHang FOR EACH ROW BEGIN IF (get_age(:new.NgaySinh) >= 18) THEN
  SELECT 'NL'||ID_GEN(KhachHang_MSKH_NL_sq.nextval,10) INTO :new.MSKH FROM dual;
ELSE
  SELECT 'TE'||ID_GEN(KhachHang_MSKH_TE_sq.nextval,10) INTO :new.MSKH FROM dual;
END IF;
END;
/
/* DONE! */
-------------2. Bang KhachHangNL-------------
CREATE TABLE KhachHangNL
  (
    MSKH VARCHAR(12) NOT NULL PRIMARY KEY,
    /* Foreign Key reference to Khach Hang*/
    CMND     NUMBER NOT NULL UNIQUE,
    Passport VARCHAR(8),
    CONSTRAINT check_Passport CHECK(regexp_like(Passport,'^[A-Z][0-9]{7}$'))
  );
/*DONE!*/
-------------3. KhachHangTE-----------------
CREATE TABLE KhachHangTE
  (
    MSKH VARCHAR(12) NOT NULL,
    /*Foreign key reference to KhachHang*/
    CONSTRAINT MSKH_check CHECK (regexp_like (MSKH, '^(TE)[0-9]{10}$')),
    MSNGH         VARCHAR(12) NOT NULL,
    ThongTinKSinh VARCHAR(50)
  );
/*DONE!*/
------------4. Trangthai TG------------------
CREATE TABLE TrangThaiTG
  (
    MSTTTG INT NOT NULL,
    /* Auto increment */
    TenTT VARCHAR(2) NOT NULL CHECK(regexp_like(TenTT,'(TG|HH|DD)')),
    PhanTramTP FLOAT NOT NULL,
    PRIMARY KEY(MSTTTG)
  );
CREATE sequence TrangThai_seq;
CREATE OR REPLACE TRIGGER TrangThaiTG_In_trg BEFORE
  INSERT ON TrangThaiTG FOR EACH ROW BEGIN
  SELECT TrangThai_seq.nextval INTO :new.MSTTTG FROM dual;
END;
/
/* DONE! */
---------------5. Phi VCHH-------------------
CREATE TABLE PhiVCHH
  (
    MSPHH NUMBER NOT NULL,
    /* Auto increment */
    LoaiVe         VARCHAR(3) NOT NULL CHECK(LoaiVe IN ('VIP','PT')),
    TrongLuongDM   NUMBER NOT NULL,
    DonGia_Kg      NUMBER NOT NULL,
    ThoiDiemApDung DATE NOT NULL,
    PRIMARY KEY(MSPHH)
  );
CREATE sequence PhiVCHH_seq;
CREATE OR REPLACE TRIGGER PhiVCHH_In_trg BEFORE
  INSERT ON PhiVCHH FOR EACH ROW BEGIN
  SELECT PhiVCHH_seq.nextval INTO :new.MSPHH FROM dual;
END;
/
/*DONE!*/
----------------6. Chuyen Bay----------------
CREATE TABLE ChuyenBay
  (
    MSCB VARCHAR(9) NOT NULL,
    CONSTRAINT check_Chuyenbay CHECK (regexp_like(MSCB,'^(SA)[0-9]{7}')),
    TrangThai   VARCHAR(2) NOT NULL CHECK(TrangThai IN ('CB','DB','HB')),
    SoGheTrong  INT NOT NULL,
    ThoiDiemDi  DATE NOT NULL,
    ThoiDiemDen DATE NOT NULL,
    MSMB        VARCHAR(20) NOT NULL,
    MSTB        NUMBER NOT NULL,
    PRIMARY KEY (MSCB)
  );
/*DONE!*/
---------------7. Ghe Khach-------------------
CREATE TABLE GheKhach
  (
    MSKH  VARCHAR(12) NOT NULL,
    GheSo VARCHAR(3) NOT NULL UNIQUE,
    Gia   NUMBER NOT NULL,
    CONSTRAINT PR_KEY_GheKhach PRIMARY KEY (MSKH,Gheso) ENABLE
  );
/*DONE!*/
-----------------8. Loai May bay--------------
CREATE TABLE LoaiMayBay
  (
    MSLMB     VARCHAR(20) NOT NULL,
    HangSX    CHAR(20) NOT NULL,
    Model_    VARCHAR(20) NOT NULL,
    SoGheVip  INT NOT NULL,
    SoGhePT   INT NOT NULL,
    TongSoGhe INT NOT NULL,
    PRIMARY KEY(MSLMB)
  );
/*DONE!*/
-----------------9. May bay--------------
CREATE TABLE MayBay
  (
    MSMB VARCHAR(6) NOT NULL,
    CONSTRAINT check_Maybay CHECK (regexp_like (MSMB, '^(SAP)[0-9]{3}')),
    TongGioBay NUMBER NOT NULL,
    NamSX      INT NOT NULL,
    ThoiDiemSD DATE NOT NULL,
    MSLMB      VARCHAR(20) NOT NULL,
    PRIMARY KEY (MSMB)
  );
/*DONE!*/
-----------------10. Ghe Ngoi----------------
CREATE TABLE GheNgoi
  (
    MSG   INT NOT NULL ,
    Gheso VARCHAR(3) NOT NULL UNIQUE,
    CONSTRAINT check_GheNgoi CHECK(regexp_like(GheSo,'^[A-Z][0-9]{2}')),
    LoaiGhe VARCHAR(3) NOT NULL CHECK(LoaiGhe IN ('VIP','PT')),
    MSLMB   VARCHAR(20) NOT NULL
  );
CREATE sequence GheNgoi_seq;
CREATE OR REPLACE TRIGGER GheNgoi_In_trg BEFORE
  INSERT ON GheNgoi FOR EACH ROW BEGIN
  SELECT GheNgoi_seq.nextval INTO :new.MSG FROM dual;
END;
/
/*DONE!*/
-------------------11. Tuyen bay-------------
CREATE TABLE TuyenBay
  (
    MSTB NUMBER NOT NULL,
    /* Auto increment */
    MSG_Di NUMBER NOT NULL,
    /* Foreign Key*/
    MSG_Den NUMBER NOT NULL,
    /* Foreign Key*/
    PRIMARY KEY (MSTB)
  );
CREATE sequence TuyenBay_seq;
CREATE OR REPLACE TRIGGER TuyenBay_In_trg BEFORE
  INSERT ON TuyenBay FOR EACH ROW BEGIN
  SELECT TuyenBay_seq.nextval INTO :new.MSTB FROM dual;
END;
/
/*DONE!*/
-------------------12. Ga---------------------
CREATE TABLE Ga
  (
    MSGa NUMBER NOT NULL,
    /* Auto increase */
    TenSB    VARCHAR(50) NOT NULL,
    ThanhPho VARCHAR(15) NOT NULL,
    QuocGia  VARCHAR(15) NOT NULL,
    PRIMARY KEY ( MSGa)
  );
CREATE sequence Ga_seq;
CREATE OR REPLACE TRIGGER Ga_In_trg BEFORE
  INSERT ON Ga FOR EACH ROW BEGIN
  SELECT Ga_seq.nextval INTO :new.MSGa FROM dual;
END;
/
/*DONE!*/
----------------------13. Thucpham----------------
CREATE TABLE ThucPham
  (
    MSTP NUMBER NOT NULL,
    /* Auto increase */
    Ten  VARCHAR(20) NOT NULL,
    MoTa VARCHAR(100) NOT NULL,
    PRIMARY KEY (MSTP)
  );
CREATE sequence ThucPham_seq;
CREATE OR REPLACE TRIGGER ThucPham_In_trg BEFORE
  INSERT ON ThucPham FOR EACH ROW BEGIN
  SELECT ThucPham_seq.nextval INTO :new.MSTP FROM dual;
END;
/
/*DONE*/
----------------------14. GiaThucPham---------------
CREATE TABLE GiaThucPham
  (
    MSGTP INT NOT NULL,
    /* Auto_increment*/
    Gia        NUMBER NOT NULL,
    NgayApDung DATE NOT NULL,
    MSTP       NUMBER NOT NULL,
    /* Foreign Key */
    PRIMARY KEY(MSGTP)
  );
CREATE sequence GiaThucPham_seq;
CREATE OR REPLACE TRIGGER GiaThucPham_In_trg BEFORE
  INSERT ON GiaThucPham FOR EACH ROW BEGIN
  SELECT GiaThucPham_seq.nextval INTO :new.MSGTP FROM dual;
END;
/
/*DONE*/
-------------------15.Chuyen bay thuc pham--------
CREATE TABLE ChuyenBayThucPham
  (
    MSCB VARCHAR(9) NOT NULL,
    /* Auto increment */
    MSTP NUMBER NOT NULL,
    CONSTRAINT PR_key_ChuyenBayThucPham PRIMARY KEY (MSCB,MSTP) enable
  );
/*DONE!*/
-------------------16. Nhan vien ------------------
CREATE TABLE NhanVien
  (
    MSNV VARCHAR(20) NOT NULL,
    CONSTRAINT check_NhanVien CHECK (regexp_like (MSNV, '^(PC|TV|KT|DH|KS)')),
    /* regexp sai*/
    HoTen    VARCHAR(50) NOT NULL,
    NgaySinh DATE NOT NULL,
    GioiTinh VARCHAR(3) NOT NULL CHECK(GioiTinh IN ('Nam','Nu')),
    QuocTich VARCHAR(20) NOT NULL,
    CMND     VARCHAR(20) NOT NULL UNIQUE,
    Passport VARCHAR(8),
    CONSTRAINT check_Passport_Nhanvien CHECK(regexp_like(Passport,'^[A-Z][0-9]{7}')),
    NgayVaoLam DATE NOT NULL,
    DiaChi     VARCHAR(50) NOT NULL,
    SoDT       VARCHAR(13) NOT NULL CHECK (regexp_like (SoDT,'^(\+84)[0-9]{9}[0-9|]?')),
    /*regexp*/
    TienLuong NUMBER(15) NOT NULL,
    PRIMARY KEY ( MSNV)
  );
CREATE sequence NhanVien_MSNV_PC_sq;
CREATE sequence NhanVien_MSNV_TV_sq;
CREATE sequence NhanVien_MSNV_KT_sq;
CREATE sequence NhanVien_MSNV_DH_sq;
CREATE sequence NhanVien_MSNV_KS_sq;
  ------------ Trigger to handler everything in NhanVienTable --------
CREATE OR REPLACE TRIGGER NhanVien_Handler_trg BEFORE
  INSERT ON NhanVien FOR EACH ROW DECLARE temp VARCHAR(50);
  BEGIN
    CASE :new.MSNV
    WHEN 'PC' THEN
      temp := 'PC'||ID_GEN(NhanVien_MSNV_PC_sq.nextval,10);
    WHEN 'TV' THEN
      temp := 'TV'||ID_GEN(NhanVien_MSNV_TV_sq.nextval,10);
    WHEN 'KT' THEN
      temp := 'KT'||ID_GEN(NhanVien_MSNV_KT_sq.nextval,10);
    WHEN 'DH' THEN
      temp := 'DH'||ID_GEN(NhanVien_MSNV_DH_sq.nextval,10);
    WHEN 'KS' THEN
      temp := 'KS'||ID_GEN(NhanVien_MSNV_KS_sq.nextval,10);
    END CASE;
    SELECT temp INTO :new.MSNV FROM DUAL;
  END;
  /
  /*DONE!*/
  -------------------17. Bang cap---------------------
  CREATE TABLE BangCap
    (
      MSBC         NUMBER NOT NULL,
      TenBangCap   VARCHAR(20) NOT NULL,
      TruongDaoTao VARCHAR(20) NOT NULL,
      NamDat       VARCHAR(20) NOT NULL,
      MSNV         VARCHAR(20) NOT NULL,
      /*Foreign Key*/
      PRIMARY KEY(MSBC)
    );
CREATE sequence BangCap_seq;
CREATE OR REPLACE TRIGGER BangCap_In_trg BEFORE
  INSERT ON BangCap FOR EACH ROW BEGIN
  SELECT BangCap_seq.nextval INTO :new.MSBC FROM dual;
END;
/
/*DONE!*/
------------------18.PhiCong-------------------
CREATE TABLE PhiCong
  (
    MSNV VARCHAR(20) NOT NULL,
    /*Foreign Key*/
    LoaiPhiCong VARCHAR(2) NOT NULL CHECK(LoaiPhiCong IN('CT','PL')),
    CONSTRAINT PhiCong_MSNV_check CHECK(regexp_like (MSNV, '^(PC)+')),
    PRIMARY KEY ( MSNV)
  );
/*Done*/
------------------19. Tiep Vien-------------
CREATE TABLE TiepVien
  (
    MSNV VARCHAR (20) NOT NULL,
    /*Foreign key*/
    NgoaiNguThongThao VARCHAR (20) NOT NULL,
    PRIMARY KEY (MSNV)
  );
/*DONE!*/
------------------20. Chi Nhanh
CREATE TABLE ChiNhanh
  (
    MSCN        NUMBER NOT NULL,
    TenChiNhanh VARCHAR(20) NOT NULL,
    ThanhPho    VARCHAR(20) NOT NULL,
    QuocGia     VARCHAR(20) NOT NULL,
    PRIMARY KEY (MSCN)
  );
CREATE sequence ChiNhanh_seq;
CREATE OR REPLACE TRIGGER ChiNhanh_In_trg BEFORE
  INSERT ON ChiNhanh FOR EACH ROW BEGIN
  SELECT ChiNhanh_seq.nextval INTO :new.MSCN FROM dual;
END;
/
------------------21. Ca lam viec----------------
CREATE TABLE CaLamViec
  (
    MSCLV VARCHAR(2) NOT NULL,
    CONSTRAINT check_CaLamViec CHECK (regexp_like (MSCLV, '^(C)[1-3]')),
    /* regexp*/
    TuGio  TIMESTAMP NOT NULL,
    DenGio TIMESTAMP NOT NULL,
    PRIMARY KEY ( MSCLV)
  );
/*DONE*/
-------------------22. Nhan vien MD----------------------
CREATE TABLE NhanVienMD
  (
    MSNV VARCHAR (20) NOT NULL,
    /*Foreign Key*/
    MSCN NUMBER NOT NULL,
    /*Foreign key*/
    MSNV_Truong VARCHAR (20) NOT NULL,
    /*Foreign Key*/
    CONSTRAINT NhanVienMD_MSNV_check CHECK(regexp_like (MSNV, '^(KT|DH|KS)+')),
    PRIMARY KEY(MSNV)
  );
/*DONE*/
------------------23.NVMatDat_CaLV------------------
CREATE TABLE NVMatDat_CaLV
  (
    MSNV VARCHAR(20) NOT NULL,
    /*foreign key*/
    MSCLV VARCHAR(2) NOT NULL,
    /*foreign key*/
    NgayBatDau DATE NOT NULL,
    PRIMARY KEY(MSNV,MSCLV)
  );
/*Done*/
------------------24. Van Hanh-------------------
CREATE TABLE VanHanh
  (
    MSNV VARCHAR(20) NOT NULL,
    /*Foreign Key*/
    MSCB VARCHAR(9) NOT NULL,
    /*Foreign Key*/
    CONSTRAINT VanHanh_MSNV_Check CHECK(regexp_like (MSNV, '^(PC|TV)+')),
    PRIMARY KEY(MSNV,MSCB)
  );
/*Done*/
------------------25. Lai----------------------
CREATE TABLE Lai
  (
    MSNV VARCHAR(20) NOT NULL,
    /*Foreign Key*/
    MSLMB VARCHAR(20) NOT NULL,
    /*Foreign Key*/
    CONSTRAINT Lai_MSNV_check CHECK(regexp_like (MSNV, '^(PC)+')),
    PRIMARY KEY (MSNV,MSLMB)
  );
/*Done*/
-------------------26. Kiem tra------------------
CREATE TABLE KiemTra
  (
    MSNV VARCHAR(20) NOT NULL,
    /*Foreign Key*/
    MSCB VARCHAR(9) NOT NULL,
    /*Foreign Key*/
    CONSTRAINT KiemTra_MSNV_check CHECK(regexp_like (MSNV, '^(KT)+')),
    PRIMARY KEY(MSNV,MSCB)
  );
--------------------27. Chuyen mon BD-----------------
CREATE TABLE ChuyenMonBD
  (
    MSNV VARCHAR(20) NOT NULL,
    /*Foreign Key*/
    MSLMB VARCHAR(20) NOT NULL,
    /*Foreign Key*/
    CONSTRAINT ChuyenMonBD_MSNV_check CHECK(regexp_like (MSNV, '^(KT)+')),
    PRIMARY KEY (MSNV, MSLMB)
  );
/*  MAPPING FOREIGN KEY  */
-- code here
--KhachHang--->TrangThaiTG,PhiVCHH,MSCB
ALTER TABLE KhachHang ADD CONSTRAINT KhachHang_MSTTTG_FK FOREIGN KEY
(
  MSTTTG
)
REFERENCES TrangThaiTG
(
  MSTTTG
)
;
ALTER TABLE KhachHang ADD CONSTRAINT KhachHang_MSPHH_FK FOREIGN KEY
(
  MSPHH
)
REFERENCES PhiVCHH
(
  MSPHH
)
;
ALTER TABLE KhachHang ADD CONSTRAINT KhachHang_MSCB_FK FOREIGN KEY
(
  MSCB
)
REFERENCES ChuyenBay
(
  MSCB
)
;
--KhachHangNL ----> KhachHang,KhachHangNL
ALTER TABLE KhachHangNL ADD CONSTRAINT KhachHangNL_MSKH_FK FOREIGN KEY
(
  MSKH
)
REFERENCES KhachHang
(
  MSKH
)
;
/*CHECKED*/
--KhachHangTE-----> KhachHang
ALTER TABLE KhachHangTE ADD CONSTRAINT KhachHangTE_MSKH_FK FOREIGN KEY
(
  MSKH
)
REFERENCES KhachHang
(
  MSKH
)
;
/*CHECKED*/
--ChuyenBay--->MayBay,TuyenBay
ALTER TABLE ChuyenBay ADD CONSTRAINT ChuyenBay_MSMB_FK FOREIGN KEY
(
  MSMB
)
REFERENCES MayBay
(
  MSMB
)
;
ALTER TABLE ChuyenBay ADD CONSTRAINT ChuyenBay_MSTB_FK FOREIGN KEY
(
  MSTB
)
REFERENCES TuyenBay
(
  MSTB
)
;
--GheKhach--->KhachHang
ALTER TABLE GheKhach ADD CONSTRAINT GheKhach_MSKH_FK FOREIGN KEY
(
  MSKH
)
REFERENCES KhachHang
(
  MSKH
)
;
/*CHECKED*/
--MayBay--->LoaiMayBay
ALTER TABLE MayBay ADD CONSTRAINT MayBay_MSLMB_FK_FK FOREIGN KEY
(
  MSLMB
)
REFERENCES LoaiMayBay
(
  MSLMB
)
;
--GheNgoi--->GheKhach,LoaiMayBay
ALTER TABLE GheNgoi ADD CONSTRAINT GheNgoi_GheSo_FK FOREIGN KEY
(
  GheSo
)
REFERENCES GheKhach
(
  GheSo
)
;
ALTER TABLE GheNgoi ADD CONSTRAINT GheNgoi_MSLMB_FK FOREIGN KEY
(
  MSLMB
)
REFERENCES LoaiMayBay
(
  MSLMB
)
; ----> OK
--TuyenBay ---> Ga
ALTER TABLE TuyenBay ADD CONSTRAINT TuyenBay_MSGa_Di_fk FOREIGN KEY
(
  MSG_Di
)
REFERENCES Ga
(
  MSGa
)
;
ALTER TABLE TuyenBay ADD CONSTRAINT TuyenBay_MSGa_Den_fk FOREIGN KEY
(
  MSG_Den
)
REFERENCES Ga
(
  MSGa
)
;
/*CHECKED*/
--GiaThucPham--->ThucPham
ALTER TABLE GiaThucPham ADD CONSTRAINT GiaThucPham_MSTP_FK FOREIGN KEY
(
  MSTP
)
REFERENCES ThucPham
(
  MSTP
)
;
--ChuyenBayThucPham--->ChuyenBay,ThucPham
ALTER TABLE ChuyenBayThucPham ADD CONSTRAINT ChuyenBayThucPham_MSCB_FK FOREIGN KEY
(
  MSCB
)
REFERENCES ChuyenBay
(
  MSCB
)
;
ALTER TABLE ChuyenBayThucPham ADD CONSTRAINT ChuyenBayThucPham_MSTP_FK FOREIGN KEY
(
  MSTP
)
REFERENCES ThucPham
(
  MSTP
)
;
--BangCap-----> Nhanvien
ALTER TABLE BangCap ADD CONSTRAINT BangCap_MSNV_FK FOREIGN KEY
(
  MSNV
)
REFERENCES NhanVien
(
  MSNV
)
;
--PhiCong-----> NhanVien
ALTER TABLE PhiCong ADD CONSTRAINT PhiCong_MSNV_FK FOREIGN KEY
(
  MSNV
)
REFERENCES NhanVien
(
  MSNV
)
;
--TiepVien-----> NhanVien
ALTER TABLE TiepVien ADD CONSTRAINT TiepVien_MSNV_FK FOREIGN KEY
(
  MSNV
)
REFERENCES NhanVien
(
  MSNV
)
;
--NhanVienMD-----> NhanVien,ChiNhanh
ALTER TABLE NhanVienMD ADD CONSTRAINT NhanVienMD_MSNV_FK FOREIGN KEY
(
  MSNV
)
REFERENCES NhanVien
(
  MSNV
)
;
ALTER TABLE NhanVienMD ADD CONSTRAINT NhanVienMD_MSCN_FK FOREIGN KEY
(
  MSCN
)
REFERENCES ChiNhanh
(
  MSCN
)
;
ALTER TABLE NhanVienMD ADD CONSTRAINT NhanVienMD_MSNV_Truong_FK FOREIGN KEY
(
  MSNV_Truong
)
REFERENCES NhanVienMD
(
  MSNV
)
;
--NhanVienMD_CaLV----->NhanVien, CaLamViec
ALTER TABLE NVMatDat_CaLV ADD CONSTRAINT NhanVienMD_CaLV_MSNV_FK FOREIGN KEY
(
  MSNV
)
REFERENCES NhanVien
(
  MSNV
)
;
ALTER TABLE NVMatDat_CaLV ADD CONSTRAINT NhanVienMD_CaLV_MSCLV_FK FOREIGN KEY
(
  MSCLV
)
REFERENCES CaLamViec
(
  MSCLV
)
;
--VanHanh----------> NhanVien,ChuyenBay
ALTER TABLE VanHanh ADD CONSTRAINT VanHanh_MSNV_FK FOREIGN KEY
(
  MSNV
)
REFERENCES NhanVien
(
  MSNV
)
;
ALTER TABLE VanHanh ADD CONSTRAINT VanHanh_MSCB_FK FOREIGN KEY
(
  MSCB
)
REFERENCES ChuyenBay
(
  MSCB
)
;
--Lai-------------->NhanVien,LoaiMayBay
ALTER TABLE Lai ADD CONSTRAINT Lai_MSNV_FK FOREIGN KEY
(
  MSNV
)
REFERENCES NhanVien
(
  MSNV
)
;
ALTER TABLE Lai ADD CONSTRAINT Lai_MSLMB_FK FOREIGN KEY
(
  MSLMB
)
REFERENCES LoaiMayBay
(
  MSLMB
)
;
--KiemTra---------->NhanVien,ChuyenBay
ALTER TABLE KiemTra ADD CONSTRAINT KiemTra_MSNV_FK FOREIGN KEY
(
  MSNV
)
REFERENCES NhanVien
(
  MSNV
)
;
ALTER TABLE KiemTra ADD CONSTRAINT KiemTra_MSCB_FK FOREIGN KEY
(
  MSCB
)
REFERENCES ChuyenBay
(
  MSCB
)
;
--ChuyenMonBD--------> NhanVien,LoaiMayBay
ALTER TABLE ChuyenMonBD ADD CONSTRAINT ChuyenMonBD_MSNV_FK FOREIGN KEY
(
  MSNV
)
REFERENCES NhanVien
(
  MSNV
)
;
ALTER TABLE ChuyenMonBD ADD CONSTRAINT ChuyenMonBD_MSLMB_FK FOREIGN KEY
(
  MSLMB
)
REFERENCES LoaiMayBay
(
  MSLMB
)
;
/***********************************************
******************TRIGGER************************/
CREATE OR REPLACE TRIGGER LoaiMayBay_incon_handler_trg BEFORE
  INSERT OR
  UPDATE ON LoaiMayBay FOR EACH row BEGIN
  SELECT :new.SogheVIP + :new.SoGhePT INTO :new.TongSoghe FROM dual;
END;
/
CREATE OR REPLACE TRIGGER chuyenbay_incon_handler_trg AFTER
  INSERT OR
  UPDATE ON ChuyenBay BEGIN
  UPDATE maybay
  SET tonggiobay = NVL(
    (SELECT SUM(total)
    FROM
      (SELECT Chuyenbay.thoidiemden - chuyenbay.thoidiemdi AS total
      FROM chuyenbay
      WHERE trangthai='DB'
      AND MSMB       = maybay.MSMB
      )
    ),0);
END;
/
/***************************************************
******************FUNCTION**************************/
CREATE OR REPLACE PROCEDURE PhiVCHH_commit 
(
  MSKH_IN IN NUMBER
) IS 

BEGIN
Declare
  loaive number;
  thoidiem date;
  begin
    select loaighe
    into loaive
    from khachhang,GheKhach,ghengoi
    where khachhang.MSKH=GheKhach.MSKH And khachhang.MSKH = 'NL0000000002' and ghengoi.gheso = ghekhach.gheso;
  
    select MAX(thoidiemapdung)
    into thoidiem
    from phivchh;
  
    update KhachHang
    set MSPHH = (SELECT phivchh.MSPHH from phivchh where phivchh.loaive = loaive and thoidiem = phivchh.thoidiemapdung )
    where Khachhang.MSKH = MSKH_IN;
    end;
END PhiVCHH_commit;
/
CREATE OR REPLACE PROCEDURE KHOILUONG_COMMIT 
(
  MSKH_IN IN VARCHAR2  
, KHOILUONG IN NUMBER  
) AS 
BEGIN
  DECLARE
    KL_DM number;
  begin
    SELECT TrongLuongDM
    INTO KL_DM
    FROM PhiVCHH WHERE MSPHH = (SELECT MSPHH FROM KhachHang WHERE MSKH = MSKH_IN);
    
    IF (KL_DM <= Khoiluong) then
      UPDATE KhachHang SET KhoiLuongVuot = 0 WHERE MSKH = MSKH_IN;
    else
      UPDATE KhachHang SET KhoiLuongVuot = KhoiLuong - KL_DM WHERE MSKH = MSKH_In;
    end if;
  end;
END KHOILUONG_COMMIT;
/
--------------DONE--------------------

