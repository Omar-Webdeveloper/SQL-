create database Orange_Library;

use Orange_Library;
create table Books(
BookID int primary key,
Title varchar(100) not null,
AuthorID int unique,
PublishedYear date not null,
CopiesAvailable int,
BookCategory varchar(100) not null
); 

use Orange_Library;
create table Authors(
AuthorID  int primary key,
FirstName varchar(100) not null,
LastName varchar(100),
BirthYear date not null,
); 

use Orange_Library;
insert into Books 
(BookID,Title,AuthorID,PublishedYear,CopiesAvailable,BookCategory)
values 
(1, 'The Great Gatsby', 101, '1925-03-12', 5, 'Fiction'),
(2, '1984', 102, '1949-03-18', 3, 'Dystopian'),
(3, 'To Kill a Mockingbird', 103, '1960-01-21', 7, 'Classic'),
(4, 'A Brief History of Time', 104, '1988-12-31', 4, 'Science'),
(5, 'The Catcher in the Rye', 105, '1951-02-01', 6, 'Literature');


use Orange_Library;
insert into Authors 
(AuthorID,FirstName,LastName,BirthYear)
values 
(101, 'F. Scott', 'Fitzgerald', '1896-02-01'),
(102, 'George', 'Orwell', '1903-02-01'),
(103, 'Harper', 'Lee', '1926-02-01'),
(104, 'Stephen', 'Hawking', '1942-02-01'),
(105, 'J.D.', 'Salinger', '1919-02-01');


select * from Books;
select * from Authors;

use Orange_Library;
select * from books order by CopiesAvailable DESC;

--Q3
--Operand data type date is invalid for avg operator.
--use Orange_Library;
--select *,AVG(PublishedYear) AS Avrage_book  from Books order by AuthorID ;

--use Orange_Library;
--SELECT AVG(PublishedYear) AS Average_Publication_Year
--FROM Books;

--use Orange_Library;
--select *,AVG(CopiesAvailable) AS Avrage_book  from Books Group by AuthorID ;

USE Orange_Library;
SELECT AVG(YEAR(PublishedYear)) AS Average_Publication_Year
FROM Books;



use Orange_Library;
select COUNT(*)AS Books_Number from Books;

use Orange_Library;
truncate table Books;

use Orange_Library;
ALTER TABLE Authors
ADD Email varchar(100),Phone_Number varchar(20);

DROP table Authors;