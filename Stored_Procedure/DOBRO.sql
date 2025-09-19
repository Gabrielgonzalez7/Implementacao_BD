CREATE PROCEDURE usp_dobro(@valor AS INT OUTPUT)
AS
SELECT @valor*2
RETURN

DECLARE @valor AS INT =15;
EXEC usp_dobro @valor OUTPUT;
PRINT @valor;