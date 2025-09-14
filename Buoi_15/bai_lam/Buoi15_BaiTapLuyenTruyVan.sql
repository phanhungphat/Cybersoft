CREATE DATABASE Books;
USE Books;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    YearPublished INT
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender VARCHAR(10),
    City VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE Borrowings (
    BorrowID INT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Books (BookID, Title, Author, Genre, YearPublished) VALUES
(1, 'Dế Mèn Phiêu Lưu Ký', 'Tô Hoài', 'Thiếu nhi', 1941),
(2, 'Harry Potter 1', 'J.K. Rowling', 'Fantasy', 1997),
(3, 'Harry Potter 2', 'J.K. Rowling', 'Fantasy', 1998),
(4, 'Tắt Đèn', 'Ngô Tất Tố', 'Hiện thực', 1939),
(5, 'Lão Hạc', 'Nam Cao', 'Hiện thực', 1943),
(6, 'Chí Phèo', 'Nam Cao', 'Hiện thực', 1941),
(7, 'Sherlock Holmes', 'Arthur Conan Doyle', 'Trinh thám', 1892),
(8, 'Đắc Nhân Tâm', 'Dale Carnegie', 'Kỹ năng sống', 1936),
(9, 'Cuốn Theo Chiều Gió', 'Margaret Mitchell', 'Lãng mạn', 1936),
(10, '1984', 'George Orwell', 'Chính trị', 1949),
(11, 'Bố Già', 'Mario Puzo', 'Tội phạm', 1969),
(12, 'Sapiens', 'Yuval Noah Harari', 'Lịch sử', 2011),
(13, 'Người Bán Hàng Vĩ Đại Nhất Thế Giới', 'Og Mandino', 'Kỹ năng sống', 1968),
(14, 'Giết Con Chim Nhại', 'Harper Lee', 'Văn học', 1960),
(15, 'Thép Đã Tôi Thế Đấy', 'Nikolai Ostrovsky', 'Cách mạng', 1936),
(16, 'Chiến Tranh và Hòa Bình', 'Leo Tolstoy', 'Lịch sử', 1869),
(17, 'Cánh Đồng Bất Tận', 'Nguyễn Ngọc Tư', 'Hiện thực', 2005),
(18, 'Tôi Thấy Hoa Vàng Trên Cỏ Xanh', 'Nguyễn Nhật Ánh', 'Thiếu nhi', 2010),
(19, 'Một Thoáng Ta Rực Rỡ Ở Nhân Gian', 'Ocean Vuong', 'Tự truyện', 2019),
(20, 'Tuổi Trẻ Đáng Giá Bao Nhiêu', 'Rosie Nguyễn', 'Truyền cảm hứng', 2016),
(21, 'Mắt Biếc', 'Nguyễn Nhật Ánh', 'Lãng mạn', 1990),
(22, 'Nhà Giả Kim', 'Paulo Coelho', 'Tư tưởng', 1988),
(23, 'Kẻ Trộm Sách', 'Markus Zusak', 'Văn học', 2005),
(24, 'Không Gia Đình', 'Hector Malot', 'Phiêu lưu', 1878),
(25, 'Vô Thường', 'Nguyễn Bỉnh Khiêm', 'Triết học', 1600),
(26, 'Hoàng Tử Bé', 'Antoine de Saint-Exupéry', 'Thiếu nhi', 1943),
(27, 'Totto-chan', 'Tetsuko Kuroyanagi', 'Tự truyện', 1981),
(28, 'Con Đường Hồi Giáo', 'Lê Tự Minh', 'Ký sự', 2021),
(29, 'Điều Kỳ Diệu Ở Phòng Giam Số 7', 'Yoo Young-ah', 'Cảm động', 2013),
(30, 'Chiếc Lá Cuối Cùng', 'O. Henry', 'Truyện ngắn', 1907);

INSERT INTO Members (MemberID, Name, Gender, City, JoinDate) VALUES
(1, 'Nguyễn Văn A', 'Nam', 'Hanoi', '2020-01-01'),
(2, 'Trần Thị B', 'Nữ', 'Hanoi', '2020-02-15'),
(3, 'Lê Văn C', 'Nam', 'Hue', '2021-03-20'),
(4, 'Phạm Thị D', 'Nữ', 'Da Nang', '2021-04-25'),
(5, 'Ngô Văn E', 'Nam', 'HCM', '2021-05-30'),
(6, 'Hoàng Thị F', 'Nữ', 'Can Tho', '2021-06-10'),
(7, 'Bùi Văn G', 'Nam', 'Da Nang', '2021-07-15'),
(8, 'Đặng Thị H', 'Nữ', 'Hue', '2021-08-20'),
(9, 'Vũ Văn I', 'Nam', 'Hanoi', '2021-09-25'),
(10, 'Phan Thị K', 'Nữ', 'HCM', '2021-10-01'),
(11, 'Trịnh Văn L', 'Nam', 'Hanoi', '2021-10-10'),
(12, 'Lâm Thị M', 'Nữ', 'HCM', '2021-10-20'),
(13, 'Dương Văn N', 'Nam', 'Hue', '2021-10-30'),
(14, 'Kiều Thị O', 'Nữ', 'Can Tho', '2021-11-01'),
(15, 'Nguyễn Văn P', 'Nam', 'Da Nang', '2021-11-10'),
(16, 'Trần Thị Q', 'Nữ', 'Hanoi', '2021-11-20'),
(17, 'Lê Văn R', 'Nam', 'HCM', '2021-11-30'),
(18, 'Phạm Thị S', 'Nữ', 'Hue', '2021-12-01'),
(19, 'Ngô Văn T', 'Nam', 'Da Nang', '2021-12-10'),
(20, 'Hoàng Thị U', 'Nữ', 'Can Tho', '2021-12-15'),
(21, 'Bùi Văn V', 'Nam', 'HCM', '2022-01-01'),
(22, 'Đặng Thị X', 'Nữ', 'Hue', '2022-01-10'),
(23, 'Vũ Văn Y', 'Nam', 'Hanoi', '2022-01-15'),
(24, 'Phan Thị Z', 'Nữ', 'Da Nang', '2022-01-20'),
(25, 'Trịnh Văn AA', 'Nam', 'Hanoi', '2022-01-25'),
(26, 'Lâm Thị AB', 'Nữ', 'HCM', '2022-02-01'),
(27, 'Dương Văn AC', 'Nam', 'Hue', '2022-02-10'),
(28, 'Kiều Thị AD', 'Nữ', 'Can Tho', '2022-02-15'),
(29, 'Nguyễn Văn AE', 'Nam', 'HCM', '2022-02-20'),
(30, 'Trần Thị AF', 'Nữ', 'Hanoi', '2022-02-25');

INSERT INTO Borrowings (BorrowID, MemberID, BookID, BorrowDate, ReturnDate) VALUES
(1, 1, 1, '2022-03-01', '2022-03-10'),
(2, 2, 3, '2022-03-02', NULL),
(3, 3, 5, '2022-03-05', '2022-03-12'),
(4, 4, 7, '2022-03-06', NULL),
(5, 5, 2, '2022-03-10', '2022-03-15'),
(6, 6, 9, '2022-03-12', '2022-03-22'),
(7, 7, 8, '2022-03-14', NULL),
(8, 8, 10, '2022-03-16', '2022-03-25'),
(9, 9, 12, '2022-03-18', NULL),
(10, 10, 11, '2022-03-20', NULL),
(11, 11, 15, '2022-03-22', '2022-03-30'),
(12, 12, 14, '2022-03-23', NULL),
(13, 13, 4, '2022-03-24', NULL),
(14, 14, 6, '2022-03-25', NULL),
(15, 15, 13, '2022-03-26', '2022-04-01'),
(16, 16, 17, '2022-03-27', NULL),
(17, 17, 16, '2022-03-28', NULL),
(18, 18, 18, '2022-03-29', '2022-04-04'),
(19, 19, 20, '2022-03-30', NULL),
(20, 20, 19, '2022-04-01', NULL),
(21, 21, 21, '2022-04-02', NULL),
(22, 22, 22, '2022-04-03', NULL),
(23, 23, 23, '2022-04-04', '2022-04-10'),
(24, 24, 24, '2022-04-05', NULL),
(25, 25, 25, '2022-04-06', NULL),
(26, 26, 26, '2022-04-07', NULL),
(27, 27, 27, '2022-04-08', '2022-04-15'),
(28, 28, 28, '2022-04-09', NULL),
(29, 29, 29, '2022-04-10', NULL),
(30, 30, 30, '2022-04-11', NULL);

-- DROP DATABASE Books

SELECT *
FROM Books

-- 1. Tìm tất cả các sách thuộc thể loại khoa học
SELECT * 
FROM Books
WHERE Genre = 'Khoa học';

-- 2. Liệt kê các thành viên sống tại thành phố “Hanoi”
SELECT * 
FROM Members
WHERE City = 'Hanoi';


-- 3. Tìm các sách xuất bản sau năm 2015 
SELECT * 
FROM Books
WHERE YearPublished > 2015;

-- 4. Đếm số lượng sách theo từng thể loại
SELECT Genre, COUNT(*) AS TotalBooks
FROM Books
GROUP BY Genre;

-- 5. Liệt kê tên các thành viên và số lần họ mượn sách
SELECT m.Name, COUNT(b.BorrowID) AS TotalBorrowed
FROM Members m
LEFT JOIN Borrowings b ON m.MemberID = b.MemberID
GROUP BY m.Name;

-- 6. Tìm những sách chưa từng được mượn
SELECT b.*
FROM Books b
LEFT JOIN Borrowings br ON b.BookID = br.BookID
WHERE br.BookID IS NULL;

-- 7. Liệt kê các thành viên mượn hơn 5 cuốn sách
SELECT m.Name, COUNT(br.BorrowID) AS TotalBorrowed
FROM Members m
JOIN Borrowings br ON m.MemberID = br.MemberID
GROUP BY m.Name
HAVING COUNT(br.BorrowID) > 5;

-- 8. Tìm thành viên có tổng số ngày giữ sách nhiều nhất
SELECT m.Name, SUM(DATEDIFF(IFNULL(br.ReturnDate, CURDATE()), br.BorrowDate)) AS TotalDays
FROM Members m
JOIN Borrowings br ON m.MemberID = br.MemberID
GROUP BY m.Name
ORDER BY TotalDays DESC
LIMIT 1;

-- 9. Liệt kê tên thành viên và số cuốn sách họ đã mượn kèm số sách chưa trả
SELECT m.Name,
       COUNT(br.BorrowID) AS TotalBorrowed,
       SUM(CASE WHEN br.ReturnDate IS NULL THEN 1 ELSE 0 END) AS NotReturned
FROM Members m
JOIN Borrowings br ON m.MemberID = br.MemberID
GROUP BY m.Name;

-- 10. Liệt kê các thành viên đã mượn sách thể loại “Tiểu thuyết” ít nhất 2 lần
-- lmao đâu có sách thể loại "Tiểu thuyết" đâu
SELECT m.Name, COUNT(*) AS BorrowCount
FROM Members m
JOIN Borrowings br ON m.MemberID = br.MemberID
JOIN Books b ON br.BookID = b.BookID
WHERE b.Genre = 'Tiểu thuyết'
GROUP BY m.Name
HAVING COUNT(*) >= 2;

-- 11. Tìm thành viên đã mượn sách nhưng chưa trả
SELECT DISTINCT m.Name
FROM Members m
JOIN Borrowings br ON m.MemberID = br.MemberID
WHERE br.ReturnDate IS NULL;

-- 12. Liệt kê 3 thể loại sách được mượn nhiều nhất
SELECT b.Genre, COUNT(*) AS BorrowCount
FROM Borrowings br
JOIN Books b ON br.BookID = b.BookID
GROUP BY b.Genre
ORDER BY BorrowCount DESC
LIMIT 3;



















