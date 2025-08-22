
USE EMPRESA;

SELECT F.Pnome, F.Unome, D.Dnome
FROM FUNCIONARIO AS F
INNER JOIN DEPARTAMENTO AS D
ON F.Dnr = Dnumero
WHERE D.dNOME = 'PESQUISA';

--

SELECT *
FROM FUNCIONARIO AS F
INNER JOIN TRABALHA_EM AS TE
ON TE.FCpf = F.Cpf;
INNER JOIN PROJETO AS P
ON TE.Pnr = P.Projnumero;
WHERE P.Projnome = 'ProdutoX';

--

SELECT P.ProjNumero, D.Dnumero, F.Unome, F.Endereco, F.Datanasc
FROM PROJETO AS P
INNER JOIN DEPARTAMENTO AS D
      ON P.Dnum = D.Dnumero;
INNER JOIN FUNCIONARIO AS F
      ON D.Cpf_gerente = F.Cpf;
WHERE P.ProjLocal = 'Mauá';

--
SELECT
F.Pnome AS 'F_Nome'
F.Unome AS 'F_Sobrenome'
S.Pnome AS 'Supervisor'
FROM FUNCIONARIO AS F;
LEFT JOIN FUNCIONARIO AS S -- Supervisores
ON F.Cpf_supervisor = S.Cpf;

--

SELECT *
FROM DEPARTAMENTO AS D
LEFT JOIN FUNCIONARIO AS F
	ON D.Dnumero = F.Dnr
WHERE F.Cpf IS NULL

SELECT *
FROM FUNCIONARIO AS F
LEFT JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero;
WHERE F.Fnr IS NULL

-- FULL JOIN
SELECT *
FROM FUNCIONARIO AS F
FULL JOIN DEPARTAMENTO AS D
ON  F.Dnr = D.Dnumero;

-- UNION
SELECT F.Pnome, F.Sexo,F.Datanasc
FROM FUNCIONARIO AS F
UNION
SELECT D.Nome_dependente, D.Sexo, D.Datanasc
FROM DEPENDENTE AS D

--
SELECT P.ProjLocal
FROM PROJETO AS P 
UNION
SELECT L.Dlocal
FROM LOCALIZACAO_DEP AS L 

-- UNION ALL(PERMITE DUPLICATAS)


-- EXCEPT
--Exemplo 1)
SELECT F.Cpf
FROM FUNCIONARIO AS F
EXCEPT
SELECT D.Cpf_gerente
FROM DEPARTAMENTO AS D

--Exemplo 2) QUEM NÃO É SUPERVISOR 

SELECT F.Pnome, F.Unome
FROM FUNCIONARIO AS F
WHERE F.Cpf IN(
					SELECT F.Cpf
					FROM FUNCIONARIO AS F
					EXCEPT
					SELECT F.Cpf_supervisor
					FROM FUNCIONARIO AS F);

-- Group By

--Count
SELECT COUNT(F.Cpf) AS 'N_FUNCIONARIOS', D.Dnome AS 'DPT:'
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
GROUP BY D.Dnome

--Sum(Somar salario)

Select SUM(F.Salario) AS 'SALARIO:', D.Dnome AS 'DPT:'
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
ON F.Dnr = D.Dnumero
GROUP BY D.Dnome

--AVG(Média de horas trabalhadas)

SELECT P.Projnome AS 'PROJETO:', AVG(TE.Horas)
FROM TRABALHA_EM AS TE
INNER JOIN PROJETO AS P
	ON TE.Pnr = P.Projnumero
	GROUP BY P.Projnome

--Agrupor por sexo
SELECT COUNT(*), F.Sexo
FROM FUNCIONARIO AS F
GROUP BY F.Sexo

-- Maior salario de cada departamento
Select MAX(F.Salario) AS 'SALARIO:', D.Dnome AS 'DPT:'
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
ON F.Dnr = D.Dnumero
GROUP BY D.Dnome

--HAVING 
	-- Encontrar departamentos com mais de 3 funcianarios 
Select count(F.Cpf) AS 'Num_Funcionários:', D.Dnome AS 'Departamento:'
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
ON F.Dnr = D.Dnumero
GROUP BY D.Dnome
HAVING count(F.Cpf) >3;

	-- No minimo, 50 horas de trabalho
	SELECT P.Projnome AS 'PROJETO:', SUM(TE.Horas) AS 'Horas:'
FROM TRABALHA_EM AS TE
INNER JOIN PROJETO AS P
	ON TE.Pnr = P.Projnumero
	GROUP BY P.Projnome
	HAVING SUM(TE.Horas) >=50;

--EXISTS
SELECT F.Pnome, F.Unome, F.Cpf
FROM FUNCIONARIO AS F
WHERE EXISTS( 
				SELECT 1
				FROM DEPARTAMENTO AS D
				WHERE D.Cpf_gerente = F.Cpf
				);
