CREATE PROCEDURE usp_AtualizarSalarioFuncionario
	@Cpf VARCHAR(11),
	@NovoSalario DECIMAL(10,2)
AS
BEGIN
	UPDATE FUNCIONARIO
	SET Salario = @NovoSalario
	WHERE Cpf = @Cpf;
END;
	
	EXEC usp_AtualizarSalarioFuncionario '12345678966', 15000.00;

	Select * from FUNCIONARIO;

