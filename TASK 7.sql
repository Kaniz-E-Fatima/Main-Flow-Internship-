USE StudentManagement;

CREATE VIEW student_scores AS
SELECT StudentID, Name, 'Math' AS Subject, MathScore AS Score FROM Students
UNION ALL
SELECT StudentID, Name, 'Science', ScienceScore FROM Students
UNION ALL
SELECT StudentID, Name, 'English', EnglishScore FROM Students;

SELECT * FROM student_scores;
