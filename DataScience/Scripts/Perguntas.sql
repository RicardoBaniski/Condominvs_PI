--QUANTAS MULHERES NO CONDOMINIO POSSUEM IDADE INFERIOR A 30 ANOS?
SELECT COUNT(*) [Quantidade] , f.sexo_texto [Sexo] FROM Condominvs..condominio AS A
	INNER JOIN Condominvs..sexo AS F
		ON F.sexo_id = A.condominio_sexo_Id
	INNER JOIN Condominvs..idade AS G
		ON G.idade_id = A.condominio_idade_Id	
WHERE F.sexo_texto = 'FEMALE'
	AND G.idade_valor < 30
GROUP BY f.sexo_texto

--QUEM É O MORADOR QUE POSSUI O MAIOR SALÁRIO
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

--QUAL A QUANTIDADE DE CRIANÇAS NO CONDOMINIO?
SELECT SUM(filhos_valor) [Qtde_Crianças] FROM Condominvs..condominio AS A
	INNER JOIN Condominvs..filhos AS B
		ON B.filhos_id = A.condominio_filhos_Id

--QUAL O NÚMERO DE DESEMPREGADOS POR BLOCO
SELECT COUNT(*) [Desempregados], bloco_nro [Bloco] FROM Condominvs..condominio AS A 
	INNER JOIN Condominvs..salario AS B
		ON B.salario_id = A.condominio_salario_Id
	INNER JOIN Condominvs..bloco AS C
		ON C.bloco_id = A.condominio_bloco_Id
WHERE salario_valor = 0
GROUP BY bloco_nro