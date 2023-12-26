
-- Consultando a tabela de produtos.

SELECT * FROM [TABELA DE PRODUTOS];


-- Consultando o pre�o de cada sabor forncedido. 

SELECT SABOR,SUM([PRE�O DE LISTA]) AS PRE�O 
FROM [TABELA DE PRODUTOS]
GROUP BY SABOR
ORDER BY SUM([PRE�O DE LISTA]) DESC;

-- Consultando o pre�o por cada embalagem forcenida. 

SELECT EMBALAGEM,SUM([PRE�O DE LISTA]) AS PRE�O 
FROM [TABELA DE PRODUTOS]
GROUP BY EMBALAGEM
ORDER BY SUM([PRE�O DE LISTA]) DESC;

-- Consultando o pre�o do sabor mais vendido, e da embalagem mais forcenida. 

SELECT SABOR, EMBALAGEM, [PRE�O DE LISTA] FROM [TABELA DE PRODUTOS]
WHERE SABOR = 'A�AI' AND EMBALAGEM = 'PET';


-- Consultando qual � o produto que mais ofereceu faturamento para a empresa. 

SELECT P.[NOME DO PRODUTO], SUM(N.PRE�O) AS [FATURAMENTO DO PRODUTO]
FROM [TABELA DE PRODUTOS] P 
INNER JOIN [ITENS NOTAS FISCAIS] N
ON P.[CODIGO DO PRODUTO] = N.[CODIGO DO PRODUTO]
GROUP BY P.[NOME DO PRODUTO]
ORDER BY SUM(N.PRE�O) DESC;



-- Declarando uma vari�vel 

DECLARE @M�DIA_PRE�O FLOAT

-- Alimentando a vari�vel

SELECT @M�DIA_PRE�O = AVG([PRE�O DE LISTA]) FROM [TABELA DE PRODUTOS]


-- Consultando o tamanho dos produtos que tiveram um faturamento abaixo da m�dia.

SELECT TAMANHO, [PRE�O DE LISTA] FROM [TABELA DE PRODUTOS]
WHERE [PRE�O DE LISTA] <= @M�DIA_PRE�O
ORDER BY [PRE�O DE LISTA];

-- Consultando o tamanho dos produtos que tiveram um faturamento abaixo da m�dia, que n�o possuem um tamanho de 350ML.

SELECT [NOME DO PRODUTO], [PRE�O DE LISTA] FROM [TABELA DE PRODUTOS]
WHERE [PRE�O DE LISTA] <= @M�DIA_PRE�O AND TAMANHO <> '350 ml'
ORDER BY [PRE�O DE LISTA];


-- Consultando quais foram os produtos mais vendidos.

SELECT P.[NOME DO PRODUTO], SUM(F.QUANTIDADE) AS QUANTIDADE_VENDIDA
FROM [TABELA DE PRODUTOS] P
INNER JOIN [ITENS NOTAS FISCAIS] F
ON P.[CODIGO DO PRODUTO] = F.[CODIGO DO PRODUTO]
GROUP BY P.[NOME DO PRODUTO]
ORDER BY SUM(F.QUANTIDADE) DESC;




