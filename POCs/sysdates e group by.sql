
select 
	parse('03/12/2018' as date using 'pt-br') [Date], 
	SYSDATETIME() [SysDateTime], 
	SYSDATETIMEOFFSET() [SysDateTimeOffSet],
	SYSUTCDATETIME() [UTC]



SELECT 
	pc.Name [Category], 
	AVG(ListPrice) [AveragePrice]
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc
	ON pc.ProductCategoryID = p.ProductCategoryID
GROUP BY GROUPING SETS (pc.Name, ())

SELECT 
	pc.Name [Category], 
	AVG(ListPrice) [AveragePrice]
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc
	ON pc.ProductCategoryID = p.ProductCategoryID
GROUP BY ROLLUP (pc.Name)

SELECT 
	pc.Name [Category], 
	AVG(ListPrice) [AveragePrice]
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc
	ON pc.ProductCategoryID = p.ProductCategoryID
GROUP BY CUBE (pc.Name)