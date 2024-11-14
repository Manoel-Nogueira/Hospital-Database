-- -----------------------------------------------------
-- Table departamentos
-- -----------------------------------------------------
INSERT INTO departamentos (nome, numero, localizacao, descricao, gerente) VALUES
('Cardiologia', 101, 'Bloco A', 'Tratamento de doenças do coração', 1),
('Pediatria', 102, 'Bloco B', 'Tratamento de doenças infantis', 2),
('Neurologia', 103, 'Bloco C', 'Tratamento de doenças do sistema nervoso', 3),
('Ortopedia', 104, 'Bloco D', 'Tratamento de fraturas e doenças ósseas', 4),
('Oftalmologia', 105, 'Bloco E', 'Tratamento de doenças dos olhos', 5),
('Dermatologia', 106, 'Bloco F', 'Trat amento de doenças de pele', 6),
('Oncologia', 107, 'Bloco G', 'Tratamento de câncer', 7),
('Ginecologia', 108, 'Bloco H', 'Tratamento de doenças ginecológicas', 8),
('Administrativo', 109, 'Bloco I', 'Administrativo', 9),
('Serviços Gerais', 110, 'Bloco J', 'Serviços Gerais', 10);

-- -----------------------------------------------------
-- Table funcionarios
-- -----------------------------------------------------
INSERT INTO funcionarios (nome, rg, cpf, sexo, dt_nascimento, salario, dt_admissao, departamento_id) VALUES
('João Silva', '123456789', '123.456.789-00', 'Masculino', '1985-06-15', 5000.00, '2023-01-01 08:00:00', 1),
('Maria Souza', '987654321', '987.654.321-00', 'Feminino', '1990-08-20', 5500.00, '2023-02-10 09:00:00', 2),
('Carlos Pereira', '123123123', '123.123.123-00', 'Masculino', '1980-11-05', 6000.00, '2022-11-20 07:30:00', 3),
('Ana Costa', '321321321', '321.321.321-00', 'Feminino', '1995-04-14', 4500.00, '2023-03-15 08:45:00', 4),
('Ricardo Lima', '654654654', '654.654.654-00', 'Masculino', '1983-02-28', 7000.00, '2021-06-12 10:00:00', 5),
('Fernanda Oliveira', '456456456', '456.456.456-00', 'Feminino', '1992-12-17', 5200.00, '2022-05-30 08:00:00', 6),
('Marcelo Gomes', '567567567', '567.567.567-00', 'Masculino', '1978-10-25', 6500.00, '2020-09-02 07:00:00', 7),
('Juliana Ferreira', '678678678', '678.678.678-00', 'Feminino', '1988-03-12', 5700.00, '2023-01-10 09:30:00', 8),
('Lucas Santos', '789789789', '789.789.789-00', 'Masculino', '1995-05-22', 4800.00, '2022-07-15 08:15:00', 9),
('Patricia Martins', '890890890', '890.890.890-00', 'Feminino', '1980-01-05', 5300.00, '2021-12-01 08:45:00', 10);

ALTER TABLE departamentos ADD CONSTRAINT fk_gerente FOREIGN KEY (gerente) REFERENCES funcionarios (id);

-- -----------------------------------------------------
-- Table telefones_funcionarios
-- -----------------------------------------------------
INSERT INTO telefones_funcionarios (funcionario_id, numero) VALUES
(1, '(84)1234-5678'),
(2, '(87)2345-6789'),
(2, '(89)2355-6879'),
(3, '(33)3566-7980'),
(3, '(75)3456-7890'),
(4, '(99)4567-8901'),
(5, '(81)5678-9012'),
(6, '(66)6789-0123'),
(7, '(66)7890-1234'),
(7, '(75)7980-1234'),
(8, '(18)8901-2345'),
(9, '(75)9012-3456'),
(10, '(66)0123-4567');

INSERT INTO administradores (funcionarios_id) VALUES
(9);

