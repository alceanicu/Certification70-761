CREATE FUNCTION SalesLT.udfCustomersByCity
(@City AS VARCHAR(20))
RETURNS TABLE
AS
RETURN
(SELECT C.CustomerID, FirstName, LastName, AddressLine1, City, StateProvince
 FROM SalesLT.Customer C JOIN SalesLT.CustomerAddress CA
 ON C.CustomerID=CA.CustomerID
 JOIN SalesLT.Address A ON CA.AddressID=A.AddressID
 WHERE City=@City);


SELECT * FROM SalesLT.udfCustomersByCity('Bellevue')

---------------------------------------------------
create function teste(@num int)
returns int
as
begin
declare @ret int;

select @ret = @num + 10

return @ret;
end;

---------------------------------------------------
alter function testetable(@num int)
returns table
as
return
select 1 as col1, 2 as col2 , @num as col3


select * from dbo.testetable(5)