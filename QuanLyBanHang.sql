-- ========================================================
-- TẠO VÀ SỬ DỤNG CƠ SỞ DỮ LIỆU QUẢN LÝ BÁN HÀNG
-- ========================================================

DROP DATABASE IF EXISTS QuanLyBanHang;
CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;

-- 1. BẢNG KHÁCH HÀNG (Customer)
CREATE TABLE Customer (
    cID INT AUTO_INCREMENT PRIMARY KEY,
    cName VARCHAR(50) NOT NULL,
    cAge TINYINT CHECK (cAge > 0)
);

-- 2. BẢNG HÓA ĐƠN (Order)
CREATE TABLE `Order` (
    oID INT AUTO_INCREMENT PRIMARY KEY,
    cID INT NOT NULL,
    oDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    oTotalPrice INT DEFAULT NULL,
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

-- 3. BẢNG SẢN PHẨM (Product)
CREATE TABLE Product (
    pID INT AUTO_INCREMENT PRIMARY KEY,
    pName VARCHAR(100) NOT NULL,
    pPrice INT NOT NULL CHECK (pPrice >= 0)
);

-- 4. BẢNG CHI TIẾT HÓA ĐƠN (OrderDetail)
-- (Mối quan hệ Nhiều - Nhiều giữa Order và Product)
CREATE TABLE OrderDetail (
    oID INT NOT NULL,
    pID INT NOT NULL,
    odQTY INT NOT NULL CHECK (odQTY > 0),
    PRIMARY KEY (oID, pID),
    FOREIGN KEY (oID) REFERENCES `Order`(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);

-- ========================================================
-- DỮ LIỆU MẪU ĐỂ CHẠY THỬ (DML)
-- ========================================================

-- Thêm khách hàng
INSERT INTO Customer (cName, cAge) VALUES 
('Minh Quan', 10),
('Ngoc Oanh', 20),
('Hong Ha', 50);

-- Thêm hóa đơn
INSERT INTO `Order` (cID, oDate, oTotalPrice) VALUES 
(1, '2006-03-21', NULL),
(2, '2006-03-23', NULL),
(1, '2006-03-16', NULL);

-- Thêm sản phẩm
INSERT INTO Product (pName, pPrice) VALUES 
('May Giat', 3),
('Tu Lanh', 5),
('Dieu Hoa', 7),
('Quat', 1),
('Bep Dien', 2);

-- Thêm chi tiết hóa đơn
INSERT INTO OrderDetail (oID, pID, odQTY) VALUES 
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);