-- -----------------------------------------------------
-- Table especializacoes
-- -----------------------------------------------------
INSERT INTO especializacoes (nome, descricao) VALUES
('Cardiologista', 'Especialista em doenças cardíacas'),
('Pediatra', 'Especialista em doenças infantis'),
('Neurologista', 'Especialista em doenças do sistema nervoso'),
('Ortopedista', 'Especialista em doenças ósseas e articulares'),
('Enfermeiro de Emergência', 'Especialização para enfermeiros atuarem em unidades de emergência e urgência.'),
('Enfermeiro de UTI', 'Especialização para enfermeiros atuarem em unidades de terapia intensiva.'),
('Enfermeiro Obstetra', 'Especialização para enfermeiros que atendem mulheres durante o pré-natal, parto e pós-parto.'),
('Higiene Hospitalar', 'Especialização em técnicas e processos para manter o ambiente hospitalar limpo e seguro, com foco em prevenção de infecções.'),
('Gestão de Processos', 'Especialização em otimização e melhoria contínua dos processos internos do hospital ou clínica para garantir eficiência operacional.'),
('Tecnologia da Informação em Saúde', 'Especialização em implementar e gerenciar sistemas de TI para aprimorar a gestão e operação de hospitais e clínicas.');

-- -----------------------------------------------------
-- Table administradores_especializacoes
-- -----------------------------------------------------
INSERT INTO administradores_especializacoes (especializacoes_id, administradores_funcionarios_id, dt_inicializacao, dt_finalizacao) VALUES
(9, 9, '2023-01-01 09:00:00', '2024-01-01 09:00:00'),
(10, 9, '2022-02-15 10:00:00', '2024-02-15 10:00:00');

-- -----------------------------------------------------
-- Table medicos
-- -----------------------------------------------------
INSERT INTO medicos (funcionario_id, crm, escala_trabalho) VALUES
(1, 'CRM1234', 'Segunda a Sexta-feira, 8h às 16h'),
(2, 'CRM5678', 'Segunda a Sexta-feira, 9h às 17h'),
(3, 'CRM9101', 'Segunda a Sexta-feira, 10h às 18h'),
(4, 'CRM1122', 'Segunda a Sexta-feira, 7h às 15h');


INSERT INTO medicos_especializacoes (especializacoes_id, medicos_funcionario_id, dt_inicializacao, dt_finalizacao) VALUES
(1, 1, '2023-01-01 09:00:00', '2024-01-01 09:00:00'),
(2, 2, '2023-01-01 09:00:00', '2024-01-01 09:00:00'),
(3, 3, '2023-01-01 09:00:00', '2024-01-01 09:00:00'),
(4, 4, '2023-01-01 09:00:00', '2024-01-01 09:00:00');

