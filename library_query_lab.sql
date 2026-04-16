
CREATE DATABASE library_query_lab;
USE library_query_lab;

CREATE TABLE MEMBER (
    MemberID INT PRIMARY KEY,
    FullName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Age INT CHECK (Age >= 12),
    Phone VARCHAR(15) NOT NULL DEFAULT 'N/A'
);
CREATE TABLE BOOK (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    ISBN VARCHAR(20) NOT NULL UNIQUE,
    Price DECIMAL(8,2) CHECK (Price >= 0),
    Availability ENUM('AVAILABLE','BORROWED') DEFAULT 'AVAILABLE'
);
CREATE TABLE BORROW (
    BorrowID INT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    BorrowDate DATE NOT NULL,
    FOREIGN KEY (MemberID) REFERENCES MEMBER(MemberID),
    FOREIGN KEY (BookID) REFERENCES BOOK(BookID)
);

INSERT INTO MEMBER VALUES
(1,'Joty Amir','joty@gmail.com',22,'01711111111'),
(2,'Fariya','fariya@gmail.com',19,'01722222222'),
(3,'Pranto','pranto@gmail.com',25,'N/A'),
(4,'Alvi','Alvi@gmail.com',17,'01833333333'),
(5,'Elma','elma@gmail.com',30,'01944444444'),
(6,'Raisa','raisa@gmail.com',16,'N/A'),
(7,'Ayesha','ayesha@gmail.com',21,'01755555555'),
(8,'Fazilat','fazilat@gmail.com',18,'01766666666');

INSERT INTO BOOK VALUES
(1,'Data Structures','ISBN101',1200,'AVAILABLE'),
(2,'Database Systems','ISBN102',1500,'BORROWED'),
(3,'C Programming','ISBN103',800,'AVAILABLE'),
(4,'Operating Systems','ISBN104',1800,'AVAILABLE'),
(5,'Computer Networks','ISBN105',2000,'BORROWED'),
(6,'AI Basics','ISBN106',2500,'AVAILABLE'),
(7,'Python Data Science','ISBN107',1700,'BORROWED'),
(8,'Web Development','ISBN108',900,'AVAILABLE');

INSERT INTO BORROW VALUES
(1,1,2,'2026-04-01'),
(2,2,5,'2026-04-02'),
(3,3,7,'2026-04-03'),
(4,4,1,'2026-04-04'),
(5,5,3,'2026-04-05'),
(6,6,4,'2026-04-06'),
(7,7,6,'2026-04-07'),
(8,8,8,'2026-04-08'),
(9,1,5,'2026-04-09'),
(10,2,1,'2026-04-10');

SELECT * FROM MEMBER;
SELECT * FROM BOOK;
SELECT * FROM BORROW;

SELECT DISTINCT Availability FROM BOOK;
SELECT * FROM MEMBER
WHERE Age >= 18;
SELECT * FROM BOOK
WHERE Price BETWEEN 500 AND 2000;

SELECT * FROM BOOK
WHERE Availability IN ('AVAILABLE','BORROWED');
SELECT * FROM MEMBER
WHERE FullName LIKE 'A%' OR FullName LIKE '%n';
SELECT * FROM MEMBER
WHERE Phone <> 'N/A' AND Age > 20;

SELECT * FROM MEMBER
WHERE Age NOT BETWEEN 12 AND 17;
SELECT * FROM BOOK
WHERE Title LIKE '%Data%' OR Title LIKE '%Database%';

SELECT * FROM BOOK
ORDER BY Price DESC
LIMIT 3;

SELECT * FROM BOOK
ORDER BY Price ASC
LIMIT 2;

SELECT COUNT(*) AS TotalMembers FROM MEMBER;
SELECT COUNT(*) AS TotalBooks FROM BOOK;
SELECT COUNT(*) AS TotalBorrows FROM BORROW;

SELECT 
    AVG(Price) AS AvgPrice,
    MIN(Price) AS MinPrice,
    MAX(Price) AS MaxPrice
FROM BOOK;

SELECT Availability, COUNT(*) AS TotalBooks
FROM BOOK
GROUP BY Availability;

SELECT MemberID, COUNT(*) AS TotalBorrowed
FROM BORROW
GROUP BY MemberID;