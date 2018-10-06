
/*
create schema msc
select * from INFORMATION_SCHEMA.TABLES

create table msc.Cargos
(
	Id INT IDENTITY PRIMARY KEY,
	Nome nvarchar(25) not null
)
go

create table msc.Funcionarios
(
	Id INT IDENTITY PRIMARY KEY,
	IdCargo int foreign key references msc.Cargos(Id),
	Nome nvarchar(25) not null,
	CPF nchar(11) not null  
)
go

create table msc.Pizza
(
	Id INT IDENTITY PRIMARY KEY,
	Nome nvarchar(25) not null,
	Valor decimal(6,2) not null
)
go

create table msc.Cliente
(
	Id INT IDENTITY PRIMARY KEY,
	Nome nvarchar(100) not null,
	CPF nchar(11) not null,
	DDDCelular nchar(2),
	Celular nchar(9),
	DDDTelefone nchar(2),
	Telefone nchar(8),
	Cidade nvarchar(50),
	Estado nvarchar(50)
)
go

create table msc.Venda
(
	Id INT IDENTITY PRIMARY KEY,
	IdCliente int foreign key references msc.Cliente(Id),
	IdPizza int foreign key references msc.Pizza(Id),
	Quantidade int not null,
	ValorTotal decimal(6,2)
)
go

insert into msc.Pizza 
	(Nome, Valor)
values 
	('Queijo', 20.00),
	('Calabresa', 20.00),
	('Frango', 20.00),
	('Atum', 20.00),
	('Caipira', 25.00),
	('Portuguesa', 25.00),
	('Baiana', 25.00),
	('Pepperoni', 30.00),
	('Vegetariana', 30.00)
go

insert into msc.Cliente
	(
		Nome,
		CPF,
		DDDCelular,
		Celular,
		DDDTelefone,
		Telefone,
		Cidade,
		Estado
	)
values
	('Esron', '12345678910', '11', '113456789', null, null, 'Osasco', 'SP'),
	('Diego', '11345678910', null, null, '11', '12145678', 'Carapicuíba', 'SP'),
	('Dhiego', '12145678910', '11', '123156789', null, null, 'Osasco', 'SP'),
	('Caio', '12315678910', null, null, '11', '12341678', 'Barueri', 'SP'),
	('Greg', '12341678910', '11', '123451789', null, null, 'Osasco', 'SP'),
	('John', '12345178910', '11', '123456189', null, null, 'Carapicuíba', 'SP'),
	('Judith', '12345618910', null, null, '11', '12345671', 'Cotia', 'SP'),
	('Ana', '12345671910', '11', '123456781', null, null, 'Osasco', 'SP'),
	('João', '12345678110', '11', '122456789', null, null, 'Barueri', 'SP'),
	('Maria', '12345678911', '11', '123256789', null, null, 'Osasco', 'SP')
go

insert into msc.Venda
	(
		IdCliente,
		IdPizza,
		Quantidade,
		ValorTotal
	)
values
	(1, 3, 4, (select Valor*4 from msc.Pizza where Id = 3)),
	(3, 1, 2, (select Valor*2 from msc.Pizza where Id = 1)),
	(5, 2, 3, (select Valor*3 from msc.Pizza where Id = 2)),
	(2, 3, 2, (select Valor*2 from msc.Pizza where Id = 3)),
	(7, 5, 1, (select Valor*1 from msc.Pizza where Id = 5)),
	(9, 7, 2, (select Valor*2 from msc.Pizza where Id = 7))
go

insert msc.Cargos 
	(
		Nome
	)
values
	('Caixa'),
	('Cozinheiro(a)'),
	('Gerente'),
	('Faxineira(o)')
go

insert msc.Funcionarios 
	(
		IdCargo, 
		Nome, 
		CPF
	)
values
	(1 ,'João', '12345678910'),
	(1 ,'Maria', '22345678910'),
	(2 ,'Tadeu', '32345678910'),
	(4 ,'Sérgio', '42345678910'),
	(2 ,'Bela', '52345678910'),
	(null, 'Joana', '62345678910')
go

*/