-- -----------------------------------------------------
-- Table endereco
-- -----------------------------------------------------
INSERT INTO enderecos (cep, uf, cidade, bairro, logradouro, numero)VALUES
('01010-000', 'SP', 'São Paulo', 'Centro', 'Rua XV de Novembro', '100'),
('20020-100', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Avenida Atlântica', '2000'),
('30130-010', 'MG', 'Belo Horizonte', 'Funcionários', 'Rua Pernambuco', '150'),
('40010-000', 'BA', 'Salvador', 'Centro', 'Praça da Sé', '500'),
('60010-150', 'CE', 'Fortaleza', 'Centro', 'Rua Barao do Rio Branco', '50'),
('70010-300', 'DF', 'Brasília', 'Asa Norte', 'Avenida W3', '700'),
('80010-050', 'PR', 'Curitiba', 'Centro', 'Rua XV de Novembro', '100'),
('81010-060', 'PR', 'Curitiba', 'Água Verde', 'Rua José Loureiro', '120'),
('90010-150', 'RS', 'Porto Alegre', 'Centro', 'Rua dos Andradas', '500'),
('98010-200', 'RS', 'Santa Maria', 'Centro', 'Rua Duque de Caxias', '130');


-- -----------------------------------------------------
-- Table quartos
-- -----------------------------------------------------
INSERT INTO quartos (numero, tipo, num_leitos, num_leitos_ocupados, localizacao, status, valor) VALUES
(101, 'Enfermaria', 4, 4, 'Bloco A - Andar 1', 'Ocupado', 350.00),
(102, 'Enfermaria', 4, 4, 'Bloco A - Andar 1', 'Ocupado', 350.00),
(103, 'Enfermaria', 3, 1, 'Bloco A - Andar 1', 'Disponível', 300.00),
(104, 'Enfermaria', 4, 0, 'Bloco A - Andar 2', 'Disponível', 340.00),
(201, 'Apoio', 1, 1, 'Bloco B - Andar 1', 'Ocupado', 200.00),
(202, 'Apoio', 1, 0, 'Bloco B - Andar 1', 'Disponível', 200.00),
(301, 'VIP', 1, 1, 'Bloco C - Andar 1', 'Ocupado', 900.00),
(302, 'VIP', 1, 0, 'Bloco C - Andar 1', 'Disponível', 900.00),
(401, 'CTI', 10, 0, 'Bloco D - Andar 1', 'Disponível', 1500.00),
(402, 'CTI', 10, 0, 'Bloco D - Andar 1', 'Disponível', 1500.00);

-- -----------------------------------------------------
-- Table convenios
-- -----------------------------------------------------
INSERT INTO convenios (nome, cnpj, cobertura) VALUES
('Unimed', '12.345.678/0001-90', 'Cobertura Completa'),
('Bradesco Saúde', '23.456.789/0001-01', 'Cobertura Completa'),
('SulAmérica Saúde', '34.567.890/0001-12', 'Cobertura Parcial'),
('Amil', '45.678.901/0001-23', 'Cobertura Completa'),
('NotreDame Intermédica', '56.789.012/0001-34', 'Cobertura Parcial'),
('Porto Seguro Saúde', '67.890.123/0001-45', 'Cobertura Completa'),
('Hapvida', '78.901.234/0001-56', 'Cobertura Parcial'),
('Intermédica', '89.012.345/0001-67', 'Cobertura Completa'),
('São Cristóvão Saúde', '90.123.456/0001-78', 'Cobertura Parcial'),
('GreenLine Saúde', '01.234.567/0001-89', 'Cobertura Completa');


-- -----------------------------------------------------
-- Table pacientes
-- -----------------------------------------------------
INSERT INTO pacientes (nome, rg, cpf, sexo, dt_nascimento, endereco_id, convenios_id) VALUES
('Felipe Andrade', '222333444', '123.456.789-00', 'Masculino', '1992-01-15', 1, 1),
('Juliana Almeida', '555666777', '987.654.321-00', 'Feminino', '1985-07-21', 2, 2),
('Carlos Roberto', '888999000', '123.456.789-00', 'Masculino', '1988-09-17', 3, 3),
('Vanessa Ferreira', '444555666', '123.123.123-00', 'Feminino', '1995-12-10', 4, 4),
('Ricardo Santos', '111222333', '654.654.654-00', 'Masculino', '1990-03-25', 5, 5),
('Patricia Lima', '123456789', '987.654.321-00', 'Feminino', '1983-04-17', 6, 6),
('Lucas Rocha', '234567890', '123.123.123-00', 'Masculino', '1998-02-05', 7, 7),
('Carla Sousa', '345678901', '654.654.654-00', 'Feminino', '1990-08-30', 8, 8),
('Fabio Costa', '456789012', '987.654.321-00', 'Masculino', '1982-06-18', 9, 9),
('Rita Souza', '567890123', '123.456.789-00', 'Feminino', '1997-11-11', 10, 10);

-- -----------------------------------------------------
-- Table telefones_pacientes
-- -----------------------------------------------------
INSERT INTO telefones_pacientes (paciente_id, numero) VALUES
(1, '(11)987654321'),
(1, '(11)22334455'),
(2, '(21)988776655'),
(2, '(21)99001122'),
(3, '(31)98765432'),
(4, '(41)999887766'),
(5, '(51)98237465'),
(6, '(61)99887766'),
(7, '(71)98776655'),
(5, '(51)98765432'),
(8, '(51)98765432'),
(9, '(61)99887766'),
(10, '(71)98776655');

-- -----------------------------------------------------
-- Table internacoes
-- -----------------------------------------------------
INSERT INTO internacoes (paciente_id, medico_id, quarto_id, motivo, data_ini, data_fim, diagnostico) VALUES
(6, 3, 1, 'Infecção urinária', '2024-06-15 11:30:00', NULL, 'Em tratamento'),
(7, 4, 2, 'Queimaduras de terceiro grau', '2024-07-05 08:00:00', NULL, 'Em recuperação'),
(8, 4, 2, 'Covid-19 grave', '2024-08-02 09:00:00', NULL, 'Em tratamento'),
(9, 3, 2, 'Câncer de pulmão', '2024-09-10 14:00:00', NULL, 'Em tratamento'),
(10, 1, 2, 'Acidente vascular cerebral', '2024-10-12 16:00:00', NULL, 'Em recuperação');

-- -----------------------------------------------------
-- Table cirurgias
-- -----------------------------------------------------
INSERT INTO cirurgias (internacao_id, descricao, data_ini, data_fim, status, valor) VALUES
(1, 'Rinoplastia estética', '2024-10-06 15:00:00', '2024-10-06 16:30:00', 'Concluída', 4500.00),
(2, 'Lipoaspiração', '2024-10-07 09:30:00', '2024-10-07 11:00:00', 'Concluída', 3500.00),
(3, 'Cirurgia de varizes', '2024-10-08 13:00:00', '2024-10-08 14:30:00', 'Concluída', 1200.00),
(4, 'Cirurgia de hérnia umbilical', '2024-10-09 08:00:00', '2024-10-09 09:30:00', 'Concluída', 1500.00),
(5, 'Retirada de tumor cerebral', '2024-10-10 07:30:00', '2024-10-10 12:00:00', 'Concluída', 9500.00);

-- -----------------------------------------------------
-- Table consultas
-- -----------------------------------------------------
INSERT INTO consultas (paciente_id, medico_id, motivo, descricao, data_hora, status, diagnostico) VALUES
(1, 1, 'Consulta de rotina', 'Consulta para exame de sangue e acompanhamento de saúde geral.', '2024-10-01 08:30:00', 'Concluída', 'Saúde geral estável'),
(2, 4, 'Dor abdominal', 'Paciente com dor abdominal aguda, exame físico realizado.', '2024-10-02 09:00:00', 'Concluída', 'Apendicite aguda'),
(3, 3, 'Consultoria psicológica', 'Acompanhamento psicológico devido a transtornos de ansiedade.', '2024-10-03 14:00:00', 'Em andamento', NULL),
(4, 2, 'Consulta pós-cirúrgica', 'Acompanhamento pós-cirúrgico para remoção de tumor.', '2024-10-04 10:00:00', 'Concluída', 'Sem complicações pós-operatórias'),
(5, 1, 'Controle de diabetes', 'Monitoramento dos níveis de glicose e ajustes na medicação.', '2024-10-05 11:30:00', 'Concluída', 'Diabetes tipo 2 estável');

-- -----------------------------------------------------
-- Table unidades_medidas
-- -----------------------------------------------------
INSERT INTO unidades_medidas (tipo) VALUES
('ml'),
('g'),
('mg'),
('UI'),
('cápsula'); 

-- -----------------------------------------------------
-- Table enfermeiros
-- -----------------------------------------------------
INSERT INTO enfermeiros (funcionarios_id, coren, formacao) VALUES
(5, 'COREN-SP12345', 'Enfermeiro Geral'),
(6, 'COREN-RJ98765', 'Enfermeiro de UTI'),
(7, 'COREN-MG54321', 'Enfermeiro Obstetra'),
(8, 'COREN-BA67890', 'Enfermeiro Pediátrico');

-- -----------------------------------------------------
-- Table enfermeiros_especializacoes
-- -----------------------------------------------------
INSERT INTO enfermeiros_especializacoes (especializacoes_id, enfermeiros_funcionarios_id, dt_inicializacao, dt_finalizacao) VALUES
(5, 5, '2020-05-01 08:00:00', '2022-05-01 08:00:00'),
(6, 6, '2019-03-15 08:00:00', '2021-03-15 08:00:00'),
(7, 7, '2020-07-10 08:00:00', '2023-07-10 08:00:00'), 
(7, 8, '2021-02-20 08:00:00', '2023-02-20 08:00:00');

-- -----------------------------------------------------
-- Table enfermeiros_internacoes
-- -----------------------------------------------------
INSERT INTO enfermeiros_internacoes (enfermeiros_funcionarios_id, internacoes_id) VALUES
(5, 1),  
(6, 2),  
(7, 3),  
(8, 4),
(5, 5); 

-- -----------------------------------------------------
-- Table estoque_itens
-- -----------------------------------------------------
INSERT INTO estoque_itens (nome, descricao, categoria, unidade_medida, quantidade, localizacao, fornecedor, status) VALUES
('Gaze', 'Gaze esterilizada', 'Curativo', 'unidade', 100, 'Armazenamento A1', 'Fornecedor A', 'Disponível'),
('Soro Fisiológico', 'Soro 0,9% para infusão', 'Medicamento', 'litro', 50, 'Armazenamento B2', 'Fornecedor B', 'Disponível'),
('Analgesia', 'Analgésico para dores leves a moderadas', 'Medicamento', 'unidade', 200, 'Armazenamento C3', 'Fornecedor C', 'Disponível'),
('Bandaid', 'Bandaid para curativos rápidos', 'Curativo', 'caixa', 150, 'Armazenamento A4', 'Fornecedor A', 'Disponível'),
('Antisséptico', 'Antisséptico para desinfecção', 'Desinfetante', 'litro', 30, 'Armazenamento B1', 'Fornecedor D', 'Disponível'),
('Termômetro', 'Termômetro digital', 'Equipamento', 'unidade', 50, 'Armazenamento D2', 'Fornecedor E', 'Disponível'),
('Esterilizador', 'Esterilizador de instrumentos', 'Equipamento', 'unidade', 5, 'Armazenamento E1', 'Fornecedor F', 'Disponível'),
('Agulha', 'Agulha descartável', 'Material', 'caixa', 300, 'Armazenamento C1', 'Fornecedor G', 'Disponível'),
('Máscara', 'Máscara cirúrgica', 'Equipamento', 'pacote', 100, 'Armazenamento B3', 'Fornecedor H', 'Disponível'),
('Luvas', 'Luvas de procedimento', 'Material', 'pacote', 80, 'Armazenamento D3', 'Fornecedor I', 'Disponível');

-- -----------------------------------------------------
-- Table estoque_itens_consultas
-- -----------------------------------------------------
INSERT INTO estoque_itens_consultas (consultas_id, estoque_itens_id, dt_usado) VALUES
(1, 1, '2024-01-15 08:00:00'),
(2, 2, '2024-02-12 09:00:00'),
(3, 3, '2024-03-15 10:00:00'),
(4, 4, '2024-04-20 11:00:00'),
(5, 5, '2024-05-10 12:00:00');

-- -----------------------------------------------------
-- Table estoque_itens_internacoes
-- -----------------------------------------------------
INSERT INTO estoque_itens_internacoes (internacoes_id, estoque_itens_id, dt_usado) VALUES
(1, 1, '2024-01-16 08:00:00'),
(2, 2, '2024-02-13 09:00:00'),
(3, 3, '2024-03-16 10:00:00'),
(4, 4, '2024-04-21 11:00:00'),
(5, 5, '2024-05-11 12:00:00');

-- -----------------------------------------------------
-- Table estoque_medicamentos
-- -----------------------------------------------------
INSERT INTO estoque_medicamentos (nome, quantidade, localizacao, data_validade, fornecedor, status, valor) VALUES
('Dipirona', 100, 'Armazenamento A', '2025-05-01', 'Fornecedor A', 'Disponível', 10.00),
('Amoxicilina', 50, 'Armazenamento B', '2025-06-15', 'Fornecedor B', 'Disponível', 20.00),
('Ibuprofeno', 200, 'Armazenamento C', '2025-07-20', 'Fornecedor C', 'Disponível', 15.00),
('Paracetamol', 150, 'Armazenamento D', '2025-08-30', 'Fornecedor D', 'Disponível', 12.00),
('Lorazepam', 70, 'Armazenamento E', '2025-09-10', 'Fornecedor E', 'Disponível', 18.00),
('Omeprazol', 90, 'Armazenamento F', '2025-10-15', 'Fornecedor F', 'Disponível', 22.00),
('Prednisona', 60, 'Armazenamento G', '2025-11-01', 'Fornecedor G', 'Disponível', 25.00),
('Metformina', 80, 'Armazenamento H', '2025-12-10', 'Fornecedor H', 'Disponível', 10.00),
('Loratadina', 100, 'Armazenamento I', '2025-12-20', 'Fornecedor I', 'Disponível', 8.00),
('Clopidogrel', 120, 'Armazenamento J', '2026-01-05', 'Fornecedor J', 'Disponível', 35.00);

-- -----------------------------------------------------
-- Table vias_administracao
-- -----------------------------------------------------
INSERT INTO vias_administracao (via) VALUES
('Oral'), 
('Intravenosa'), 
('Intramuscular'), 
('Subcutânea'), 
('Inalatória'),
('Tópica'), 
('Retal'), 
('Ocular'), 
('Nasal'), 
('Sublingual');

-- -----------------------------------------------------
-- Table exames
-- -----------------------------------------------------
INSERT INTO exames (nome, descricao, data_hora, status, resultado, valor) VALUES
('Hemograma', 'Exame de sangue completo', '2024-01-10 08:00:00', 'Concluído', 'Normal', 50.00),
('Raio-X', 'Raio-X do tórax', '2024-01-15 09:00:00', 'Concluído', 'Normal', 80.00),
('Ultrassom', 'Ultrassonografia abdominal', '2024-02-20 10:00:00', 'Concluído', 'Alterado', 120.00),
('Eletrocardiograma', 'Exame do coração', '2024-03-25 11:00:00', 'Concluído', 'Normal', 70.00),
('Tomografia', 'Tomografia computadorizada', '2024-04-30 12:00:00', 'Concluído', 'Alterado', 300.00),
('Endoscopia', 'Exame para visualização do trato digestivo', '2024-05-05 13:00:00', 'Concluído', 'Normal', 250.00),
('Mamo', 'Mamografia', '2024-06-15 14:00:00', 'Concluído', 'Normal', 150.00),
('Ressonância Magnética', 'Ressonância Magnética do cérebro', '2024-07-20 15:00:00', 'Concluído', 'Alterado', 400.00),
('Teste de esforço', 'Teste para avaliar a função cardíaca', '2024-08-10 16:00:00', 'Concluído', 'Normal', 200.00),
('Exame de urina', 'Exame para análise de urina', '2024-09-01 17:00:00', 'Concluído', 'Normal', 30.00),
('Hemograma', 'Exame de sangue completo', '2024-01-10 12:00:00', 'Concluído', 'Normal', 50.00),
('Ultrassom', 'Ultrassonografia abdominal', '2024-02-20 10:00:00', 'Em andamento', 'Alterado', 120.00);

-- -----------------------------------------------------
-- Table exames_consultas
-- -----------------------------------------------------
INSERT INTO exames_consultas (consulta_id, exame_id) VALUES
(1, 1), 
(1, 11),
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5),
(3, 12);

