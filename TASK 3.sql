USE StudentManagement;

-- Task 1: Identify Top Students by Total Scores
SELECT s.Name, s.TotalScore
FROM (
    SELECT 
        Name, 
        (MathScore + ScienceScore + EnglishScore) AS TotalScore
    FROM Students
) AS s
ORDER BY s.TotalScore DESC
LIMIT 5;
