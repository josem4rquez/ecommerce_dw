use ecommerce_dw;

INSERT INTO dim_cliente(
id_cliente_origem,
nome,
email,
cpf,
cidade,
estado
)
SELECT
	id_cliente_origem,
    UPPER(nome),
    LOWER(email),
    REPLACE(REPLACE (cpf, '.', ''), '-', '') AS cpf_limpo,
    UPPER(cidade),
    UPPER(estado)
FROM staging_cliente;

INSERT INTO dim_produto(
id_produto_origem,
nome_produto,
avaliação,
preço
)
SELECT
	id_produto_origem,
    UPPER(nome_produto),
    avaliação,
    preço
FROM staging_produto;

INSERT INTO dim_fornecedor(
id_fornecedor_origem,
cnpj,
razao_social,
localidade,
fabricante
)
SELECT 
	id_fornecedor_origem,
    REPLACE(REPLACE(REPLACE(cnpj, '.', ''), '/', ''), '-', '') AS cnpj_limpo,
    UPPER(razao_social),
    UPPER(localidade),
    UPPER(fabricante)
FROM staging_fornecedor;

INSERT INTO dim_vendedor (
id_vendedor_origem,
cnpj,
razao_social,
localidade
)
SELECT
	id_vendedor_origem,
	REPLACE(REPLACE(REPLACE(cnpj, '.', ''), '/', ''), '-', '') AS cnpj_limpo,
	UPPER(razao_social),
	UPPER(localidade)
FROM staging_vendedor;

INSERT INTO fato_vendas (
sk_cliente,
sk_produto,
sk_data,
sk_pagamento,
sk_fornecedor,
sk_estoque,
sk_categoria,
status_pedido,
status_envio,
quantidade,
valor_venda
)
SELECT
	c.sk_cliente,
    p.sk_produto,
    d.sk_data,
	pg.sk_pagamento,
    f.sk_fornecedor,
    e.sk_estoque,
    ca.sk_categoria,
    CASE 
    WHEN LOWER(s.status_pedido) = 'pago' THEN 'PAGO'
    WHEN LOWER(s.status_pedido) = 'pagamento pendente' THEN 'PAGAMENTO PENDENTE'
    WHEN LOWER(s.status_pedido) = 'cancelado' THEN 'CANCELADO'
  END,
  CASE 
    WHEN LOWER(s.status_envio) = 'enviado' THEN 'ENVIADO'
    WHEN LOWER(s.status_envio) = 'em preparo para envio' THEN 'EM PREPARO PARA ENVIO'
    WHEN LOWER(s.status_envio) = 'entregue' THEN 'ENTREGUE'
  END,
    s.quantidade,
    s.valor_venda
FROM staging_vendas s
JOIN dim_cliente c
	ON s.id_cliente_origem = c.id_cliente_origem
JOIN dim_produto p
	ON s.id_produto_origem = p.id_produto_origem
JOIN dim_data d
	ON DATE(s.data_venda) = d.data_compra
JOIN dim_pagamento pg 
	ON s.id_pagamento_origem = pg.id_pagamento_origem
JOIN dim_fornecedor f
	ON s.id_fornecedor_origem = f.id_fornecedor_origem
JOIN dim_estoque e
	ON s.id_estoque_origem = e.id_estoque_origem
JOIN dim_categoria ca
	ON s.id_categoria_origem = ca.id_categoria_origem;
    

    
INSERT INTO fato_vendas(

)    

SELECT
	s.id_vendas_origem,
    s.data_venda,
    d.sk_data,
    d.data_compra
FROM staging_vendas s
JOIN dim_data d
	ON DATE(s.data_venda) = d.data_compra;