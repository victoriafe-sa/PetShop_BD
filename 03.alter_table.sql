-- ALTERANDO A TABELA ESTOQUE PARA INCLUIR UM INDEX+
-- set foreign_key_checks =0;
ALTER TABLE Estoque
	ADD INDEX idx_nome_produto (nome_produto);

-- ALTERANDO A TABELA CLIENTE PARA INCLUIR UM INDICE
ALTER TABLE Clientes
	ADD INDEX idx_nome_cliente (nome_cliente);
    
-- ALTERANDO A TABELA FUNCIONARIOS PARA INCLUIR UM INDICE
ALTER TABLE Funcionarios
	ADD INDEX idx_nome_funcionario (nome_funcionario);
    
-- ALTERANDO A TABELA SERVIÇOS PARA INCLUIR UM INDICE
ALTER TABLE Servicos
	ADD INDEX idx_nome_servico (nome_servico);
    

-- Alterando a tabela Vendas para adicionar as FKs
ALTER TABLE Vendas
ADD COLUMN id_cliente INT, 
ADD COLUMN id_funcionario INT,
ADD INDEX idx_id_cliente (id_cliente), -- Indice para a FK
ADD INDEX idx_id_funcionario (id_funcionario), -- Indice para a FK
ADD CONSTRAINT fk_vendas_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente),
ADD CONSTRAINT fk_vendas_funcionario FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario);

-- Alterando a tabela Agendamentos para adicionar as FKs
ALTER TABLE Agendamentos
ADD COLUMN id_cliente INT, -- FK para a tabela Clientes
ADD COLUMN id_servico INT, -- FK para a tabela ServicoS
ADD COLUMN id_funcionario INT, -- FK para a tabela Funcionarios
ADD INDEX idx_id_cliente_agendamento (id_cliente), -- Índice para a FK
ADD INDEX idx_id_servico (id_servico), -- Indice para a FK
ADD INDEX idx_id_funcionario_agendamento (id_funcionario), -- Índice para a FK
ADD CONSTRAINT fk_agendamento_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
ADD CONSTRAINT fk_agendamento_servico FOREIGN KEY (id_servico) REFERENCES Servicos(id_servico),
ADD CONSTRAINT fk_agendamento_funcionario FOREIGN KEY (id_funcionario) REFERENCES Funcionarios (id_funcionario);