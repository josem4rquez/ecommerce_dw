create schema if not exists ecommerce_dw;
use ecommerce_dw;

CREATE TABLE dim_cliente(
sk_cliente INT AUTO_INCREMENT PRIMARY KEY,
id_cliente_origem INT UNIQUE,
nome VARCHAR(80) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
email VARCHAR(100) NOT NULL UNIQUE,
cidade VARCHAR(30)NOT NULL,
estado CHAR(2) NOT NULL
);

CREATE TABLE dim_produto (
sk_produto INT AUTO_INCREMENT PRIMARY KEY,
id_produto_origem INT UNIQUE,
nome_produto VARCHAR(100) NOT NULL,
avaliação FLOAT DEFAULT 0,
preço DECIMAL(20,2) NOT NULL
);

CREATE TABLE dim_estoque(
sk_estoque INT AUTO_INCREMENT PRIMARY KEY,
id_estoque_origem INT UNIQUE,
quantidade INT
);

CREATE TABLE dim_categoria (
sk_categoria INT AUTO_INCREMENT PRIMARY KEY,
id_categoria_origem INT UNIQUE,
nome_categoria VARCHAR(100)
);

CREATE TABLE dim_data(
sk_data INT AUTO_INCREMENT primary key,
data_compra DATE NOT NULL UNIQUE,
ano CHAR(4) NOT NULL,
mes CHAR(2) NOT NULL,
dia CHAR(2) NOT NULL,
semestre CHAR(1) NOT NULL
);

CREATE TABLE dim_fornecedor(
sk_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
id_fornecedor_origem INT UNIQUE,
cnpj CHAR(14) NOT NULL UNIQUE,
razao_social VARCHAR(200) NOT NULL,
localidade VARCHAR(100) NOT NULL,
fabricante VARCHAR(100)
);

CREATE TABLE dim_vendedor(
sk_vendedor INT AUTO_INCREMENT PRIMARY KEY,
id_vendedor_origem INT UNIQUE,
cnpj CHAR(14) NOT NULL UNIQUE,
razao_social VARCHAR(200) NOT NULL,
localidade VARCHAR(50) NOT NULL
);

CREATE TABLE dim_pagamento(
sk_pagamento INT AUTO_INCREMENT PRIMARY KEY,
id_pagamento_origem INT UNIQUE,
tipo_pagamento VARCHAR(70) NOT NULL,
categoria_pagamento VARCHAR(70) NOT NULL,
permite_parcelamento BOOLEAN,
prazo_confirmacao VARCHAR(50)
);

CREATE TABLE fato_vendas(
sk_venda INT AUTO_INCREMENT PRIMARY KEY,
quantidade VARCHAR(99) NOT NULL,
valor_venda DECIMAL(20,2) NOT NULL,
status_pedido ENUM('PAGAMENTO PENDENTE', 'PAGO', 'CANCELADO'),
status_envio ENUM('EM PREPARO PARA ENVIO', 'ENVIADO', 'ENTREGUE'),
FOREIGN KEY (sk_cliente) REFERENCES dim_cliente(sk_cliente),
sk_cliente INT,
FOREIGN KEY (sk_produto) REFERENCES dim_produto(sk_produto),
sk_produto INT,
FOREIGN KEY (sk_data) REFERENCES dim_data(sk_data),
sk_data INT,
FOREIGN KEY (sk_pagamento) REFERENCES dim_pagamento(sk_pagamento),
sk_pagamento INT,
FOREIGN KEY (sk_fornecedor) REFERENCES dim_fornecedor(sk_fornecedor),
sk_fornecedor INT,
FOREIGN KEY (sk_estoque) REFERENCES dim_estoque(sk_estoque),
sk_estoque INT,
FOREIGN KEY (sk_categoria) REFERENCES dim_categoria(sk_categoria),
sk_categoria INT
);