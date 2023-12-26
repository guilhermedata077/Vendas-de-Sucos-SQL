
-- Consultando a tabela de clientes.

SELECT * FROM [TABELA DE CLIENTES];

-- Excluindo uma coluna vazia da tabela de clientes.

ALTER TABLE [TABELA DE CLIENTES] DROP COLUMN [ENDERECO 2];


SELECT * FROM [TABELA DE CLIENTES];

-- Consultando todos os clientes que efetuaram mais de uma compra, e que possuem um volume de compra acima da média. 

SELECT CPF, NOME,[VOLUME DE COMPRA], [PRIMEIRA COMPRA]
FROM [TABELA DE CLIENTES]
WHERE [VOLUME DE COMPRA] >= (SELECT AVG([VOLUME DE COMPRA]) FROM [TABELA DE CLIENTES])
AND [PRIMEIRA COMPRA] = 0;


-- Consultando os estados existentes na tabela de clientes. 

SELECT DISTINCT ESTADO FROM [TABELA DE CLIENTES];

SELECT * FROM [TABELA DE CLIENTES];

-- Consultando o total do limite de credito por estado. 

SELECT ESTADO, SUM([LIMITE DE CREDITO]) AS [LIMITE DE CREDITO TOTAL]
FROM [TABELA DE CLIENTES]
GROUP BY ESTADO
ORDER BY SUM([LIMITE DE CREDITO]) DESC;


-- Consultando quantas compras foram realizadas por clientes que efetuaram mais de uma compra, dos diferentes estados cadastrados. 

SELECT ESTADO, COUNT([PRIMEIRA COMPRA]) AS [TOTAL DE COMPRAS] 
FROM [TABELA DE CLIENTES]
WHERE [PRIMEIRA COMPRA] = 0
GROUP BY ESTADO 
ORDER BY COUNT([PRIMEIRA COMPRA]) DESC;


-- Consultando quantas compras foram realizadas por clientes que efetuaram a primeira compra, dos diferentes estados cadastrados.

SELECT ESTADO, COUNT([PRIMEIRA COMPRA]) AS [TOTAL DE COMPRAS] 
FROM [TABELA DE CLIENTES]
WHERE [PRIMEIRA COMPRA] = 1
GROUP BY ESTADO 
ORDER BY COUNT([PRIMEIRA COMPRA]) DESC;

-- Consultando o total de clientes cadastrados por sexo.

SELECT SEXO, COUNT(SEXO) AS [TOTAL DE CLIENTES]
FROM [TABELA DE CLIENTES]
GROUP BY SEXO
ORDER BY COUNT(SEXO) DESC;

-- Consultando o limite total por sexo do cliente.

SELECT SEXO, SUM([LIMITE DE CREDITO]) AS [TOTAL DE LIMITE DE CREDITO]
FROM [TABELA DE CLIENTES]
GROUP BY SEXO
ORDER BY SUM([LIMITE DE CREDITO])DESC;


