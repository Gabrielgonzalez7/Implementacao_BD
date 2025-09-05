-- CRIAR UMA FUNÇÃO QUE CALCULA A IDADE DE UMM FUNCIONARIO COM BASE NA DATA DE NASCIMENTO 

	CREATE FUNCTION Fn_CalculaIdade(@DataNasc DATE)
	RETURNS INT 
	AS 
	BEGIN 
		DECLARE @Idade INT;
		SET @Idade = DATEDIFF(YEAR, @DataNasc, GETDATE());

		IF(MONTH(@DataNasc) >MONTH(GETDATE()) AND DAY(@DataNasc) > DAY(GETDATE()))
		OR (MONTH(@DataNasc) = MONTH(GETDATE()) AND DAY(@DataNasc) > DAY(GETDATE()))
		SET @Idade = @Idade - 1;
	RETURN @Idade;
END;

GO
SELECT F.Pnome, F.Datanasc, dbo.fn_CalculaIdade(Datanasc) AS Idade
FROM FUNCIONARIO AS F
