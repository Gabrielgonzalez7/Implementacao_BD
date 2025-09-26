USE FACULDADE

-- 1) Liste o nome do aluno e o numero(QUANTIDADE) de disciplinas que ele cursou

SELECT A.Nome, COUNT(HE.Identificacao_turma) AS Total_Disciplinas
FROM ALUNO AS A
LEFT JOIN HISTORICO_ESCOLAR AS HE ON A.Numero_aluno = HE.Numero_aluno
GROUP BY A.Nome;

-- 2) Mosdtre os alios que tiveram nota 'F' em alguma disciplina

Select DISTINCT A.Nome
FROM ALUNO AS A
JOIN HISTORICO_ESCOLAR AS HE ON A.Numero_aluno = HE.Numero_aluno
WHERE HE.Nota = 'F';

-- 3) Liste o nome do aluno e a média de notas convertidas em números (A=4, B=3, C=2, F=0)

Select A.Nome, AVG(
	CASE HE.Nota
		WHEN 'A' THEN 4
		WHEN 'B' THEN 3
		WHEN 'C' THEN 2
		WHEN 'F' THEN 0
END
) AS Media
FROM ALUNO AS A
JOIN HISTORICO_ESCOLAR AS HE ON A.Numero_aluno = HE.Numero_aluno
GROUP BY A.Nome;

-- 4) Liste todas as disciplinas que possume pre-requisitos

Select D.Nome_disciplina, P.Numero_pre_requisito
From DISCIPLINA as D
JOIN PRE_REQUISITO P ON D.Numero_disciplina = P.Numero_disciplina

-- 5) Liste todos os professores e quantas turmas cada um ministra

Select Professor, COUNT(*) AS Total_Turmas
From TURMA AS T
GROUP BY Professor;


--6) Mostre os alunos que cursaram mais de 2 disicplinas 

Select a.Nome, COUNT(HE.Identificacao_turma) AS Total_Disciplinas
FROM ALUNO AS A
JOIN HISTORICO_ESCOLAR AS HE ON A.Numero_aluno = HE.Numero_aluno
GROUP BY A.Nome
HAVING COUNT(HE.Identificacao_turma) >2;


--7) Liste todos os alunos que cursaram a disciplina de	'Banco de dados'

Select A.Nome
From ALUNO as A
JOIN HISTORICO_ESCOLAR AS HE ON A.Numero_aluno = HE.Numero_aluno
JOIN TURMA AS T ON HE.Identificacao_turma = T.Identificacao_turma
WHERE T.Numero_disciplina = 'CC3380';

--8) Mostre os alunos e suas disciplinas com notas maiores ou iguais a B

Select a.Nome
From ALUNO as A 
JOIN HISTORICO_ESCOLAR AS HE ON A.Numero_aluno = HE.Numero_aluno
JOIN TURMA T ON HE.Identificacao_turma = T.Identificacao_turma
JOIN DISCIPLINA AS D ON T.Numero_disciplina = D.Numero_disciplina
WHERE HE.Nota IN ('A' , 'B');

--9) Liste os alunos do curso 'CC' QUE AINDA NAO CURSARAM 'ESTRUTURA DE DADOS'

SELECT A.Nome
FROM ALUNO AS A
WHERE A.Curso = 'CC'
AND A.Numero_aluno NOT IN(
SELECT HE.Numero_Aluno
From HISTORICO_ESCOLAR AS HE
JOIN TURMA AS T ON HE.Identificacao_turma = T.Identificacao_turma
WHERE T.Numero_disciplina = 'CC3320'
);

--10) Liste cada disciplina e a quantidade de alunos que cursaram 

SELECT D.Nome_disciplina, COUNT(DISTINCT HE.Numero_aluno) AS Total_Alunos
FROM DISCIPLINA AS D
JOIN TURMA AS T ON D.Numero_disciplina = T.Numero_disciplina
JOIN HISTORICO_ESCOLAR AS HE ON T.Identificacao_turma = HE.Identificacao_turma
GROUP BY D.Nome_disciplina;


