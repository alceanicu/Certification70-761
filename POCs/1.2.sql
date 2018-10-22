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

---------------- LEFT OUTER JOIN ----------------
SELECT
	f.Nome as Funcionario,
	c.Nome as Cargo
FROM msc.Funcionarios f
LEFT OUTER JOIN msc.Cargos c 
	on c.Id = f.IdCargo

---------------- RIGHT OUTER JOIN ----------------
SELECT
	f.Nome as Funcionario,
	c.Nome as Cargo
FROM msc.Funcionarios f
RIGHT OUTER JOIN msc.Cargos c 
	on c.Id = f.IdCargo

---------------- FULL OUTER JOIN ----------------
SELECT
	f.Nome as Funcionario,
	c.Nome as Cargo
FROM msc.Funcionarios f
FULL OUTER JOIN msc.Cargos c 
	on c.Id = f.IdCargo

---------------- CROSS JOIN ----------------
SELECT
	f.Nome as Funcionario,
	c.Nome as Cargo
FROM msc.Funcionarios f
CROSS JOIN msc.Cargos c 

---------------- OPERADORES AND & OR ----------------
SELECT
	f.Nome as Funcionario,
	c.Nome as Cargo
FROM msc.Funcionarios f
JOIN msc.Cargos c 
	ON c.Id = f.IdCargo
	AND (f.Nome = 'João' OR c.Nome = 'Cozinheiro(a)')

---------------- CONSULTAS COM NULLs ----------------
SELECT
	f.Nome as Funcionario,
	c.Nome as Cargo
FROM msc.Funcionarios f
UJOIN msc.Cargos c 
	ON c.Id = f.IdCargo
WHERE c.Id is null
OR f.Id is null

SELECT
	f.Nome as Funcionario,
	c.Nome as Cargo
FROM msc.Funcionarios f
RIGHT JOIN msc.Cargos c 
	ON c.Id = f.IdCargo
WHERE c.Id is null
OR f.Id is null


SELECT
	f.Nome as Funcionario,
	c.Nome as Cargo
FROM msc.Funcionarios f
FULL OUTER JOIN msc.Cargos c 
	ON c.Id = f.IdCargo
WHERE c.Id is null
OR f.Id is null
*/
