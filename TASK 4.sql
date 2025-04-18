USE StudentManagement;

# Adding Total Column 
ALTER TABLE Students
ADD TotalScore INT;

#Populating the cloumn 
UPDATE Students
SET TotalScore = MathScore + ScienceScore + EnglishScore;

#Verifying the update 
SELECT 
    StudentID,
    Name,
    MathScore,
    ScienceScore,
    EnglishScore,
    (MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students;
