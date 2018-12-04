


create table dbo.Produto
(
	Id int identity primary key not null,
	Nome nvarchar(30) not null,
	Fabricante nvarchar(30) not null,
	ValorUnitario money not null
)

insert dbo.Produto (Nome, Fabricante, ValorUnitario)
values
	('Playstation 4', 'Playstation', 1800.00),
	('Xbox One', 'Microsoft', 1750.00),
	('Zenfone Go', 'Asus', 600.00),
	('iPhone 7', 'Apple', 1999.99),
	('Laptop', 'Dell', 2959.99)

--Create VIEW
create view vwProdutos AS
SELECT
	Id as [Codigo],
	Nome as [Produto],
	Fabricante,
	ValorUnitario
FROM dbo.Produto

--Alter VIEW
ALTER view vwProdutos AS
SELECT
	Id as [Codigo],
	Nome as [Produto],
	Fabricante,
	ValorUnitario as [Preco]
FROM dbo.Produto

--Update table via VIEW
update vwProdutos
set Produto = 'Laptop Inspiron'
where Codigo = 5


select * from dbo.Produto p
select * from vwProdutos