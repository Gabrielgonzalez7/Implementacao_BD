CREATE DATABASE DB_TEMPORAL;
GO

USE DB_TEMPORAL;
GO

CREATE TABLE InventarioCarros (
	Id INT IDENTITY PRIMARY KEY,
	Ano INT,
	Marca VARCHAR(40),
	Modelo VARCHAR(40),
	Cor VARCHAR(10),
	Quilometragem INT,
	Disponivel BIT NOT NULL DEFAULT 1,
	SysStartTime datetime2 GENERATED ALWAYS AS ROW START NOT NULL,
	SysEndTime datetime2 GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
)
WITH
(
	SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.InventarioCarros_Historico)
);
GO

-- Inserindo alguns registros
INSERT INTO InventarioCarros (Ano, Marca, Modelo, Cor, Quilometragem, Disponivel) 
VALUES (2004, 'Fiat', 'Uno', 'Branco', 150000, 1),
       (2015, 'Ford', 'Ka', 'Preto', 30000, 1),
       (2022, 'Hyundai', 'HB20', 'Prata', 0, 1),
       (2022, 'Hyundai', 'HB20', 'Branco', 0, 1);
GO

-- Consultas
SELECT * FROM InventarioCarros;
SELECT * FROM dbo.InventarioCarros_Historico;

-- Atualizações (geram versões no histórico)
UPDATE InventarioCarros SET Disponivel = 0 WHERE Id = 1;
UPDATE InventarioCarros SET Disponivel = 0 WHERE Id = 2;
GO



