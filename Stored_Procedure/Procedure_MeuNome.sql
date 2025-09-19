CREATE PROCEDURE usp_ExibirMeuNome(@nome VARCHAR(100))
AS
BEGIN
	PRINT @nome;
END;
EXEC usp_ExibirMeuNome 'Gabriel Argimon Gonzalez';