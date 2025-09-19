-- Crie um procedure que insira um novo funcionário no banco
USE EMPRESA;

ALTER PROCEDURE usp_InserirFuncionario
@Pnome VARCHAR(15),
@Minicial VARCHAR(15),
@Unome VARCHAR(15),
@CPF VARCHAR(11)

AS
BEGIN
	IF EXISTS(
	SELECT *
	FROM FUNCIONARIO  AS F
	WHERE F.Pnome = @Pnome
	AND F.Minicial = @Minicial
	AND F.Unome = @UNOME
	)
	BEGIN
	PRINT 'Já existe funcionario com este nome';
	RETURN;
	END
	INSERT INTO FUNCIONARIO (Pnome, Minicial, Unome, CPF)
	VALUES(@Pnome, @Minicial, @Unome, @CPF);
	END

EXEC usp_InserirFuncionario 'Gabriel', 'A', 'Gonzalez', '0374403046';

 SELECT *FROM FUNCIONARIO;
