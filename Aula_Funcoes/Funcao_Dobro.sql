--FUNÇÕES 

CREATE FUNCTION fn_Dobro(@Numero INT)
RETURNS INT
AS 
BEGIN
	RETURN @Numero*2;
END;

