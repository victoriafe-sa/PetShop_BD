/*
SENAC DF - CEP Jessé Freire
2024.07.276 - Aprendizagem Profissional de Qualificação em Desenvolvimento de Softwares
Profº Hudson Neves
Projeto - Petshop
*/

-- CRIANDO BANCO DE DADOS COM SUPORTE AO CONJUNTO DE CARACTERES UTF8
CREATE DATABASE petshop
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE petshop;

CREATE TABLE Estoque(
	id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    data_entrada DATE NOT NULL,
    descricao_produto TEXT
);

CREATE TABLE Clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100),
    endereco TEXT,
    data_registro DATE NOT NULL
);

CREATE TABLE Funcionarios(
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100),
    cargo VARCHAR(100),
    salario DECIMAL(10,2),
    data_contratacao DATE NOT NULL
);

CREATE TABLE Servicos(
	id_servico INT AUTO_INCREMENT PRIMARY KEY,
    nome_servico VARCHAR(100) NOT NULL,
    descricao_servico TEXT,
    preco_servico DECIMAL(10,2) NOT NULL,
    duracao_estimada TIME -- Tempo estimado para o serviço
);

CREATE TABLE Vendas(
	id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    id_cliente INT,
    id_funcionario INT 
);

CREATE TABLE Agendamentos(
	id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    data_agendamento DATE NOT NULL,
    horario TIME NOT NULL, 
    observacoes TEXT
);
CREATE TABLE Itens_Venda(
	id_item_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT,
    id_estoque INT,
    quantidade_venda INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_itens_venda_venda FOREIGN KEY (id_venda) REFERENCES Vendas(id_venda),
    CONSTRAINT fk_itens_venda_esttoque FOREIGN KEY (id_estoque) REFERENCES Estoque(id_estoque)
);