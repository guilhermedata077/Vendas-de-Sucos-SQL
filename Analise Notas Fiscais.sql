
-- Consultando a tabela de notas fiscais. 

SELECT * FROM [NOTAS FISCAIS];

-- Consultando a tabela de itens notas fiscais.

SELECT * FROM [ITENS NOTAS FISCAIS];


-- Consultando o faturamento bruto e líquido das notas fiscais. 

SELECT N.CPF, N.DATA, N.IMPOSTO, I.QUANTIDADE, I.PREÇO,
(I.QUANTIDADE * I.PREÇO) AS [FATURAMENTO BRUTO],
((I.QUANTIDADE * I.PREÇO) *N.IMPOSTO) AS [FATURAMENTO LIQUIDO]
FROM [NOTAS FISCAIS] N
INNER JOIN [ITENS NOTAS FISCAIS] I
ON N.NUMERO = I.NUMERO;