-- -----------------------------------------------------
-- Table estoque_itens_exames
-- -----------------------------------------------------
INSERT INTO estoque_itens_exames (exames_id, estoque_itens_id, dt_usado) VALUES
(1, 1, '2024-01-10 08:00:00'),
(2, 2, '2024-01-15 09:00:00'),
(3, 3, '2024-02-20 10:00:00'),
(4, 4, '2024-03-25 11:00:00'),
(5, 5, '2024-04-30 12:00:00'),
(6, 6, '2024-05-05 13:00:00'),
(7, 7, '2024-06-15 14:00:00'),
(8, 8, '2024-07-20 15:00:00'),
(9, 9, '2024-08-10 16:00:00'),
(10, 10, '2024-09-01 17:00:00');

-- -----------------------------------------------------
-- Table exames_internacoes
-- -----------------------------------------------------
INSERT INTO exames_internacoes (internacao_id, exame_id) VALUES
(1, 6), 
(2, 7), 
(3, 8), 
(4, 9), 
(5, 10);

-- -----------------------------------------------------
-- Table historicos_medicos
-- -----------------------------------------------------
INSERT INTO historicos_medicos (pacientes_id, historico, data) VALUES
(1, 'Paciente com histórico de diabetes tipo 2. Em tratamento contínuo com insulina.', '2024-01-15 14:30:00'),
(2, 'Paciente com histórico de hipertensão e dislipidemia. Usa medicamentos para controle diário.', '2024-02-05 09:00:00'),
(3, 'Paciente com histórico de asma. Fez tratamento com corticosteroides por 6 meses.', '2024-03-22 10:00:00'),
(4, 'Paciente com histórico de cirurgia cardíaca. Realizou procedimento de bypass coronariano em 2020.', '2024-04-10 11:45:00'),
(5, 'Paciente com histórico de alergias alimentares a frutos do mar.', '2024-05-18 08:15:00'),
(6, 'Paciente com histórico de acidente vascular cerebral (AVC) em 2019. Em reabilitação até o momento.', '2024-06-30 15:30:00'),
(7, 'Paciente com histórico de câncer de mama, em remissão após tratamento quimioterápico.', '2024-07-12 16:45:00'),
(8, 'Paciente com histórico de fratura no fêmur esquerdo, realizado procedimento cirúrgico para fixação.', '2024-08-22 17:00:00'),
(9, 'Paciente com histórico de doenças autoimunes (lúpus), em acompanhamento com reumatologista.', '2024-09-15 13:30:00'),
(10, 'Paciente com histórico de problemas psiquiátricos, em tratamento com antidepressivos e acompanhamento psicológico.', '2024-10-10 12:00:00');


