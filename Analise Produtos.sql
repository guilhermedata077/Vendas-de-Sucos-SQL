
-- Consultando a tabela de produtos.

SELECT * FROM [TABELA DE PRODUTOS];


-- Consultando o preço de cada sabor forncedido. 

SELECT SABOR,SUM([PREÇO DE LISTA]) AS PREÇO 
FROM [TABELA DE PRODUTOS]
GROUP BY SABOR
ORDER BY SUM([PREÇO DE LISTA]) DESC;

-- Consultando o preço por cada embalagem forcenida. 

SELECT EMBALAGEM,SUM([PREÇO DE LISTA]) AS PREÇO 
FROM [TABELA DE PRODUTOS]
GROUP BY EMBALAGEM
ORDER BY SUM([PREÇO DE LISTA]) DESC;

-- Consultando o preço do sabor mais vendido, e da embalagem mais forcenida. 

SELECT SABOR, EMBALAGEM, [PREÇO DE LISTA] FROM [TABELA DE PRODUTOS]
WHERE SABOR = 'AÇAI' AND EMBALAGEM = 'PET';


-- Consultando qual é o produto que mais ofereceu faturamento para a empresa. 

SELECT P.[NOME DO PRODUTO], SUM(N.PREÇO) AS [FATURAMENTO DO PRODUTO]
FROM [TABELA DE PRODUTOS] P 
INNER JOIN [ITENS NOTAS FISCAIS] N
ON P.[CODIGO DO PRODUTO] = N.[CODIGO DO PRODUTO]
GROUP BY P.[NOME DO PRODUTO]
ORDER BY SUM(N.PREÇO) DESC;



-- Declarando uma variável 

DECLARE @MÉDIA_PREÇO FLOAT

-- Alimentando a variável

SELECT @MÉDIA_PREÇO = AVG([PREÇO DE LISTA]) FROM [TABELA DE PRODUTOS]


-- Consultando o tamanho dos produtos que tiveram um faturamento abaixo da média.

SELECT TAMANHO, [PREÇO DE LISTA] FROM [TABELA DE PRODUTOS]
WHERE [PREÇO DE LISTA] <= @MÉDIA_PREÇO
ORDER BY [PREÇO DE LISTA];

-- Consultando o tamanho dos produtos que tiveram um faturamento abaixo da média, que não possuem um tamanho de 350ML.

SELECT [NOME DO PRODUTO], [PREÇO DE LISTA] FROM [TABELA DE PRODUTOS]
WHERE [PREÇO DE LISTA] <= @MÉDIA_PREÇO AND TAMANHO <> '350 ml'
ORDER BY [PREÇO DE LISTA];


-- Consultando quais foram os produtos mais vendidos.

SELECT P.[NOME DO PRODUTO], SUM(F.QUANTIDADE) AS QUANTIDADE_VENDIDA
FROM [TABELA DE PRODUTOS] P
INNER JOIN [ITENS NOTAS FISCAIS] F
ON P.[CODIGO DO PRODUTO] = F.[CODIGO DO PRODUTO]
GROUP BY P.[NOME DO PRODUTO]
ORDER BY SUM(F.QUANTIDADE) DESC;




