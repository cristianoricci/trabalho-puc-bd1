-- 1. LIMPEZA DO BANCO
DROP TABLE IF EXISTS negocios;
DROP TABLE IF EXISTS garagens;
DROP TABLE IF EXISTS automoveis;
DROP TABLE IF EXISTS revendedoras;
DROP TABLE IF EXISTS consumidores;

-- 2. CRIAÇÃO DAS TABELAS
CREATE TABLE automoveis (
codigo INT PRIMARY KEY,
fabricante VARCHAR(20),
modelo VARCHAR(20),
ano INT NOT NULL,
pais VARCHAR(20),
preco_tabela DECIMAL(10, 2),
CONSTRAINT check_ano CHECK (ano > 2000)
);

CREATE TABLE consumidores (
cpf BIGINT PRIMARY KEY,
nome VARCHAR(20),
sobrenome VARCHAR(50),
data_nascimento DATE,
estado CHAR(2)
);

CREATE TABLE revendedoras (
cnpj BIGINT PRIMARY KEY,
nome VARCHAR(30),
cpfproprietario BIGINT,
estado CHAR(2)
);

CREATE TABLE negocios (
compra_id SERIAL PRIMARY KEY,
cpfcomprador BIGINT,
cnpjrevenda BIGINT,
codigoauto INT,
data DATE,
preco DECIMAL (10, 2)
);

CREATE TABLE garagens (
cnpjrevenda BIGINT,
codigoauto INT,
anoauto INT,
quantidade INT,
PRIMARY KEY (cnpjrevenda, codigoauto)
);

-- 3. INSERÇÃO DE DADOS
INSERT INTO automoveis (codigo, fabricante, modelo, ano, pais, preco_tabela) VALUES (1, 'Toyota', 'Corolla', 2022, 'Brasil', 120000.00);
INSERT INTO automoveis (codigo, fabricante, modelo, ano, pais, preco_tabela) VALUES (2, 'Honda', 'Civic', 2023, 'Brasil', 130000.00);
INSERT INTO automoveis (codigo, fabricante, modelo, ano, pais, preco_tabela) VALUES (3, 'Volkswagen', 'Golf', 2021, 'Alemanha', 95000.00);

INSERT INTO consumidores (cpf, nome, sobrenome, data_nascimento, estado) VALUES (12345678901, 'Ana', 'Silva', '1990-05-15', 'MG');
INSERT INTO consumidores (cpf, nome, sobrenome, data_nascimento, estado) VALUES (98765432100, 'Beto', 'Oliveira', '1985-10-20', 'SP');

INSERT INTO revendedoras (cnpj, nome, cpfproprietario, estado) VALUES (11222333000100, 'AutoNivel', 12345678901, 'MG');
INSERT INTO revendedoras (cnpj, nome, cpfproprietario, estado) VALUES (44555666000199, 'CarroBom', 98765432100, 'SP');

INSERT INTO negocios (cpfcomprador, codigoauto, cnpjrevenda, preco, data) VALUES (12345678901, 1, 11222333000100, 115000.00, '2024-01-15');
INSERT INTO negocios (cpfcomprador, codigoauto, cnpjrevenda, preco, data) VALUES (98765432100, 2, 44555666000199, 128000.00, '2024-02-10');

INSERT INTO garagens (cnpjrevenda, codigoauto, anoauto, quantidade) VALUES (11222333000100, 3, 2021, 2);

-- 4. RELATÓRIOS FINAIS
SELECT a.modelo, TO_CHAR(a.preco_tabela, 'R$ 999,999.99') AS vlr_tabela, TO_CHAR(n.preco, 'R$ 999,999.99') AS vlr_venda, TO_CHAR(a.preco_tabela - n.preco, 'R$ 999,999.99') AS desconto FROM negocios n JOIN automoveis a ON n.codigoauto = a.codigo;

SELECT c.nome AS cliente, a.modelo AS veiculo, r.nome AS loja, TO_CHAR(n.preco, 'R$ 999,999.99') AS preco_final FROM negocios n JOIN consumidores c ON n.cpfcomprador = c.cpf JOIN automoveis a ON n.codigoauto = a.codigo JOIN revendedoras r ON n.cnpjrevenda = r.cnpj;

SELECT * FROM negocios;