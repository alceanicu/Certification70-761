-- Setup
CREATE VIEW [SalesLT].[Customers]
as
select distinct firstname,lastname
from saleslt.customer
where lastname >='m'
or customerid=3;
GO
CREATE VIEW [SalesLT].[Employees]
as
select distinct firstname,lastname
from saleslt.customer
where lastname <='m'
or customerid=3;
GO

-- Union example
SELECT FirstName, LastName, 'Employee' as Type
FROM SalesLT.Employees
UNION ALL
SELECT FirstName, LastName, 'Customer'
FROM SalesLT.Customers
ORDER BY LastName;


