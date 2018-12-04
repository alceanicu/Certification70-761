create table ProductSales
(
	Product nvarchar(30) not null,
	Brazil money,
	UnitedStates money,
	Mexico money
)


insert into 
	ProductSales (Product, Brazil, UnitedStates, Mexico)
values 
	('Playstation', 2000.00, 1200.00, 1500.00),
	('iPhone', 3000.00, 1300.00, 1800.00)

-- UNPIVOT
select 
	Product,
	Country,
	Price
from ProductSales
UNPIVOT
(
	Price
	FOR Country IN (Brazil, UnitedStates, Mexico)
) AS UnPivotEx

--PIVOT
SELECT 
	Product,
	Brazil, Mexico, UnitedStates
FROM ProductSalesPivot
PIVOT
(
	SUM(Price)
	FOR Country
	IN (Brazil, Mexico, UnitedStates)
) as PivotEx