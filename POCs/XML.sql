-------------------------------------------- Gerando XML 1
select
	ProductID AS [@ProductID],
	Name AS [ProductInfo/@Name],
	ProductNumber AS [ProductInfo/ProductNumber],
	ListPrice AS [ProductInfo/ListPrice],
	ModifiedDate
from SalesLT.Product
FOR XML PATH('Product'), ROOT ('Products')

-------------------------------------------- Gerando XML 2
select
	PC.ProductCategoryID AS [@ProductCategoryID],
	PC.Name AS [@Name],
	(select
		ProductID,
		Name,
		ProductNumber,
		ListPrice,
		ModifiedDate
	from SalesLT.Product P
	where P.ProductCategoryID = PC.ProductCategoryID
	FOR XML PATH('Product'), ROOT ('Products'), TYPE)
from SalesLT.ProductCategory PC
FOR XML PATH ('Category'), ROOT ('Categories')

-------------------------------------------- Gerando XML 3
declare @x xml

set @x =
(select
	ProductID AS [@ProductID],
	Name AS [ProductInfo/@Name],
	ProductNumber AS [ProductInfo/ProductNumber],
	ListPrice AS [ProductInfo/ListPrice],
	ModifiedDate
from SalesLT.Product
FOR XML PATH('Product'), ROOT ('Products'))

select @x


-------------------------------------------- Lendo XML 1
declare @x xml

select @x = P
from openrowset (bulk 'C:\Users\SempreIT\Desktop\Products.xml', single_blob) as Products(P)

select @x

-------------------------------------------- Lendo XML 2
declare @x xml

select @x = P
from openrowset (bulk 'C:\Users\SempreIT\Desktop\Products.xml', single_blob) as Products(P)

declare @hdoc int

exec sp_xml_preparedocument @hdoc OUTPUT, @x

select 
* 
into MyCategories
from  openxml (@hdoc,  'Categories/Category', 1)
WITH (
	ProductCategoryID int,
	Name varchar(100)
)

select 
* 
into MyProducts
from  openxml (@hdoc,  'Categories/Category/Products/Product', 2)
WITH (
	ProductCategoryID int '../../@ProductCategoryID',
	CaName varchar(100) '../../@Name',
	ProductID int,
	Name varchar(100),
	ProductNumber varchar(100),
	ListPrice float,
	ModifiedDate datetime
)

exec sp_xml_removedocument @hdoc

select * from MyCategories
select * from MyProducts

-------------------------------------------- Usando xQuery 1
declare @x xml

set @x = 
'<Category ProductCategoryID="22" Name="Bib-Shorts">
   <Products>
     <Product>
       <ProductID>855</ProductID>
       <Name>Mens Bib-Shorts, S</Name>
       <ProductNumber>SB-M891-S</ProductNumber>
       <ListPrice>89.9900</ListPrice>
       <ModifiedDate>2008-03-11T10:01:36.827</ModifiedDate>
     </Product>
     <Product>
       <ProductID>856</ProductID>
       <Name>Mens Bib-Shorts, M</Name>
       <ProductNumber>SB-M891-M</ProductNumber>
       <ListPrice>89.9900</ListPrice>
       <ModifiedDate>2008-03-11T10:01:36.827</ModifiedDate>
     </Product>
     <Product>
       <ProductID>857</ProductID>
       <Name>Mens Bib-Shorts, L</Name>
       <ProductNumber>SB-M891-L</ProductNumber>
       <ListPrice>89.9900</ListPrice>
       <ModifiedDate>2008-03-11T10:01:36.827</ModifiedDate>
     </Product>
   </Products>
 </Category>
 <Category ProductCategoryID="32" Name="Bottles and Cages">
   <Products>
     <Product>
       <ProductID>870</ProductID>
       <Name>Water Bottle - 30 oz.</Name>
       <ProductNumber>WB-H098</ProductNumber>
       <ListPrice>4.9900</ListPrice>
       <ModifiedDate>2008-03-11T10:01:36.827</ModifiedDate>
     </Product>
     <Product>
       <ProductID>871</ProductID>
       <Name>Mountain Bottle Cage</Name>
       <ProductNumber>BC-M005</ProductNumber>
       <ListPrice>9.9900</ListPrice>
       <ModifiedDate>2008-03-11T10:01:36.827</ModifiedDate>
     </Product>
     <Product>
       <ProductID>872</ProductID>
       <Name>Road Bottle Cage</Name>
       <ProductNumber>BC-R205</ProductNumber>
       <ListPrice>8.9900</ListPrice>
       <ModifiedDate>2008-03-11T10:01:36.827</ModifiedDate>
     </Product>
   </Products>
 </Category>'

--select @x.query('/Category[1]/Products/Product[ProductID="857"]')
--select @x.value('/Category[1]/Products[1]/Product[ProductID="857"][1]/ProductID[1]', 'int')
--select @x.value('/Category[1]/Products[1]/Product[ProductID="857"][1]', 'nvarchar(max)')
--select @x.query('/Category[@ProductCategoryID="22"]'

