CREATE DATABASE School_DB;
USE School_DB;

CREATE TABLE Students (
    id INT AUTO_INCREMENT,
    full_name NVARCHAR(100) NOT NULL, 
    gender VARCHAR(10),                 
    age INT,
    city NVARCHAR(100),                 
    weight DECIMAL(10,4),
    
    primary key(id)
);

SELECT * FROM Students;

-- Phần INSERT nhờ tới Claude AI
INSERT INTO Students (Full_name, Gender, Age, City, Weight)
VALUES
(N'Nguyen Thanh Nhan', 'Nam', 19, N'Can Tho', 56.5674),
(N'Pham Thu Huong', 'Nu', 20, N'Vinh Long', 72.456),
(N'Nguyen Nhu Ngoc', 'Nu', 20, N'Soc Trang', 85.387),
(N'Bui Thanh Bao', 'Nam', 19, N'Soc Trang', 49.3),
(N'Le My Nhan', 'Nu', 22, N'Can Tho', 62.963),
(N'Tan Thuc Bao', 'Nam', 35, N'An Giang', 55.5678),
(N'Trinh Giao Kim', 'Nam', 44, N'Bac Lieu', 67.34);

DROP DATABASE School_DB
