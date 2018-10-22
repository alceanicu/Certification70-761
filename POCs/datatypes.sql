
--VARIAVEIS
DECLARE @IdProduto int = 100,
		@NomeProduto varchar(30) = 'Jaqueta de couro',
		@Size varchar(1) = 'M',
		@DataVenda datetime = '2018-10-10 00:00:00.000'

--CAST
select CAST(@IdProduto as varchar(5)) + ': ' + @NomeProduto as Produto

--TRY_CAST
select 
	@Size AS Tamanho, 
	TRY_CAST(@Size as Integer) as TamanhoNumerico

--CONVERT
select CONVERT(varchar(5), @IdProduto) + ': ' + @NomeProduto as Produto

--CONVERT DATES
select 
	@DataVenda as DataVenda,
	CONVERT(nvarchar(30), @DataVenda) as DataConvertida,
	CONVERT(nvarchar(30), @DataVenda, 126) as DataConvertidaISO8601

--TRY_CONVERT
select 
	@Size AS Tamanho, 
	TRY_CONVERT(Integer, @Size) as TamanhoNumerico