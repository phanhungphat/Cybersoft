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


--! Lệnh tạo bảng
-- Bảng (table) là nơi lưu trữ dữ liệu
CREATE TABLE baiviet(
	-- có thể chỉ định kiểu dữ liệu cho từng cột (chuỗi, số, boolean, ngày tháng - date/time)
	-- kiểu chuỗi thường nên để kiểu varchar, varchar có thể quy định ký tự varchar(từ 0 tới 255)
	-- vậy "nvarchar" thì sao ? MySQL chỉ cần sử dụng varchar là được, SQL Server thì mới dùng tới nvarchar để có thể ghi tiếng Việt và ký tự đặc biệt
	-- kiểu date thì chỉ lưu được ngày tháng năm, ko có giờ phút giây
	-- timestamp thì sẽ có time zone
	-- datetime thì sẽ không có time zone
	id int auto_increment,
	tieu_de varchar(255),
	noi_dung text,
	ngay_dang timestamp,
	
	-- Chỉ định khoá chính (cột id)
	-- Tự động thêm giá trị thủ công vào cột id đối với MySQL thì được
	-- Nhưng đối với Oracle thì là không được
	primary key(id)
);

--! Tạo bảng không nhất thiết phải có khoá chính (PK)
--! Khoá chính (Primary Key)
-- Khi chỉ định một cột làm khoá chính thì dữ liệu được thêm vào cột đó phải là duy nhất
-- Khoá chính có đánh index - Khái niệm quan trọng --> PHẢI BIẾT
-- Có thể có 1 hoặc nhiều cột làm khoá chính
--! Trong một database chỉ có một khoá chính
--! Nhưng có thể sẽ có NHIỀU CỘT đóng vai trò là MỘT khoá chính
-- Cột mà giữ vai trò làm khoá chính thì mặc định đặt tên là id
-- Kiểu dữ liệu của khoá chính sẽ có ràng buộc (constrant) là tự động tăng (auto_increment) thì sẽ có kiểu int (học thuật, dùng cho dự án cá nhân)
-- Bên ngoài thực tế thì dev sẽ sử dụng kiểu chuỗi - kiểu varchar (dưới dạng UUID) - để đảm bảo vấn đề bảo mật, tránh sql injection
-- đối với Oracle thì phải tạo Sequence
--! KHI TẠO MỘT BẢNG NÊN CÓ KHOÁ CHÍNH, NHƯNG KHÔNG CÓ KHOÁ CHÍNH VẪN ĐƯỢC (dễ bị nhầm lẫn lúc interview)


--! Xoá bảng
-- DROP TABLE tên_bảng
DROP TABLE baiviet;

--! Lệnh tương tác dữ liệu
--! Thêm dữ liệu vào bảng
INSERT INTO baiviet(tieu_de,noi_dung,ngay_dang) VALUES('tieu de 1','noi dung 1','2025-09-13');
INSERT INTO baiviet(tieu_de,noi_dung,ngay_dang) VALUES('tieu de 2','noi dung 2','2025-09-14');
INSERT INTO baiviet(tieu_de,noi_dung) VALUES('tieu de 3','noi dung 3');
INSERT INTO baiviet(tieu_de,noi_dung) VALUES('tieu de 1','noi dung 2');

--! Xem dữ liệu a.k.a truy vấn dữ liệu -- Query data
SELECT -- chọn xem dữ liệu của các cột nào cần xem trong bảng đang truy vấn
FROM -- chỉ định bảng muốn lấy dữ liệu
WHERE -- Điều kiện để lấy dữ liệu

--! Truy vấn dữ liệu cột càng nhiều thì càng tốn thời gian
--! câu select có chỉ định cột sẽ được thực thi nhanh hơn rất nhiều

-- ví dụ: xem toàn bộ (bên ngoài không khuyến khích xài)
SELECT *
FROM baiviet;

-- ví dụ: xem nội dung của CỘT tiêu đề (tieu_de)
SELECT tieu_de
FROM baiviet;

SELECT *
FROM baiviet
WHERE tieu_de = 'tieu de 1';

--! Xoá dữ liệu
-- Khuyến nghị: Phải có điều kiện WHERE, và có phân biệt hoa thường, dữ liệu sau dấu bằng phải chính xác
-- Nguyên tắc xoá là sẽ duyệt qua từng dòng, sau đó duyệt tới giá trị của cột
DELETE FROM baiviet WHERE tieu_de = 'tieu de 1'; -- DELETE FROM bảng WHERE tên_cột = 'giá trị của dữ liệu muốn xoá'

-- ví dụ: xoá tieu_de nhưng nội dung phải là 'noi dung 1'
DELETE FROM baiviet WHERE tieu_de = 'tieu de 1' AND noi_dung = 'noi dung 1';

-- ví dụ: Trường hợp đã có Khoá chính (cột id),
DELETE FROM baiviet WHERE id=1;

--! Cập nhật dữ liệu
--! PHẢI LUÔN CÓ ĐIỀU KIỆN WHERE ĐỂ TRÁNH GHI ĐÈ HẾT 1 CỘT DỮ LIỆU ==> SẼ DỄ DÀNG HƠN KHI ĐÃ CÓ ĐÁNH INDEX VÀO KHOÁ CHÍNH
--! Nhưng đúng bản chất thì không có điều kiện WHERE vẫn được
UPDATE baiviet SET tieu_de = 'tieu de noi dung 1 update' WHERE id=3;













