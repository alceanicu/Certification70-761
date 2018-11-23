
--select '' for json path;

--select ' ' as blank for json path;

--select GETDATE() as date for json path;

--select 'word"' string for json path;

--select 'Delimited'+char(9) as tab for json path;

--select 'Delimited'+char(9)+char(10)+char(13) as tab for json path;

--select 'escape  \  @' as escapekey, convert(varbinary(8), 'test') as var for json path;

--select 10 as integer for json path;

--select 10 as integer for json auto;

--select * from SalesLT.Product for json auto

-------------------------------------- Gerando JSON

select 1 as 'ProductID', 'Apple' as 'ProductName'

select 1 as 'ProductID', 'Apple' as 'ProductName'
for json path;
[{"ProductID":1,"ProductName":"Apple"}]

select 1 as 'ProductID', 'Apple' as 'ProductName'
for json path, WITHOUT_ARRAY_WRAPPER;
{"ProductID":1,"ProductName":"Apple"}

select 1 as 'Product.ID', 'Apple' as 'Product.Name'
for json path;
[{"Product":{"ID":1,"Name":"Apple"}}]

select 1 as 'AdventureWorks.Product.ID', 'Apple' as 'AdventureWorks.Product.Name'
for json path;
[{"AdventureWorks":{"Product":{"ID":1,"Name":"Apple"}}}]

declare @products table(ID int, Name nvarchar(100))
insert into @products
values (1, 'Apple'),
       (2, 'Orange')

select
	ID as 'ID',
	Name AS 'Name'
from @products
for json path;
[{"ID":1,"Name":"Apple"},{"ID":2,"Name":"Orange"}]

select
	C.CustomerID as [CustomerID],
	C.FirstName as [CustomerDetails.FirstName],
	C.LastName as [CustomerDetails.LastName],
	(
		select
			A.AddressLine1,
			A.City,
			A.StateProvince,
			case 
				when len(A.AddressLine1) > 18 then 'Home'
			else
				'Office'
			end TypeAddress
		from SalesLT.CustomerAddress CA
			inner join SalesLT.Address A
				on CA.AddressID = A.AddressID
		where CA.CustomerID = C.CustomerID
		for json path
	) as [CustomerDetails.Address]
from SalesLT.Customer C
where C.CustomerID between 29500 and 29505
order by CustomerID
for json path, INCLUDE_NULL_VALUES;

select
	C.CustomerID as [CustomerID],
	C.FirstName as [CustomerDetails.FirstName],
	C.LastName as [CustomerDetails.LastName],
	(
		select
			A.AddressLine1,
			A.City,
			A.StateProvince,
			case 
				when len(A.AddressLine1) > 18 then 'Home'
			else
				'Office'
			end TypeAddress
		from SalesLT.CustomerAddress CA
			inner join SalesLT.Address A
				on CA.AddressID = A.AddressID
		where CA.CustomerID = C.CustomerID
		for json path
	) as [CustomerDetails.Address]
from SalesLT.Customer C
where C.CustomerID between 29500 and 29505
order by CustomerID
for json path, root ('Customers');


select
	C.CustomerID,
	C.FirstName,
	C.LastName,
	A.AddressLine1,
	A.City,
	A.StateProvince,
	case 
		when len(A.AddressLine1) > 18 then 'Home'
	else
		'Office'
	end TypeAddress
from SalesLT.Customer C
	inner join SalesLT.CustomerAddress CA
		on CA.CustomerID = C.CustomerID
	inner join SalesLT.Address A
		on A.AddressID = CA.AddressID
where C.CustomerID between 29500 and 29505
order by CustomerID
for json auto, root('Customers');

----- OPENJSON
declare @json nvarchar(200) = '[{"ProductID":1,"ProductName":"Apple"},{"ProductID":2,"ProductName":"Microsoft"}]'

if isjson(@json) = 1
begin
	select
	*
	from openjson(@json)
	with (
		ProductID int '$.ProductID',
		ProductName nvarchar(100) '$.ProductName'
	)
end
else
	print 'Invalid JSON'