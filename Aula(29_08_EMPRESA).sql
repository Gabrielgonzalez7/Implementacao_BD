USE EMPRESA;

SELECT D.Dnome, D.Dnumero
FROM DEPARTAMENTO AS D
WHERE EXISTS( 
	SELECT*
	FROM PROJETO AS P
	WHERE P.Dnum =d.Dnumero);

-- Operadores ANY E ALL

--Ex: Encontrar funcionários que ganahm mais do que qualquer funcionario do departamentode Administração 


SELECT F.Pnome, F.Unome, F.Salario
FROM FUNCIONARIO AS F
WHERE F.Salario > ALL(
						SELECT Salario
						FROM FUNCIONARIO
						INNER JOIN DEPARTAMENTO AS D ON Dnr = Dnumero
						WHERE D.Dnome  = 'Adminitração');

-- Encontrar projetos que exigem mais horas do que todos os projeos no local 'ITU' ou 'Santo André'
Select p.Projnome, sum(TE.Horas)
From PROJETO as p
inner join TRABALHA_EM as TE
on Te.Pnr = p.Projnumero
group by p.Projnome
having sum(TE.Horas) > all(
	SELECT SUM(TE.Horas)
	FROM PROJETO AS P
	INNER JOIN TRABALHA_EM AS TE
	ON TE.Pnr = P.Projnumero
	WHERE P.Projlocal = 'itu' or P.Projlocal = 'Santo André'
	GROUP BY P.Projlocal
	);













