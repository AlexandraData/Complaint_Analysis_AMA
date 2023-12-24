-- View all records 
SELECT * FROM dataset_elogio;
SELECT * FROM dataset_reclamacao;
SELECT * FROM dataset_sugestao;
SELECT * FROM  dataset_pontos_atendimento;

-- Check for Duplicate values 
SELECT Local_Atendimento, COUNT(Local_Atendimento)
FROM dataset_pontos_atendimento
GROUP BY Local_Atendimento
HAVING COUNT(Local_Atendimento) > 1;

-- Extract the Year from "Data de submissão"
SELECT SUBSTR(`Data de submissão`, 7, 4) AS Ano FROM dataset_elogio;
SELECT SUBSTR(`Data de submissão`, 7, 4) AS Ano FROM dataset_reclamacao;
SELECT SUBSTR(`Data de submissão`, 7, 4) AS Ano FROM dataset_sugestao;

-- Substitute NULL by text in "Motivo" Column
SELECT IF(Motivo IS NULL OR  Motivo = '', 'Não indicado', Motivo) AS Motivo FROM dataset_elogio;
SELECT IF(Motivo IS NULL OR  Motivo = '', 'Não indicado', Motivo) AS Motivo FROM dataset_reclamacao;
SELECT IF(Motivo IS NULL OR  Motivo = '', 'Não indicado', Motivo) AS Motivo FROM dataset_sugestao;

-- Exploring the concept of UNION the 3 tables
SELECT 
	SUBSTR(`Data de submissão`, 7, 4) AS Ano,
	CASE 
		WHEN `Tipo (R/E/S)` = 'E' THEN 'Elogio'
	ELSE 'Outro'
	END AS 'Tipo',
	`Canal atendimento`,
	Entidade,
	Local,
	IF(Motivo IS NULL OR  Motivo = '', 'Não indicado', Motivo) AS Motivo,
	`Tempo médio de resposta (dias)`
FROM dataset_elogio
UNION ALL
SELECT 	
	SUBSTR(`Data de submissão`, 7, 4) AS Ano,
	CASE 
		WHEN `Tipo (R/E/S)` = 'R' THEN 'Reclamação'
	ELSE 'Outro'
	END AS 'Tipo',
	`Canal atendimento`,
	Entidade,
	Local,
	IF(Motivo IS NULL OR  Motivo = '', 'Não indicado', Motivo) AS Motivo,
	`Tempo médio de resposta (dias)`
FROM dataset_reclamacao
UNION ALL
SELECT 
		SUBSTR(`Data de submissão`, 7, 4) AS Ano,
	CASE 
		WHEN `Tipo (R/E/S)` = 'S' THEN 'Sugestão'
	ELSE 'Outro'
	END AS 'Tipo',
	`Canal atendimento`,
	Entidade,
	Local,
	IF(Motivo IS NULL OR  Motivo = '', 'Não indicado', Motivo) AS Motivo,
	`Tempo médio de resposta (dias)`
FROM dataset_sugestao;


SELECT
	SUBSTR('e.Data de submissão', 7, 4) AS Ano,
	SUBSTR('s.Data de submissão', 7, 4) AS Ano,
	CASE 
		WHEN 'e.Tipo (R/E/S)' = 'S' THEN 'Sugestão'
	ELSE 'Outro'
	END AS 'E.Tipo',
	CASE 
		WHEN 's.Tipo (R/E/S)' = 'S' THEN 'Sugestão'
	ELSE 'Outro'
	END AS 'S.Tipo',
'e.Canal atendimento',
's.Canal atendimento',
e.Entidade,
s.Entidade,
e.Local,
s.Local,
IF(e.Motivo IS NULL OR  e.Motivo = '', 'Não indicado', e.Motivo) AS Motivo,
IF(s.Motivo IS NULL OR  s.Motivo = '', 'Não indicado', s.Motivo) AS Motivo,
'e.Tempo médio de resposta (dias)',
's.Tempo médio de resposta (dias)',
a.Latitude,
a.Longitude
FROM dataset_elogio e
LEFT JOIN dataset_pontos_atendimento a
	ON e.Local = a.Local_Atendimento
LEFT JOIN dataset_sugestao s
	ON s.Local = a.Local_atendimento;

-- Exploring the concept of UNION the 3 tables
SELECT *
FROM dataset_elogio
UNION ALL
SELECT *
FROM dataset_reclamacao
UNION ALL
SELECT * 
FROM dataset_sugestao;

-- Table "elogio" Selection
SELECT
	SUBSTR(`Data de submissão`, 7, 4) AS Ano,
	CASE 
		WHEN `Tipo (R/E/S)` = 'E' THEN 'Elogio'
	ELSE 'Outro'
	END AS 'Tipo',
`Canal atendimento`,
Entidade,
Local,
IF(Motivo IS NULL OR  Motivo = '', 'Não indicado', Motivo) AS Motivo,
`Tempo médio de resposta (dias)`
FROM dataset_elogio;

-- Table "reclamacao" Selection
SELECT
	SUBSTR(`Data de submissão`, 7, 4) AS Ano,
	CASE 
		WHEN `Tipo (R/E/S)` = 'R' THEN 'Reclamação'
	ELSE 'Outro'
	END AS 'Tipo',
`Canal atendimento`,
Entidade,
Local,
IF(Motivo IS NULL OR  Motivo = '', 'Não indicado', Motivo) AS Motivo,
`Tempo médio de resposta (dias)`
FROM dataset_reclamacao;

-- Table "sugestao" Selection
SELECT
	SUBSTR(`Data de submissão`, 7, 4) AS Ano,
	CASE 
		WHEN `Tipo (R/E/S)` = 'S' THEN 'Sugestão'
	ELSE 'Outro'
	END AS 'Tipo',
`Canal atendimento`,
Entidade,
Local,
IF(Motivo IS NULL OR  Motivo = '', 'Não indicado', Motivo) AS Motivo,
`Tempo médio de resposta (dias)`
FROM dataset_sugestao;

-- Table "pontos_atendimento" Selection
SELECT 
	Local_Atendimento,
	Longitude,
	Latitude
FROM  dataset_pontos_atendimento;