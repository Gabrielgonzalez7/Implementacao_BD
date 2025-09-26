USE FACULDADE

-- Lista todos os alunos da tabela aluno
SELECT * FROM ALUNO

--Mostra os noms e cursos de todos os alunos do curso CC

SELECT Nome, Curso from ALUNO
where Curso = 'CC';

-- Encontre o aluno com Numero_aluno=1
SELECT * FROM ALUNO
WHERE Numero_aluno = 1;

--Liste todas as disciplinas do departamento 'MAT'
Select * From DISCIPLINA
 WHERE Departamento = 'MAT';
 
 --Mostre todas as turmas do semestre 'SEGUNDO'

 SELECT * FROM ALUNO
 ORDER BY Nome ASC;

 --Liste todos os alunos em ordem alfabetica pela nome

 Select * from ALUNO
 ORDER BY Nome ASC;

 --Mostre todas as disciplinas em ordem decrescente pelo numero de credito
 
 Select * From DISCIPLINA
 ORDER BY Creditos DESC;

 -- Quantos alunos existem na tabela ALUNO 
 SELECT COUNT(*) AS Total_Alunos FROM ALUNO;

 --Quantas turmas existem para a disciplina 'CC1310'

 Select COUNT(*) AS Total_Turmas FROM TURMA
 WHERE Numero_disciplina = 'CC1310';

 --Quantos alunos cursaram a disciplina 'MAT2410'

 Select COUNT(DISTINCT HE.Numero_Aluno) AS Alunos_MAT2410
 FROM HISTORICO_ESCOLAR AS HE
 JOIN TURMA T ON HE.Identificacao_turma= T.Identificacao_turma
 WHERE T.Numero_disciplina = 'MAT2410';

 --Liste os nomes dos alunos e suas notas em todas as turmas 

 SELECT A.Nome, HE.Nota
 FROM HISTORICO_ESCOLAR AS HE
 JOIN ALUNO AS A ON HE.Numero_aluno = A.Numero_aluno;

 --Mostre o nome da disciplina e o nome do professir que a ministra

 SELECT D.Nome_disciplina, T.Professor
 FROM TURMA AS T
 JOIN DISCIPLINA AS D ON T.Numero_disciplina = D.Numero_disciplina;

 --Liste todos os alunos cujo nome começa com 'A'

 Select * From ALUNO
 Where Nome like 'A%';

 --Liste todas as disciplinas cujo nome contenha a palavra 'dados'

 Select * From DISCIPLINA as D
 where Nome_disciplina LIKE '%dados%';