-- -----------------------------------------------------
-- Table pagamentos
-- -----------------------------------------------------
INSERT INTO pagamentos (valor_total, data_pag, status, pacientes_id, consultas_id, internacoes_id) VALUES
(150.00, '2024-01-10 10:00:00', 'Pendente', 1, 1, NULL),
(200.00, '2024-02-12 11:00:00', 'Pago', 2, 2, NULL),
(250.00, '2024-03-20 12:00:00', 'Pago', 3, 3, NULL),
(300.00, '2024-04-25 13:00:00', 'Pendente', 4, 4, NULL),
(350.00, '2024-05-10 14:00:00', 'Pago', 5, 5, NULL),
(400.00, '2024-06-15 15:00:00', 'Pago', 6, NULL, 1),
(450.00, '2024-07-20 16:00:00', 'Pendente', 7, NULL, 2),
(500.00, '2024-08-10 17:00:00', 'Pago', 8, NULL, 3),
(550.00, '2024-09-15 18:00:00', 'Pago', 9, NULL, 4),
(600.00, '2024-10-01 19:00:00', 'Pendente', 10, NULL, 5);

-- -----------------------------------------------------
-- Table servicos_gerais
-- -----------------------------------------------------
INSERT INTO servicos_gerais (funcionarios_id) VALUES
(10);

