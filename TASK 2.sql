USE StudentManagement;

ALTER TABLE Students ADD COLUMN email VARCHAR(100);
UPDATE Students 
SET email = CONCAT('student', StudentID, '@example.com') 
WHERE email IS NULL OR email = '';
SELECT * FROM Students;

CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_description TEXT
);
SELECT * FROM Courses;

INSERT INTO Courses (course_name, course_description) VALUES
('Mathematics', 'Advanced algebra and calculus'),
('Physics', 'Mechanics and thermodynamics'),
('Chemistry', 'Organic and inorganic chemistry'),
('Biology', 'Cell biology and genetics'),
('Computer Science', 'Programming and algorithms'),
('History', 'World history and civilizations'),
('Geography', 'Physical and human geography'),
('Economics', 'Micro and macroeconomics'),
('Philosophy', 'Ethics and logic'),
('Psychology', 'Behavioral and cognitive psychology');
SELECT * FROM Courses;

CREATE TABLE Enrolments (
    enrolment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrolment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);
SELECT * FROM Enrolments;

INSERT INTO Enrolments (student_id, course_id, enrolment_date) VALUES
(1, 1, '2024-03-01'),
(1, 5, '2024-03-02'),
(2, 2, '2024-03-01'),
(3, 3, '2024-03-03'),
(4, 4, '2024-03-04'),
(5, 5, '2024-03-05'),
(6, 6, '2024-03-06'),
(7, 7, '2024-03-07'),
(8, 8, '2024-03-08'),
(9, 9, '2024-03-09');
SELECT * FROM Enrolments;

#TASK-1 List all students and the courses they are enrolled in.
SELECT s.name AS student_name, c.course_name
FROM Students s
INNER JOIN Enrolments e ON s.StudentID = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;
#student name(s.name) and the course name(c.course_name) is extracted form the students and course tables 
#where Students is the primary table from which data is selected and am alias s is used for easier querying 
#An inner join is used to join the Students table with the Enrolments table which matches students with their enrollments based on student_id. Only students who have enrolled in at least one course will be included.
#An inner join is used to join the Courses table with the Enrolments table which It matches courses based on course_id. Only enrolled courses will be shown.

#TASK-2  Find the number of students enrolled in each course.
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrolments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;
#course id(c.course_id) and course name(c.course_name) is extracted from the Course table and a count of the students(COUNT(e.student_id)) in the Enrollments table is extracted as student_count
#(FROM Courses c)The query starts from the Courses table
#A left join is used to match the course_id from Courses and Enrollments tables
#It ensures that each course appears only once in the output.

#TASL-3 List students who have enrolled in more than one course.
SELECT s.StudentID, s.name, COUNT(e.course_id) AS course_count
FROM Enrolments e
JOIN Students s ON e.student_id = s.StudentID
GROUP BY s.StudentID, s.name
HAVING COUNT(e.course_id) > 1;
#Student id(course_id) and student name(s.name) are extracted form the Students table and a count of course id(e.course_id) in the Enrollments table is extracted as course_count
#(FROM Enrolments e)The query starts from the Enrolments table
#(JOIN Students s ON e.student_id = s.StudentID) It matches students based on student_id, allowing us to retrieve student names.
#(GROUP BY s.StudentID, s.name)It ensures each student appears only once in the result
#(HAVING COUNT(e.course_id) > 1;)IT show the students who are enrolled in more than one course.

#TASK-4  Find courses with no enrolled students.
SELECT c.course_id, c.course_name
FROM Courses c
LEFT JOIN Enrolments e ON c.course_id = e.course_id
WHERE e.enrolment_id IS NULL;
#course id(c.course_id) and course name(c.course_name) is extracted from the Courses table 
#(FROM Courses c) the query starts from the Courses table
#A left join is used to join the course_id from the Courses and the Enrollments tables 
#(WHERE e.enrolment_id IS NULL;) it is used to find the students who are not enrolled in any course 