---------------- RANK()
select 
	RANK() OVER(ORDER BY LineTotal DESC) as [Rank],
	SOD.SalesOrderID,
	SOD.ProductID,
	SOD.LineTotal
from SalesLT.SalesOrderDetail SOD


select 
	RANK() OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC) as [RankPartition],
	SOD.SalesOrderID,
	SOD.ProductID,
	SOD.LineTotal
from SalesLT.SalesOrderDetail SOD

---------------- ROW_NUMBER()
select 
	ROW_NUMBER() OVER(ORDER BY LineTotal DESC) AS [RowNo],
	SOD.SalesOrderID,
	SOD.ProductID,
	SOD.LineTotal
from SalesLT.SalesOrderDetail SOD


select 
	ROW_NUMBER() OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC) AS [RowNoPartition],
	SOD.SalesOrderID,
	SOD.ProductID,
	SOD.LineTotal
from SalesLT.SalesOrderDetail SOD

---------------- DENSE_RANK()
select 
	DENSE_RANK() OVER(ORDER BY LineTotal DESC) AS [DenseRank],
	SOD.SalesOrderID,
	SOD.ProductID,
	SOD.LineTotal
from SalesLT.SalesOrderDetail SOD

select 
	DENSE_RANK() OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC) AS [DenseRankPartition],
	SOD.SalesOrderID,
	SOD.ProductID,
	SOD.LineTotal
from SalesLT.SalesOrderDetail SOD

---------------- NTILE()
select 
	NTILE(4) OVER(ORDER BY LineTotal DESC) AS [NTILE],
	SOD.SalesOrderID,
	SOD.ProductID,
	SOD.LineTotal
from SalesLT.SalesOrderDetail SOD

select 
	NTILE(4) OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC) AS [NTILEPartition],
	SOD.SalesOrderID,
	SOD.ProductID,
	SOD.LineTotal
from SalesLT.SalesOrderDetail SOD