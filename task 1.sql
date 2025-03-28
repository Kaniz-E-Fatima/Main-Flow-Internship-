#Creating a database
CREATE DATABASE StudentManagement;
USE StudentManagement;

#Creating a table with the given attributes 
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Gender VARCHAR(1) CHECK (Gender IN ('M', 'F')),
    Age INT,
    Grade VARCHAR(10),
    MathScore INT CHECK (MathScore BETWEEN 0 AND 100),
    ScienceScore INT CHECK (ScienceScore BETWEEN 0 AND 100),
    EnglishScore INT CHECK (EnglishScore BETWEEN 0 AND 100)
);
SELECT * FROM Students;

#Populating the table 
INSERT INTO Students VALUES (NULL,'Sumaeyya', 'F', 20, 'A', 85, 90, 88);
INSERT INTO Students VALUES (NULL,'Sofia', 'F', 20, 'B', 78, 85, 80);
INSERT INTO Students VALUES (NULL,'Kaniz', 'F', 20, 'A', 92, 95, 94);
INSERT INTO Students VALUES (NULL,'Zunaira', 'F', 20, 'C', 65, 70, 68);
INSERT INTO Students VALUES (NULL,'Maryam', 'F', 20, 'B', 80, 83, 85);
INSERT INTO Students VALUES (NULL,'Hussain', 'M', 20, 'A', 88, 89, 87);
INSERT INTO Students VALUES (NULL,'Hasnain', 'M', 20, 'B', 76, 79, 81);
INSERT INTO Students VALUES (NULL,'Alamdar', 'M', 20, 'C', 69, 72, 70);
INSERT INTO Students VALUES (NULL,'Najaf', 'M', 20, 'A', 90, 91, 92);
INSERT INTO Students VALUES (NULL,'Ahmed', 'M', 20, 'B', 77, 78, 76);

#Displaying all students data
SELECT * FROM Students;

#Calculating average of each subject
SELECT 
    AVG(MathScore) AS AvgMathScore,
    AVG(ScienceScore) AS AvgScienceScore,
    AVG(EnglishScore) AS AvgEnglishScore
FROM Students;

#Finding the top performer 
SELECT Name, (MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students
ORDER BY TotalScore DESC
LIMIT 1;

#Doing grade distribution based on the students
SELECT Grade, COUNT(*) AS StudentCount
FROM Students
GROUP BY Grade;

#Calculating average scores of male and female students 
SELECT Gender, AVG(MathScore) AS AvgMath, AVG(ScienceScore) AS AvgScience, AVG(EnglishScore) AS AvgEnglish
FROM Students
GROUP BY Gender;

#Finding the students who got above 80 in maths
SELECT * FROM Students WHERE MathScore > 80;

#Updating a student's record 
UPDATE Students
SET Grade = 'A'
WHERE StudentID = 5; 
SELECT * FROM Students;
