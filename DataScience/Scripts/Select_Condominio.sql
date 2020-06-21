SELECT condominio_Id,bloco_nro,apartamento_nro,nome_texto,sobrenome_texto,sexo_texto,idade_valor,modelo_texto,marca_texto,ano_valor,animais_texto,empresa_texto,profissao_texto,salario_valor,filhos_valor,garagem_valor,gravacao_data FROM Condominvs..condominio AS A
	INNER JOIN Condominvs..bloco AS B
		ON B.bloco_id = A.condominio_bloco_Id
	INNER JOIN Condominvs..apartamento AS C
		ON C.apartamento_id = A.condominio_apartamento_Id
	INNER JOIN Condominvs..nome AS D
		ON D.nome_id = A.condominio_nome_Id
	INNER JOIN Condominvs..sobrenome AS E
		ON E.sobrenome_id = A.condominio_sobrenome_Id
	INNER JOIN Condominvs..sexo AS F
		ON F.sexo_id = A.condominio_sexo_Id
	INNER JOIN Condominvs..idade AS G
		ON G.idade_id = A.condominio_idade_Id
	INNER JOIN Condominvs..modelo AS H
		ON H.modelo_id = A.condominio_modelo_Id
	INNER JOIN Condominvs..marca AS I
		ON I.marca_id = A.condominio_marca_Id
	INNER JOIN Condominvs..ano AS J
		ON J.ano_id = A.condominio_ano_Id
	INNER JOIN Condominvs..animais AS K
		ON K.animais_id = A.condominio_animais_Id
	INNER JOIN Condominvs..empresa AS L
		ON L.empresa_id = A.condominio_empresa_Id
	INNER JOIN Condominvs..profissao AS M
		ON M.profissao_id = A.condominio_profissao_Id
	INNER JOIN Condominvs..salario AS N
		ON N.salario_id = A.condominio_salario_Id
	INNER JOIN Condominvs..filhos AS O
		ON O.filhos_id = A.condominio_filhos_Id
	INNER JOIN Condominvs..garagem AS P
		ON P.garagem_id = A.condominio_garagem_Id
	INNER JOIN Condominvs..morador_desde AS Q
		ON Q.morador_desde_id = A.condominio_morador_desde_id
	INNER JOIN Condominvs..gravacao AS R
		ON R.gravacao_id = A.condominio_gravacao_id

