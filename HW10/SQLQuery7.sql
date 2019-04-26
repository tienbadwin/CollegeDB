create database MyCollege
go
USE mYCOLLEGE

CREATE TABLE Students(
StuID INT IDENTITY (1,1) NOT NULL PRIMARY KEY CLUSTERED,
FName VARCHAR(50) NOT NULL,
LName VARCHAR(50) NOT NULL,
SSN INT NULL,
Address VARCHAR(100) NOT NULL,
City VARCHAR(20) NOT NULL,
State VARCHAR (20) NOT NULL,
Zip INT NOT NULL,
Phone BIGINT NOT NULL
);

INSERT INTO STUDENTS
VALUES ('Kai','Chan',null ,'1231 Cedar Rd', 'Cleveland', 'OH', 12343, 2341238976),
		('Lina' ,'Johnson',1234, '666 Lake Rd', 'Lakewood', 'OH', 47483, 123767898),
		('Jon','Smith', null,'17384 ABC Rd', 'Beachwood', 'CA', 37897, 1234567854)


CREATE TABLE Classes(
ClassID INT IDENTITY (1,1) NOT NULL PRIMARY KEY CLUSTERED,
ClassName VARCHAR(50) NOT NULL,
Number INT NOT NULL,
Department VARCHAR (50) NOT NULL,
);

INSERT INTO Classes
VALUES ('Math', 101, 'Science'),
		('Computer', 20, 'Science'),
		('Painting', 1, 'Art'),
		('Music', 2, 'Art'),
		('Accountant', 404, 'Business'),
		('Banking', 202, 'Business')

CREATE TABLE StudentClass(
StudentClassID INT IDENTITY NOT NULL PRIMARY KEY CLUSTERED,
StuID INT NOT NULL CONSTRAINT FK_Student_ID1 FOREIGN KEY REFERENCES STudents(StuID),
ClassID INT NOT NULL CONSTRAINT FK_Class_ID1 FOREIGN KEY REFERENCES Classes(ClassID)
)

INSERT INTO StudentClass
VALUES  (1, 1),
		(1, 2),
		(2, 2),
		(2, 3),
		(3, 1),
		(3, 4);
		
CREATE TABLE Test(
TestID INT IDENTITY NOT NULL PRIMARY KEY CLUSTERED,
TestType VARCHAR(20) NOT NULL,
Description VARCHAR(100) NULL
);

INSERT INTO Test
	VALUES ('Quiz' , 'Everyday Quiz'),
			('HW', 'Homework'),
			('Lab', 'Everyday Lab'),
			('Exam', 'Final Exam')


CREATE TABLE ClassTest(
ClassTestID INT IDENTITY NOT NULL PRIMARY KEY CLUSTERED,
ClassID INT NOT NULL CONSTRAINT FK_Class_ID2 FOREIGN KEY REFERENCES Classes(ClassID),
TestID INT NOT NULL CONSTRAINT FK_Test_ID1 FOREIGN KEY REFERENCES Test(TestID),
DateAsigned DATE  NULL,
DateDue DATE  NULL,
PointPossible INT NULL,
);

INSERT INTO ClassTest
VALUES (1,1,'2019-01-01', NULL, 10),
		(1,2,'2019-01-01', NULL, 10),
		(1,4,'2019-04-01', '2019-01-05', 10),
		(2,2,'2019-03-01', '2019-03-05', 10),
		(2,3,'2019-03-02', NULL, 10),
		(2,4,'2019-03-10', NULL, 10),
		(3,2,'2019-03-10',' 2019-03-12', 10),
		(3,4,'2019-03-15',NULL, 10)
		
CREATE TABLE StudentScore(
	StuScoreID INT IDENTITY NOT NULL PRIMARY KEY CLUSTERED,
	StuID INT NOT NULL CONSTRAINT FK_Student_ID2 FOREIGN KEY REFERENCES STudents(StuID),
	StudentClassID INT NOT NULL CONSTRAINT FK_StudentClass_ID1 FOREIGN KEY REFERENCES StudentClass(StudentClassID),
	ClassTestID INT NOT NULL CONSTRAINT FK_ClassTest_ID1 FOREIGN KEY REFERENCES ClassTest(ClassTestID),
	DateSubmitted DATE  NULL,
	PointEarned INT NULL
	);

INSERT StudentScore
VALUES (1,1,1,'2019-01-01',6),
		(1,1,2,'2019-01-06',8),
		(1,1,3,'2019-04-01',4),
		(1,2,4,'2019-03-04',6),
		(1,2,5,'2019-01-02',10),
		(1,2,6,'2019-03-10',8),
		(2,3,4,'2019-03-01',3),
		(2,3,5,'2019-01-02',6),
		(2,3,6,'2019-02-10',6),
		(2,4,7,'2019-03-11',5),
		(2,4,8,'2019-03-15',8),
		(3,5,1,'2019-01-01',9),
		(3,5,2,'2019-01-03',10),
		(3,5,3,'2019-04-01',10);



