create table Teacher(
SSN int primary key,
Full_Name varchar(100),
Birthdate date,
Teacher_Details_ID int
);

create table Teacher_Deteails(
ID int primary key,
Hiring_date date,
Retyring_date date,
Salary varchar(100)
);

create table Courses(
ID int primary key,
Course_Name varchar(40)
);

create table Student(
SSN int primary key,
Full_name varchar(100),
Birthdate date,
Teacher_SSN int
);

create table Student_Courses(
start_date date,
end_date date,
Student_SSN int,
Course_ID int
);



ALTER TABLE Teacher
ADD CONSTRAINT FK_Teacher
FOREIGN KEY (Teacher_Details_ID) REFERENCES Teacher_Deteails(ID);


ALTER TABLE Student
ADD CONSTRAINT FK_Student
FOREIGN KEY (Teacher_SSN) REFERENCES Teacher(SSN);



ALTER TABLE Student_Courses
ADD CONSTRAINT FK_Student_SSN
FOREIGN KEY (Student_SSN) REFERENCES Student(SSN), 
CONSTRAINT FK_Courses_ID
FOREIGN KEY (Course_ID) REFERENCES Courses(ID);


INSERT INTO Teacher (SSN, Full_Name, Birthdate, Teacher_Details_ID) VALUES 
(101, 'Alice Johnson', '1980-05-15', 1),
(102, 'Bob Smith', '1975-08-20', 2),
(103, 'Carol White', '1982-02-28', 3),
(104, 'David Green', '1979-11-11', 4),
(105, 'Eve Black', '1985-09-25', 5),
(106, 'Frank Miller', '1983-04-10', 6),
(107, 'Grace Wilson', '1981-06-05', 7),
(108, 'Hank Lee', '1977-12-15', 8),
(109, 'Ivy Clark', '1984-03-30', 9),
(110, 'Jack Harris', '1986-07-20', 10);

INSERT INTO Teacher_Deteails (ID, Hiring_date, Retyring_date, Salary) VALUES 
(1, '2010-01-15', '2045-01-15', '50000'),
(2, '2005-03-20', '2040-03-20', '55000'),
(3, '2012-06-25', '2047-06-25', '53000'),
(4, '2008-09-10', '2043-09-10', '57000'),
(5, '2015-11-05', '2050-11-05', '52000'),
(6, '2011-04-20', '2046-04-20', '54000'),
(7, '2009-07-15', '2044-07-15', '51000'),
(8, '2006-12-01', '2041-12-01', '56000'),
(9, '2013-08-30', '2048-08-30', '58000'),
(10, '2014-02-15', '2049-02-15', '59000');

INSERT INTO Courses (ID, Course_Name) VALUES 
(1, 'Mathematics'),
(2, 'Physics'),
(3, 'Chemistry'),
(4, 'Biology'),
(5, 'English'),
(6, 'History'),
(7, 'Geography'),
(8, 'Computer Science'),
(9, 'Physical Education'),
(10, 'Art');

INSERT INTO Student (SSN, Full_name, Birthdate, Teacher_SSN) VALUES 
(201, 'John Doe', '2000-01-01', 101),
(202, 'Jane Doe', '2000-02-02', 102),
(203, 'Jim Brown', '2000-03-03', 103),
(204, 'Jill White', '2000-04-04', 104),
(205, 'Jack Black', '2000-05-05', 105),
(206, 'Jenny Green', '2000-06-06', 106),
(207, 'Joe Blue', '2000-07-07', 107),
(208, 'Judy Pink', '2000-08-08', 108),
(209, 'Jeff Gray', '2000-09-09', 109),
(210, 'Julia Red', '2000-10-10', 110);

INSERT INTO Student_Courses (start_date, end_date, Student_SSN, Course_ID) VALUES 
('2023-01-15', '2023-06-15', 201, 1),
('2023-01-15', '2023-06-15', 202, 2),
('2023-01-15', '2023-06-15', 203, 3),
('2023-01-15', '2023-06-15', 204, 4),
('2023-01-15', '2023-06-15', 205, 5),
('2023-01-15', '2023-06-15', 206, 6),
('2023-01-15', '2023-06-15', 207, 7),
('2023-01-15', '2023-06-15', 208, 8),
('2023-01-15', '2023-06-15', 209, 9),
('2023-01-15', '2023-06-15', 210, 10);


SELECT * FROM Teacher;
SELECT * FROM Teacher_Deteails;
SELECT * FROM Courses;
SELECT * FROM Student;
SELECT * FROM Student_Courses;

