USE EMPRESA
DECLARE @idade INT,
		@nome  VARCHAR(40),
		@data DATE,
		@grana MONEY;

SET @NOME = 'Gabriel Argimon Gonzalez'
SET @DATA = '1999-05-23'
SET @GRANA = 60
SET @IDADE = 2025 - YEAR(@DATA);

SELECT @NOME AS 'Nome', @data AS 'Data_Nasci',
		@idade as 'Idade', @grana as 'Saldo';

PRINT 'Meu nome é: ' + @NOME
	+', nascido em: ' + cast(@DATA as varchar(11))


	-- Recupe o nome do departamento com Dnumero = 4.
DECLARE @dpt_nome VARCHAR(100);

SELECT @dpt_nome = D.Dnome
FROM DEPARTAMENTO AS D
WHERE D.Dnumero = 4;
PRINT @dpt_nome;

--Convert
DECLARE @nome_funcionario VARCHAR(100), 
		@salario DECIMAL(10,2)
SET @nome_funcionario = 'Jenifer';

SELECT @salario = F.Salario
FROM FUNCIONARIO AS F
WHERE F.Pnome = @nome_funcionario;
PRINT 'O funcionario(a)' +@nome_funcionario
		+ 'teu seu salario= ' + CAST(@salario AS VARCHAR(10));

PRINT 'O Funcionario' +@nome_funcionario + 'tem seu salario= ' + CONVERT(VARCHAR(10), @salario);

SELECT F.Pnome, CONVERT(VARCHAR(10), F.Datanasc, 110) AS 'Data_nasc'
FROM FUNCIONARIO AS F


-- IF / ELSE
--ex)Verificar se o uncionario recebe abaico da media salarial 


DECLARE @salario_medio DECIMAL(10,2), 
		@salario_func DECIMAL(10,2),
		@nome_func VARCHAR(100) = 'Jorge';

SELECT @salario_medio = AVG(F.Salario)
FROM FUNCIONARIO AS F

SELECT @salario_func = F.Salario 
FROM FUNCIONARIO AS F
WHERE F.Pnome = @nome_func;

IF @salario_func < @salario_medio
PRINT @nome_func + ' recebe abaixo da media'
ELSE
PRINT @nome_func + ' recebe acima da media'

--Verificar se um funcionario está proximo de se aposentar
 
 SELECT F.Pnome, YEAR(GETDATE()) - YEAR(F.Datanasc) AS 'Idade'
 FROM FUNCIONARIO AS F

 DECLARE	@nome_aposentadoria VARCHAR(100) = 'Joice',
			@idade_aposentadoria INT;

SELECT @idade_aposentadoria = YEAR(GETDATE()) - YEAR(F.Datanasc)
FROM FUNCIONARIO AS F
WHERE F.Pnome = @nome_aposentadoria;

IF @idade_aposentadoria > 55 and @idade_aposentadoria <=60
	PRINT 'Aposentadoria chegando'
ELSE IF @idade_aposentadoria > 61 AND @idade_aposentadoria <80
	PRINT 'Deveria estar aposentado'
ELSE IF @idade_aposentadoria > 80
	PRINT 'FAZENDO HORA EXTRA...'
ELSE
	PRINT 'FLOR DA IDADE'


--
DECLARE @QtdFuncionario INT;
SELECT @QtdFuncionario = COUNT(F.Cpf)
FROM FUNCIONARIO AS F
INNER JOIN DEPARTAMENTO AS D
ON F.Dnr = D.Dnumero
WHERE D.Dnome = 'Pesquisa';
PRINT @QtdFuncionario;

IF(@QtdFuncionario <=1)
	PRINT 'Pequeno';
ELSE IF (@QtdFuncionario >= 2 AND @QtdFuncionario <=3)
	PRINT 'Médio';
ELSE 
	PRINT 'Grande';

--WHILE
--Exemplo) Aumentar o salario da "Joice Leite" em 5% repetida,emte até que ele chegue e, R$30.000

DECLARE @salario DECIMAL(10,2);
SELECT @salario = F.Salario
FROM FUNCIONARIO AS F
WHERE F.Pnome = 'Joice' AND F.Unome = 'Leite';
PRINT @salario;

WHILE(@salario <= 30000)
	BEGIN
	PRINT @salario;
	SET @salario = @salario * 1.05;
	END;
PRINT @salario;















