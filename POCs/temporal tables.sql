
--Create demo data base
CREATE DATABASE SqlhintsTemporalDemoDB
GO
USE SqlhintsTemporalDemoDB
GO
--Create Temporal Table dbo.Customer
CREATE TABLE dbo.Customer 
(  
  Id INT NOT NULL PRIMARY KEY CLUSTERED,
  Name NVARCHAR(100) NOT NULL, 
  StartTime DATETIME2 GENERATED ALWAYS AS ROW START 
              HIDDEN NOT NULL,
  EndTime   DATETIME2 GENERATED ALWAYS AS ROW END
              HIDDEN NOT NULL ,
  PERIOD FOR SYSTEM_TIME (StartTime, EndTime)   
) 
WITH(SYSTEM_VERSIONING=ON (HISTORY_TABLE=dbo.CustomerHistory))

insert into dbo.Customer 
values(1, 'Érica')
go
waitfor delay '00:02:00'
go
update dbo.Customer
set Name = 'Érica Carolina'
where Id = 1
go
waitfor delay '00:02:00'
go
update dbo.Customer
set Name = 'Érica Carolina da Costa Quinteros'
where Id = 1
go

select Id, Name, StartTime, EndTime from dbo.Customer
select * from dbo.CustomerHistory

------------- Querying temporal tables
--FOR SYSTEM_TIME AS OF
select
	Id,
	Name,
	StartTime,
	EndTime
from dbo.Customer
for system_time as of '2018-11-20 00:44'

--FOR SYSTEM_TIME FROM
select 
	Id,
	Name,
	StartTime,
	EndTime
from dbo.Customer
for system_time from '2018-11-20 00:40' to '2018-11-20 00:42'

--FOR SYSTEM_TIME BETWEEN
select 
	Id,
	Name,
	StartTime,
	EndTime
from dbo.Customer
for system_time between '2018-11-20 00:40' and '2018-11-20 00:44'

--FOR SYSTEM_TIME CONTAINED IN(<start>, <end>)
select 
	Id,
	Name,
	StartTime,
	EndTime
from dbo.Customer
for system_time CONTAINED IN('2018-11-20 00:40', '2018-11-20 00:46')

--FOR SYSTEM_TIME ALL
select 
	Id,
	Name,
	StartTime,
	EndTime
from dbo.Customer
for system_time ALL
ORDER BY StartTime

--------------------------- ALTER TEMPORAL TABLES


CREATE TABLE dbo.product
(  
  Id INT NOT NULL PRIMARY KEY CLUSTERED,
  Name NVARCHAR(100) NOT NULL
)
GO
INSERT INTO dbo.Product VALUES( 1, 'Television')
GO

ALTER TABLE dbo.Product
ADD StartTime DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN DEFAULT GETUTCDATE(),
   EndTime DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN 
	DEFAULT CONVERT(DATETIME2, '9999-12-31 23:59:59.9999999'),
   PERIOD FOR SYSTEM_TIME (StartTime, EndTime) 
   
ALTER TABLE dbo.Product
SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=dbo.ProductHistory))
GO

SELECT Id, Name, StartTime, EndTime FROM dbo.Product
SELECT Id, Name, StartTime, EndTime FROM dbo.ProductHistory

ALTER TABLE dbo.Product
    SET (SYSTEM_VERSIONING = OFF)
GO
--Drop Period definition
ALTER TABLE dbo.Product
DROP PERIOD FOR SYSTEM_TIME
GO
--Now drop Product and ProductHistory tables
DROP TABLE dbo.Product
DROP TABLE dbo.ProductHistory