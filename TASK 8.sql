USE StudentManagement;

CREATE TABLE StudentUpdateLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    OldMathScore INT,
    OldScienceScore INT,
    OldEnglishScore INT,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
select * from StudentUpdateLog;

-- Creating AFTER UPDATE Trigger
DELIMITER //

CREATE TRIGGER log_student_update
AFTER UPDATE ON Students
FOR EACH ROW
BEGIN
    IF OLD.MathScore != NEW.MathScore 
        OR OLD.ScienceScore != NEW.ScienceScore 
        OR OLD.EnglishScore != NEW.EnglishScore THEN
        INSERT INTO StudentUpdateLog (StudentID, OldMathScore, OldScienceScore, OldEnglishScore, UpdatedAt)
        VALUES (OLD.StudentID, OLD.MathScore, OLD.ScienceScore, OLD.EnglishScore, NOW());
    END IF;
END;
//

DELIMITER ;

SELECT * FROM Students WHERE StudentID = 3;

UPDATE Students
SET MathScore = MathScore + 1
WHERE StudentID = 3;

SELECT * FROM StudentUpdateLog;
