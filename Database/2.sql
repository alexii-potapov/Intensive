USE PAVIntensive;
 
 CREATE TABLE Projects
(
ID_P int IDENTITY PRIMARY KEY,
 Name varchar(50) NOT NULL  
) 
 
 CREATE TABLE Tasks
(
ID_Tsk int IDENTITY PRIMARY KEY,
 Name varchar(50) NOT NULL  ,
  Descrip varchar(255)  ,
   Closed bit  NOT NULL DEFAULT 0,
    Redline date   
) 
 
 CREATE TABLE Tags
(
ID_Tag int IDENTITY PRIMARY KEY,
 Name varchar(50) NOT NULL  
) 
 
 CREATE TABLE TaskTags
(
 
 ID_Tsk int NOT NULL,
 ID_Tag int NOT NULL,
 CONSTRAINT pk_TaskTag PRIMARY KEY (ID_Tsk,ID_Tag)  
) 
 