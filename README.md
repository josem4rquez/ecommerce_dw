# Ecommerce_dw
Projeto de Data Warehouse para e-commerce utilizando MySQL, com modelagem em esquema estrela, ETL (staging → dimensões → fato) e dados preparados para análise. Inclui criação de tabelas, transformação e carga de dados, seguindo boas práticas de modelagem e organização.

# 📊 Data Warehouse E-commerce

Projeto de **Data Warehouse (DW)** desenvolvido utilizando **MySQL**, com modelagem em **esquema estrela**, simulando um ambiente de análise de dados de um e-commerce.

---

## 🧠 Objetivo

Construir um Data Warehouse completo com:

- Estrutura de staging (dados brutos)
- Transformação e limpeza de dados (ETL)
- Modelagem dimensional (tabelas fato e dimensões)
- Base preparada para análise de dados e BI

---

## 📊 Modelagem

O projeto segue o modelo **estrela**, contendo:

### 🟦 Tabela Fato
- fato_vendas

### 🟩 Tabelas Dimensão
- dim_cliente
- dim_produto
- dim_vendedor
- dim_categoria
- dim_data
- dim_pagamento
- dim_fornecedor
- dim_estoque

### 🟨 Staging (dados brutos)
- staging_cliente
- staging_produto
- staging_vendas
- staging_vendedor
- staging_fornecedor

---

## 🔄 Fluxo ETL

Gerador SQL → Staging → Transformação → Dimensões → Fato_vendas

---

## ⚙️ Tecnologias Utilizadas

- MySQL
- SQL (DDL, DML, JOINs, ETL)
- Modelagem Dimensional

---

## 📈 Possíveis Análises

Faturamento total
Vendas por produto
Vendas por cliente
Vendas por forma de pagamento
Análise temporal (por data)

---

##📄 Documentação

📌 Acesse a documentação completa do projeto no Notion:

👉 https://www.notion.so/Projeto-DW-Banco-de-Dados-E-commerce-30dfcf7672ee80689686dd1a7b0d6768?source=copy_link

---

## 💡 Aprendizados

Durante o desenvolvimento deste projeto foram aplicados conceitos como:

- ETL (Extract, Transform, Load)
- Modelagem estrela
- Uso de surrogate keys
- Boas práticas em SQL
- Organização de projetos de dados

---

## 👨‍💻 Autor

Desenvolvido por José Marques
