6. 
SELECT *  FROM Task t ;  
 
7. 
SELECT t.ID, t.name , t.descrip, t.closed, t.redline, p.name FROM Task t LEFT JOIN Project p ON t.project_ID = p.ID; 
 
8. 
SELECT * FROM Task t ORDER BY t.redline DESC; 
 
9. 
SELECT COUNT(*) FROM Task t GROUP BY t.redline; 
 
10.1 
INSERT INTO dbo.Project(name) 
  VALUES('Интенсив') 

10.2 
 INSERT INTO dbo.Task 
(   name  ,descrip  ,closed  ,redline  ,project_ID ) 
VALUES 
(   'Изучение sql'    ,''    ,0    ,DATEADD(DY,3,GETDATE())    ,1   ) 
 
 11. 
UPDATE dbo.Project  
SET 
  name = 'Интенсив - Потапов А.В.' -- name - varchar(50) NOT NULL 
WHERE 
  ID = (SELECT ID FROM Project p WHERE p.name='Интенсив'); 
 
12.
DECLARE @ListTaskID int;

SELECT @ListTaskID = p.ID
FROM Project p
   WHERE p.name='Список задач';


INSERT INTO  dbo.Task
  (name,project_ID)
SELECT 
  p.name, @ListTaskID  
FROM Project p
WHERE p.name NOT IN (SELECT name FROM Task t WHERE t.project_ID=@ListTaskID) 
      AND p.ID<> @ListTaskID   ;
 
13.  
Delete * from task; 
 
 
14. 
ALTER TABLE Task 
ADD modification_date DATETIME; 
 
  
CREATE TRIGGER dbo.update_modif_date 
ON Task 
AFTER update  
  AS  
 UPDATE Task 
   SET  modification_date = GETDATE()  
   FROM  inserted 
   WHERE task.ID = inserted.ID ; 
