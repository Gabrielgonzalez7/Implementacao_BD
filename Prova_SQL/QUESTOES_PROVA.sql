USE FACULDADE

-- Lista o nome dos alunos, o nome das disciplinas e a nota qur o aluno obteve
SELECT A.Nome, D.Nome_Disciplina, HE.Nota
FROM ALUNO A
JOIN HISTORICO_ESCOLAR HE
ON HE.Numero_aluno = A.Numero_aluno
JOIN TURMA T
ON T.Identificacao_turma = HE.Identificacao_turma
JOIN DISCIPLINA D
ON D.Numero_disciplina = T.Numero_disciplina



--Lista o nome da disciplina junto com o numero da disciplina que é pre-requisito

SELECT D.Nome_disciplina, PR.Numero_pre_requisito
FROM DISCIPLINA AS D
JOIN PRE_REQUISITO AS PR
ON PR.Numero_disciplina = D.Numero_disciplina


--Lista as disciplinas, semestre, ano e nota somente doa aluno chamado silva

SELECT A.Nome, D.Nome_disciplina, T.Semestre, T.Ano, HE.Nota
FROM ALUNO AS A
JOIN HISTORICO_ESCOLAR  AS HE
ON HE.Numero_aluno = A.Numero_aluno
JOIN TURMA AS T
ON T.Identificacao_turma = HE.Identificacao_turma
JOIN DISCIPLINA AS D
ON D.Numero_disciplina = T.Numero_disciplina
WHERE A.Nome = 'Silva';

--Resultado é:Um número (a quantidade de alunos)E a lista de nomes de todos os alunos em ordem alfabética, um por linha.

DECLARE @qntAlunos INT, @index INT, @nomeAl VARCHAR(50);

SET @qntAlunos = (SELECT COUNT(*) FROM ALUNO);
SET @index = 1;

PRINT @qntAlunos;

WHILE @index <= @qntAlunos
BEGIN
    -- Exemplo com CURSOR seria melhor
    SELECT TOP 1 @nomeAl = Nome 
    FROM (
        SELECT Nome, ROW_NUMBER() OVER (ORDER BY Nome) AS rn
        FROM ALUNO
    ) AS X
    WHERE rn = @index;

    PRINT @nomeAl;

    SET @index = @index + 1;
END;

--

DECLARE @nomeAluno VARCHAR(50), @nota CHAR(1);

SET @nomeAluno = 'Gabriel Gonzalez';

SELECT @nota = HE.Nota
FROM ALUNO A
JOIN HISTORICO_ESCOLAR HE
  ON HE.Numero_aluno = A.Numero_aluno
WHERE A.Nome = @nomeAluno;

IF @nota IN ('A','B','C')
    PRINT 'ALUNO: ' + @nomeAluno + ' | APROVADO | Nota: ' + @nota;
ELSE
    PRINT 'ALUNO: ' + @nomeAluno + ' | REPROVADO | Nota: ' + @nota;


SELECT A.Nome, HE.Nota
FROM ALUNO A
JOIN HISTORICO_ESCOLAR HE
  ON HE.Numero_aluno = A.Numero_aluno
WHERE A.Nome = 'Gabriel Gonzalez';



--Verificar a lotaçao da turma 112

DECLARE @idTurma INT, @qtdAlunos INT;
SET @idTurma = 112;

SELECT @qtdAlunos = COUNT(A.Numero_aluno) FROM ALUNO AS A
JOIN HISTORICO_ESCOLAR HE
ON HE.Numero_aluno = A.Numero_aluno
JOIN TURMA T
ON T.Identificacao_turma = @idTurma

PRINT 'QUANTIDADE DE ALUNOA: ' + CAST(@qtdAlunos AS VARCHAR(2));

IF @qtdAlunos >=5
    PRINT 'TURMA COMPLETAMNTE LOTADA'
ELSE IF @qtdAlunos <=3 AND @qtdAlunos <=4
    PRINT 'TURMA QUASE CHEIA'
ELSE
    PRINT 'Turma com Vagas' 


--CoLOca um novo aluno com nome. numero, tipo, curso e data de nascimento 

CREATE PROCEDURE InserirAluno
@nomeAluno VARCHAR(50),
@numeroAluno INT, 
@tipoAluno INT,
@curso VARCHAR(3),
@dataNasc DATE
AS
BEGIN
    DECLARE @nome VARCHAR(50);
    SELECT @nome =Nome FROM ALUNO WHERE  Nome = @nomeAluno;
    IF @nome IS NOT NULL
    BEGIN
        PRINT 'ALUNO JÁ EXISTE!!'
        RETURN
    END
    
    INSERT INTO ALUNO (Nome, Numero_aluno, Tipo_aluno, Curso, Data_Nascimento)
    VALUES
    (@nomeAluno, @numeroAluno, @tipoAluno, @curso, @dataNasc)
    END

    EXEC InserirAluno 'Gabriel', 26, 2, 'CC', '1999-05-23'

    SELECT * FROM ALUNO


--Atualiza a nota do ALUNO (PEGANDO O SEU NUMERO)

CREATE PROCEDURE AtualizarNota
@numeroAluno INT,
@idTurma INT,
@novaNota CHAR(1)
AS
BEGIN
    UPDATE HISTORICO_ESCOLAR
    SET
    Identificacao_turma = @idTurma, 
    Nota = @novaNota
    WHERE Numero_aluno = @numeroAluno
 END

 EXEC AtualizarNota 17, 85, 'A'

 SELECT * FROM ALUNO
  
  --
  CREATE PROCEDURE CalcularIdadeAluno
  @numeroAluno INT,
  @idade INT OUTPUT
  AS
  BEGIN
    SELECT @idade =DATEDIFF(YEAR, A.Data_Nascimento, GETDATE())
    FROM ALUNO AS A WHERE A.Numero_aluno = @numeroAluno
END

DECLARE @idadeAluno INT;
PRINT @idadeAluno

EXEC CalcularIdadeAluno 99, @idadeAluno OUTPUT
PRINT 'IDADE:  ' + CAST(@idadeAluno AS CHAR(2));

SELECT * FROM ALUNO