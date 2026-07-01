create DATABASE Library_Management;
USE Library_Management ;
CREATE TABLE Books (
BookID int primary key ,
Title varchar(100) , 
Author varchar(100) ,
Price decimal(10,2)
);
insert into Books ( BookID ,Title, Author, Price )
values
(1,'clean code','Robert Martin',350.00),
(2,'Database system','Elmasri',450.00),
(3,'Python Basics','John Smith ',250.00);

select * from Books ;

 insert into Books values (4,'c programming ','Dennis Ritchie', 400.00);

update Books 
SET price = 500
where BookID = 2;
CREATE TABLE Members (
MemberID int primary key ,
Name varchar(100) , 
Phone varchar(20) ,
Email varchar(100)
);
INSERT INTO Members
VALUES
(1,'Nada Yassin','01011111111','nada@gmail.com'),
(2,'Walid Ali','01022222222','ahmed@gmail.com'),
(3,'Sara Mohamed','01033333333','sara@gmail.com');
select * from Members;
CREATE TABLE Borrowings (
    BorrowID INT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
DROP TABLE Members;
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);
select * from Members;
INSERT INTO Members
VALUES
(1,'Nada Yassin','01011111111','nada@gmail.com'),
(2,'Walid Ali','01022222222','ahmed@gmail.com'),
(3,'Sara Mohamed','01033333333','sara@gmail.com');
select * from Members;
CREATE TABLE Borrowings (
    BorrowID INT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Borrowings
VALUES
(1,1,2,'2026-07-02','2026-07-09'),
(2,2,1,'2026-07-03','2026-07-10'),
(3,3,3,'2026-07-04','2026-07-11');
SELECT
    Members.Name,
    Books.Title,
    Borrowings.BorrowDate,
    Borrowings.ReturnDate
FROM Borrowings
JOIN Members ON Borrowings.MemberID = Members.MemberID
JOIN Books ON Borrowings.BookID = Books.BookID;
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);
INSERT INTO Categories
VALUES
(1,'Programming'),
(2,'Database'),
(3,'Networking');
ALTER TABLE Books
ADD CategoryID INT;
ALTER TABLE Books
ADD CONSTRAINT FK_Category
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);
UPDATE Books
SET CategoryID=1
WHERE BookID=1;

UPDATE Books
SET CategoryID=2
WHERE BookID=2;

UPDATE Books
SET CategoryID=1
WHERE BookID=3;
SELECT
B.Title,
B.Author,
C.CategoryName
FROM Books B
JOIN Categories C
ON B.CategoryID=C.CategoryID;
