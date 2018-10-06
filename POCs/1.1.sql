
/*
---------- bitwise ----------
CREATE TABLE msc.bitwise  
(   
a_int_value int NOT NULL,  
b_int_value int NOT NULL  
);  
GO  
INSERT msc.bitwise VALUES (170, 75), (-170, -75);  
GO

SELECT ~ a_int_value, ~ b_int_value, a_int_value, b_int_value
FROM msc.bitwise;

---------- Operadores unários ----------
DECLARE @Num1 int, @Num2 int;  
SET @Num1 = 5;
SET @Num2 = -5;  

SELECT 
	+@Num1 Plus1, -@Num1 Minun1, ABS(@Num1) ABS1, 
	+@Num2 Plus2, -@Num2 Minun2, ABS(@Num2) ABS2;
GO

---------- Operadores EXCEPT e INTERSECT ----------
select 
	Id
from msc.Pizza
except
select
	IdPizza
from msc.Venda

select 
	Id
from msc.Pizza
intersect
select
	IdPizza
from msc.Venda

---------- Operador UNION e UNION ALL ----------
-- Exemplo 1 ---------------------------------
if OBJECT_ID('msc.ClienteTeste', 'U') IS NOT NULL
drop table msc.ClienteTeste;
go

select 
	Id,
	Nome
into msc.ClienteTeste
from msc.Cliente
where (Id % 2) = 1
UNION
select
	Id, 
	Nome
from msc.Cliente
where (Id % 2) = 0

-- Exemplo 2 ---------------------------------
select 
	Id,
	Nome
from msc.Cliente
where (Id % 2) = 1
UNION
select
	Id, 
	Nome
from msc.Cliente
ORDER BY Nome

-- Exemplo 3 ---------------------------------
--UNION ALL
select Id, Nome, CPF
from msc.Cliente
	UNION ALL
select Id, Nome, CPF
from msc.Cliente
	UNION ALL
select Id, Nome, CPF
from msc.Cliente;

--UNION
select Id, Nome, CPF
from msc.Cliente
	UNION
select Id, Nome, CPF
from msc.Cliente
	UNION
select Id, Nome, CPF
from msc.Cliente;

--UNION ALL & UNION
select Id, Nome, CPF
from msc.Cliente
	UNION ALL
(
	select Id, Nome, CPF
	from msc.Cliente
		UNION
	select Id, Nome, CPF
	from msc.Cliente
);

*/  
