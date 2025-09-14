CREATE DATABASE cybersoft_shop;
USE cybersoft_shop;

-- Bảng loại sản phẩm
CREATE TABLE LoaiSanPham (
    MaLoaiSP INT PRIMARY KEY AUTO_INCREMENT,
    TenLoaiSP VARCHAR(100) NOT NULL
);

-- Bảng sản phẩm
CREATE TABLE SanPham (
    MaSP INT PRIMARY KEY AUTO_INCREMENT,
    TenSP VARCHAR(200) NOT NULL,
    MoTa TEXT,
    Gia DECIMAL(12,2) NOT NULL,
    MaLoaiSP INT,
    FOREIGN KEY (MaLoaiSP) REFERENCES LoaiSanPham(MaLoaiSP)
);

-- Bảng khách hàng
CREATE TABLE KhachHang (
    MaKH INT PRIMARY KEY AUTO_INCREMENT,
    Ho VARCHAR(50),
    Ten VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    SoDT VARCHAR(20),
    DiaChi VARCHAR(200)
);

-- Bảng hóa đơn
CREATE TABLE HoaDon (
    MaHoaDon INT PRIMARY KEY AUTO_INCREMENT,
    NgayMua DATE NOT NULL,
    MaKH INT,
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

-- Bảng chi tiết hóa đơn (bảng trung gian)
CREATE TABLE ChiTietHoaDon (
    MaHoaDon INT,
    MaSP INT,
    SoLuong INT NOT NULL,
    GiaBan DECIMAL(12,2) NOT NULL,
    PRIMARY KEY (MaHoaDon, MaSP),
    FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(MaHoaDon),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

SELECT *
FROM LoaiSanPham 



-- Phần này phải nhờ tới Claude AI
INSERT INTO LoaiSanPham (TenLoaiSP)
VALUES 
('Điện thoại'),
('Laptop'),
('Phụ kiện'),
('Máy tính bảng');
INSERT INTO SanPham (TenSP, MoTa, Gia, MaLoaiSP)
VALUES
('iPhone 14 Pro Max', 'Điện thoại Apple cao cấp', 29990000, 1),
('Samsung Galaxy S23', 'Điện thoại Samsung mới nhất', 21990000, 1),
('MacBook Pro 16"', 'Laptop Apple cho dân lập trình', 49990000, 2),
('Dell XPS 13', 'Laptop mỏng nhẹ của Dell', 32990000, 2),
('Chuột Logitech MX Master 3', 'Chuột không dây cao cấp', 2990000, 3),
('iPad Pro 12.9"', 'Máy tính bảng Apple', 28990000, 4);
INSERT INTO KhachHang (Ho, Ten, Email, SoDT, DiaChi)
VALUES
('Nguyen', 'An', 'an.nguyen@example.com', '0905123456', '123 Lê Lợi, Q1, TP.HCM'),
('Tran', 'Binh', 'binh.tran@example.com', '0912345678', '45 Nguyễn Trãi, Q5, TP.HCM'),
('Le', 'Cuong', 'cuong.le@example.com', '0987654321', '78 Hai Bà Trưng, Q3, TP.HCM');
INSERT INTO HoaDon (NgayMua, MaKH)
VALUES
('2025-09-10', 1),
('2025-09-11', 2),
('2025-09-12', 3);
-- Hóa đơn 1 (Nguyen An mua iPhone và Chuột)
INSERT INTO ChiTietHoaDon (MaHoaDon, MaSP, SoLuong, GiaBan)
VALUES
(1, 1, 1, 29990000),
(1, 5, 1, 2990000);

-- Hóa đơn 2 (Tran Binh mua MacBook Pro)
INSERT INTO ChiTietHoaDon (MaHoaDon, MaSP, SoLuong, GiaBan)
VALUES
(2, 3, 1, 49990000);

-- Hóa đơn 3 (Le Cuong mua iPad và Samsung Galaxy)
INSERT INTO ChiTietHoaDon (MaHoaDon, MaSP, SoLuong, GiaBan)
VALUES
(3, 6, 1, 28990000),
(3, 2, 1, 21990000);