-- -----------------------------------------------------
-- Table servicos_gerais_especializacoes
-- -----------------------------------------------------
INSERT INTO servicos_gerais_especializacoes (especializacoes_id, servicos_gerais_funcionarios_id, dt_inicializacao, dt_finalizacao) VALUES
(8, 10, '2024-01-01 08:00:00', '2024-06-01 17:00:00');

-- -----------------------------------------------------
-- Table servicos_gerais_quartos
-- -----------------------------------------------------
INSERT INTO servicos_gerais_quartos (quartos_id, servicos_gerais_id) VALUES
(1, 10), 
(2, 10), 
(3, 10), 
(4, 10), 
(5, 10),
(6, 10), 
(7, 10), 
(8, 10), 
(9, 10), 
(10, 10);

-- -----------------------------------------------------
-- Table servicos_gerais_quartos_estoque_itens
-- -----------------------------------------------------
INSERT INTO servicos_gerais_quartos_estoque_itens (estoque_itens_id, quartos_id, servicos_gerais_id, dt_usado) VALUES
(1, 1, 10, '2024-01-01 08:00:00'),
(2, 2, 10, '2024-02-01 09:00:00'),
(3, 3, 10, '2024-03-01 10:00:00'),
(4, 4, 10, '2024-04-01 11:00:00'),
(5, 5, 10, '2024-05-01 12:00:00'),
(6, 6, 10, '2024-06-01 13:00:00'),
(7, 7, 10, '2024-07-01 14:00:00'),
(8, 8, 10, '2024-08-01 15:00:00'),
(9, 9, 10, '2024-09-01 16:00:00'),
(10, 10, 10, '2024-10-01 17:00:00');