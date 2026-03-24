use ecommerce_dw;

CREATE TABLE staging_cliente(
id_cliente_origem INT UNIQUE,
nome VARCHAR(150),
email VARCHAR(150),
cpf VARCHAR(14),
cidade VARCHAR(100),
estado CHAR(2)
);

CREATE TABLE staging_produto(
id_produto_origem INT UNIQUE,
nome_produto VARCHAR(100) NOT NULL,
avaliação float default 0,
preço DECIMAL(20,2) NOT NULL
);

CREATE TABLE staging_fornecedor(
id_fornecedor_origem INT UNIQUE,
cnpj CHAR(18) NOT NULL UNIQUE,
razao_social VARCHAR(200) NOT NULL,
localidade VARCHAR(100) NOT NULL,
fabricante VARCHAR(100)
);

CREATE TABLE staging_vendedor(
id_vendedor_origem INT UNIQUE,
cnpj CHAR(18) NOT NULL UNIQUE,
razao_social VARCHAR(200) NOT NULL,
localidade VARCHAR(50) NOT NULL
);

CREATE TABLE staging_vendas(
id_vendas_origem INT UNIQUE,
id_cliente_origem INT UNIQUE,
id_produto_origem INT UNIQUE,
id_vendedor_origem INT UNIQUE,
id_pagamento_origem INT UNIQUE,
id_fornecedor_origem INT UNIQUE,
id_categoria_origem INT UNIQUE,
id_estoque_origem INT UNIQUE,
status_pedido ENUM('PAGAMENTO PENDENTE', 'PAGO', 'CANCELADO'),
status_envio ENUM('EM PREPARO PARA ENVIO', 'ENVIADO', 'ENTREGUE'),
quantidade INT NOT NULL,
data_venda DATETIME,
valor_venda DECIMAL(20,2) NOT NULL
);
