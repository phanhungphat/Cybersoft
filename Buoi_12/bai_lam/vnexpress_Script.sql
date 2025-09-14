-- lệnh tạo database - nơi lưu trữ dữ liệu của toàn bộ dự án
-- một dự án có thể xài nhiều database
CREATE DATABASE vnexpress;


-- chỉ định sử dụng database: lệnh USE
-- lệnh USE chỉ chạy 1 lần duy nhất
-- nếu tắt dbeaver rồi thì việc đầu tiên phải làm là chạy lại lệnh USE để chỉ định sử dụng database
USE vnexpress;

--! Tên bảng và tên db viết thường
--! riêng Oracle là viết hoa hết
--! Sau này làm việc sẽ làm việc với thư viện ORM,
ORM không nhận những chữ cái đầu viết hoa
--! Một lý do khác là đặt toàn bộ viết thường để phân biệt syntax của SQL và tên bảng,
tên db


-- Lệnh tạo bảng
-- Bảng (table) là nơi lưu trữ dữ liệu
CREATE TABLE baiviet(
	-- có thể chỉ định kiểu dữ liệu cho từng cột (chuỗi, số, boolean, ngày tháng - date/time)
	-- kiểu chuỗi thường nên để kiểu varchar, varchar có thể quy định ký tự varchar(từ 0 tới 255)
	-- vậy "nvarchar" thì sao ? MySQL chỉ cần sử dụng varchar là được, SQL Server thì mới dùng tới nvarchar để có thể ghi tiếng Việt và ký tự đặc biệt
	-- kiểu date thì chỉ lưu được ngày tháng năm, ko có giờ phút giây
	-- timestamp thì sẽ có time zone
	-- datetime thì sẽ không có time zone	
	tieu_de varchar(255),
	noi_dung text,
	ngay_dang timestamp
);

-- Tạo bảng không nhất thiết phải có khoá chính (PK)

-- Lệnh tương tác dữ liệu
-- 1. Thêm dữ liệu vào bảng
INSERT INTO baiviet(tieu_de,noi_dung,ngay_dang) VALUES('tieu de 1','noi dung 1','2025-09-13');
INSERT INTO baiviet(tieu_de,noi_dung,ngay_dang) VALUES('tieu de 2','noi dung 2','2025-09-14');







