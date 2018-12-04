
create table Funcionarios
(
	IdFuncionario int identity primary key,
	Nome nvarchar(30) not null,
	Cargo nvarchar(30) not null,
	IdGestor int 
)

insert Funcionarios
	(Nome, Cargo, IdGestor)
values
	('Esron', 'CEO', null),
	('Maria', 'CTO', null),
	('João', 'CTO', 1),
	('Frodo', 'CTO', 2),
	('Smeagle', 'CTO', 4)


;with cteFuncionarios as 
(
	select 
		IdFuncionario, 
		Nome, 
		Cargo, 
		IdGestor,
		1 as Hierarquia
	from Funcionarios
	where IdGestor is null
	union all
	select 
		f.IdFuncionario, 
		f.Nome, 
		f.Cargo, 
		f.IdGestor,
		cteFuncionarios.Hierarquia + 1
	from Funcionarios as f
	inner join cteFuncionarios on cteFuncionarios.IdFuncionario = f.IdGestor
)

select 
	* 
from cteFuncionarios
order by Hierarquia

;with cte_num as
(
	select 1 as num
	union all
	select 
		num + 1
	from cte_num
	where num < 180
),
cte_numeros as 
(
	select 150 as numero
	union all 
	select numero + 1
	from cte_numeros
	where numero < 250
)

select
	num
from cte_num
except
select 
	numero
from cte_numeros
option (maxrecursion 199)