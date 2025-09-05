-- Criar uma função que retorna nome completo dos funcionario e o valor do salário anual, com férias e décimo terceiro

CREATE FUNCTION fn_SalarioAnual()
RETURNS @Tabela TABLE
(
	NomeCompleto VARCHAR(100),
	SalarioMensal DECIMAL(10,2),
	SalarioAnual DECIMAL(12,2)
)
AS 
BEGIN
	INSERT INTO @Tabela
	SELECT
	CONCAT(F.Pnome, ' ', F.Minicial, ' ', F.Unome),
	F.Salario,
	F.Salario *12
FROM FUNCIONARIO AS F
	RETURN;
END;

GO
SELECT * FROM dbo.fn_SalarioAnual();