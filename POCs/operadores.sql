
--STRING_SPLIT
declare @text nvarchar(max) = '0,1,2,3,4,5,6,7,8,9'

select 
	value
from string_split(@text, N',')

--STUFF
declare @exp1 nvarchar(max) = 'Olá, meu nome é Esron!',
		@exp2 nvarchar(max) = 'Hello World!'

select STUFF(@exp1, 1, 4, @exp2)

--ANSI_NULLS
-- Create table t1 and insert values.  
CREATE TABLE dbo.t1 (a INT NULL);  
INSERT INTO dbo.t1 values (NULL),(0),(1);  
GO  

-- Print message and perform SELECT statements.  
PRINT 'Testing default setting';  
DECLARE @varname int;   
SET @varname = NULL;  

SELECT a  
FROM t1   
WHERE a = @varname;  

SELECT a   
FROM t1   
WHERE a <> @varname;  

SELECT a   
FROM t1   
WHERE a IS NULL;  
GO  

-- SET ANSI_NULLS to ON and test.  
PRINT 'Testing ANSI_NULLS ON';  
SET ANSI_NULLS ON;  
GO  
DECLARE @varname int;  
SET @varname = NULL  

SELECT a   
FROM t1   
WHERE a = @varname;  

SELECT a   
FROM t1   
WHERE a <> @varname;  

SELECT a   
FROM t1   
WHERE a IS NULL;  
GO  

-- SET ANSI_NULLS to OFF and test.  
PRINT 'Testing SET ANSI_NULLS OFF';  
SET ANSI_NULLS OFF;  
GO  
DECLARE @varname int;  
SET @varname = NULL;  
SELECT a   
FROM t1   
WHERE a = @varname;  

SELECT a   
FROM t1   
WHERE a <> @varname;  

SELECT a   
FROM t1   
WHERE a IS NULL;  
GO  

-- Drop table t1.  
DROP TABLE dbo.t1;