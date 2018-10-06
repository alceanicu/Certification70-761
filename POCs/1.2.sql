/*
---------------- Exploração das tabelas utilizadas ----------------
--msc.Funcionarios
select 
	* 
from msc.Funcionarios

--msc.Cargos
select 
	* 
from msc.Cargos

---------------- JOIN e INNER JOIN ----------------
SELECT
	f.Nome as Funcionario,
	c.Nome as Cargo
FROM msc.Funcionarios f
INNER JOIN msc.Cargos c 
	on c.Id = f.IdCargo

SELECT
	f.Nome as Funcionario,
	c.Nome as Cargo
FROM msc.Funcionarios f
JOIN msc.Cargos c 
	on c.Id = f.IdCargo
*/



