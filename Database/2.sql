USE PAVIntensive;
 
 CREATE TABLE Project
(
 ID int IDENTITY PRIMARY KEY,
 name varchar(50) NOT NULL  
) 
 
 CREATE TABLE Task
(
ID int IDENTITY PRIMARY KEY,
  name varchar(50) NOT NULL  ,
  descrip varchar(255)  ,
  closed bit  NOT NULL DEFAULT 0,
  redline date  ,
  project_ID int NOT NULL
) 
 
 CREATE TABLE Tag
(
 ID int IDENTITY PRIMARY KEY,
 name varchar(50) NOT NULL  
) 
 
 CREATE TABLE TaskTag
(
 
 task_ID int NOT NULL,
 tag_ID int NOT NULL,
 CONSTRAINT pk_TaskTag PRIMARY KEY (task_ID,tag_ID)  
) 
