Projeto: Sistema de Gestão de Concessionária (Aula 2 - BD)
📌 Descrição

Este projeto consiste na modelagem e implementação de um banco de dados relacional para gerenciar o estoque e as vendas de uma concessionária de automóveis. O objetivo foi aplicar conceitos de Integridade de Dados, Relacionamentos e Consultas Avançadas no PostgreSQL.
🛠️ Tecnologias Utilizadas

    Banco de Dados: PostgreSQL

    Ferramenta de Query: VS Code / Terminal PSQL

    Linguagem: SQL (Standard Query Language)

🏗️ Estrutura do Banco de Dados

O banco é composto por 5 tabelas principais:

    Automóveis: Cadastro de veículos com trava de segurança para o ano de fabricação.

    Consumidores: Registro de clientes utilizando BIGINT para garantir a integridade de CPFs de 11 dígitos.

    Revendedoras: Registro das lojas físicas.

    Negócios: Tabela de fatos que registra as vendas, conectando Clientes, Carros e Lojas.

    Garagens: Controle de estoque (quantidade) por revendedora.

🚀 Desafios Implementados
1. Integridade e Regras de Negócio

Foram aplicadas as seguintes restrições (Constraints):

    Primary Keys (PK): Garantem que não existam registros duplicados.

    CHECK Constraint: Implementada na coluna ano da tabela automoveis para impedir o cadastro de veículos fabricados antes do ano 2000.

    Tipagem Apropriada: Uso de DECIMAL(10,2) para valores financeiros e BIGINT para documentos (CPF/CNPJ).

2. Consultas e Relatórios

Foi desenvolvido um relatório financeiro avançado utilizando:

    Joins: Para cruzar dados de múltiplas tabelas.

    Cálculos em Tempo Real: Subtração entre o preço de tabela e o preço de venda para exibir o desconto aplicado.

    Formatação Monetária: Uso da função TO_CHAR() para exibir valores no padrão brasileiro (R$ 999.999,99).

📋 Como Executar

    Certifique-se de ter o PostgreSQL instalado.

    Abra o arquivo exe_aula2BDsql.sql em seu editor.

    Execute o script completo. O comando DROP TABLE IF EXISTS garantirá que o ambiente seja resetado e criado corretamente.

    As tabelas de relatório serão exibidas ao final da execução.

📊 Exemplo de Resultado (Relatório Final)

Este é o resultado gerado pelo script após o cruzamento dos dados:

Tabela de Descontos:

    Modelo: Corolla | Tabela: R$ 120.000,00 | Venda: R$ 115.000,00 | Desconto: R$ 5.000,00

    Modelo: Civic   | Tabela: R$ 130.000,00 | Venda: R$ 128.000,00 | Desconto: R$ 2.000,00

Tabela de Vendas por Cliente:

    Cliente: Ana  | Veículo: Corolla | Loja: AutoNivel | Preço Final: R$ 115.000,00

    Cliente: Beto | Veículo: Civic   | Loja: CarroBom  | Preço Final: R$ 128.000,00