
--VARIAVEIS
DECLARE @IdProduto int = 100,
		@NomeProduto varchar(30) = 'Jaqueta de couro',
		@Size varchar(1) = 'M',
		@SizeTeste varchar(5) = null,
		@SizeG varchar(1) = 'G',
		@SizeP varchar(1) = 'P',
		@DataVenda datetime = '2018-10-10 00:00:00.000'

--ISNULL
select 
	@Size AS Tamanho, 
	ISNULL(TRY_CAST(@Size as Integer), 0) as TamanhoNumerico


--NULLIF
select 
	@Size as Tamanho,
	NULLIF(@Size, 'M') AS TratamentoNull

--COALESCE
select
	@SizeTeste as TamanhoTeste,
	@Size as Tamanho,
	COALESCE(@SizeTeste, @Size, @SizeG) as TamanhoCoalesce

--CASE
select
	CASE 
		WHEN @SizeTeste is null THEN 'Não identificado'
		ELSE @SizeTeste
	END Tamanho

--CASE SIMPLES
select
	CASE @SizeTeste
		WHEN 'P' THEN 'Pequeno'
		WHEN 'M' THEN 'Médio'
		WHEN 'G' THEN 'Grande'
		ELSE ISNULL(@SizeTeste, 'n/a')
	END as Tamanho