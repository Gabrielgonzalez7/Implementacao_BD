--Crie um procedure que faz uma listagem dos funcion�rios por departamento, masse o departamento n�o for especificado, o procedimento lista todos os funcionarios

USE EMPRESA;


CREATE PROCEDURE usp_ListarFuncionariosPorDepartamento
    @Dnr INT = NULL   
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        F.Pnome + ' ' + F.Minicial + ' ' + F.Unome AS [Nome Completo],
        D.Dnome AS [Departamento]
    FROM Funcionario AS F
    INNER JOIN Departamento AS D
        ON F.Dnr = D.Dnumero
    WHERE (@Dnr IS NULL OR F.Dnr = @Dnr);  -- se n�o passar, traz todos
END;
EXEC usp_ListarFuncionariosPorDepartamento @Dnr = 5;
