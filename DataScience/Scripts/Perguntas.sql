--01 - QUANTAS MULHERES NO CONDOMINIO POSSUEM IDADE INFERIOR A 30 ANOS?
SELECT COUNT(*) [Quantidade] , f.sexo_texto [Sexo] FROM Condominvs..condominio AS A
	INNER JOIN Condominvs..sexo AS F
		ON F.sexo_id = A.condominio_sexo_Id
	INNER JOIN Condominvs..idade AS G
		ON G.idade_id = A.condominio_idade_Id	
WHERE F.sexo_texto = 'FEMALE'
	AND G.idade_valor < 30
GROUP BY f.sexo_texto

--02 - QUEM É O MORADOR QUE POSSUI O MAIOR SALÁRIO?
SELECT TOP 1 salario_valor [Salario], nome_texto [Nome], sexo_texto [Sexo], bloco_nro [Bloco] FROM Condominvs..condominio AS A
	INNER JOIN Condominvs..salario AS B
		ON B.salario_id = A.condominio_salario_Id
	INNER JOIN Condominvs..nome AS C
		ON C.nome_id = A.condominio_nome_Id
	INNER JOIN Condominvs..bloco AS D
		ON D.bloco_id = A.condominio_bloco_Id
	INNER JOIN Condominvs..sexo AS E
		ON E.sexo_id = condominio_sexo_Id
ORDER BY salario_valor DESC

--03 - QUAL A QUANTIDADE DE CRIANÇAS NO CONDOMINIO?
SELECT SUM(filhos_valor) [Qtde_Crianças] FROM Condominvs..condominio AS A
	INNER JOIN Condominvs..filhos AS B
		ON B.filhos_id = A.condominio_filhos_Id

--04 - QUAL O NÚMERO DE DESEMPREGADOS POR BLOCO?
SELECT COUNT(*) [Desempregados], bloco_nro [Bloco] FROM Condominvs..condominio AS A 
	INNER JOIN Condominvs..salario AS B
		ON B.salario_id = A.condominio_salario_Id
	INNER JOIN Condominvs..bloco AS C
		ON C.bloco_id = A.condominio_bloco_Id
WHERE salario_valor = 0
GROUP BY bloco_nro

--05 - QUAIS OS MODELOS DE VEÍCULOS COM MENOS DE 5 ANOS DE USO DE VEICULOS QUE NÃO POSSEM GARAGEM FIXA?
SELECT modelo_texto [Modelos de Véiculos] FROM Condominvs..condominio AS A
	INNER JOIN Condominvs..garagem AS B
		ON B.garagem_id = A.condominio_garagem_Id
	INNER JOIN Condominvs..modelo As C
		ON C.modelo_id = A.condominio_modelo_Id
	INNER JOIN Condominvs..marca AS D
		ON D.marca_id = condominio_marca_Id
	INNER JOIN Condominvs..ano AS E
		ON E.ano_id = A.condominio_ano_Id
WHERE garagem_valor = 0 
	AND modelo_texto <> ''
	AND ano_valor > 2015

--06 - QUAIS AS 5 MARCAS DE VEÍCULOS PREFERIDAS PELAS MULHERES DO CONDOMINIO?
SELECT TOP 5 COUNT(marca_texto) [Quantidade], marca_texto [Marca] FROM Condominvs..condominio AS A
	INNER JOIN Condominvs..sexo AS B
		ON B.sexo_id = A.condominio_sexo_Id
	INNER JOIN Condominvs..marca AS C
		ON C.marca_id = A.condominio_marca_Id
WHERE sexo_texto = 'FEMALE'
	AND marca_texto <> ''
GROUP BY marca_texto
ORDER BY 1 DESC

--07 - QUAIS BLOCO NÃO POSSUEM NÚMERO DE DESEMPREGO ATÉ ESTA DATA?
SELECT DISTINCT bloco_nro [Blocos] FROM Condominvs..condominio AS D
	INNER JOIN Condominvs..bloco AS E
		ON E.bloco_id = D.condominio_bloco_Id
WHERE bloco_nro NOT IN (SELECT DISTINCT bloco_nro FROM Condominvs..condominio AS A
	INNER JOIN Condominvs..salario AS B
		ON B.salario_id = A.condominio_salario_Id
	INNER JOIN Condominvs..bloco AS C
		ON C.bloco_id = A.condominio_bloco_Id
WHERE salario_valor = 0)

