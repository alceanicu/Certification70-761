
IF OBJECT_ID('dbo.StudentSource') is null and object_id('dbo.StudentTarget') is null
begin
	create table StudentSource(
		Id int primary key,
		Name nvarchar(20)
	)
	
	create table StudentTarget(
		Id int primary key,
		Name nvarchar(20)
	)
	
	Insert into StudentSource (Id, Name) Values (1, 'Mike M.'), (2, 'Sara')
	
	Insert StudentTarget (Id, Name) Values (1, 'Mike'), (3, 'John')
end
/*
select * from dbo.StudentSource
select * from dbo.StudentTarget


DROP TABLE dbo.StudentSource
DROP TABLE dbo.StudentTarget
*/

--Merge example
MERGE INTO StudentTarget as T
USING StudentSource as S
ON T.Id = S.Id
WHEN MATCHED THEN
	UPDATE SET T.Name = S.Name
WHEN NOT MATCHED BY TARGET THEN
	INSERT (Id, Name) VALUES (S.Id, S.Name);
WHEN NOT MATCHED BY SOURCE THEN
	DELETE;