SELECT dbo.fn_Dobro(5) as 'Resultado';

SELECT F.Pnome, F.Salario, dbo.fn_Dobro(F.Salario) AS 'Dobro'
FROM FUNCIONARIO AS F;