CREATE DATABASE banco_dados_hospitalar;

USE banco_dados_hospitalar;

-- -----------------------------------------------------
-- Table departamentos
-- -----------------------------------------------------
CREATE TABLE departamentos (

  id INT UNSIGNED AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  numero INT(8) NOT NULL,
  localizacao VARCHAR(45) NOT NULL,
  descricao VARCHAR(100) NOT NULL,
  gerente INT UNSIGNED NOT NULL,
  PRIMARY KEY (id)

);

-- -----------------------------------------------------
-- Table funcionarios
-- -----------------------------------------------------
CREATE TABLE funcionarios (

  id INT UNSIGNED AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  rg VARCHAR(12) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  sexo VARCHAR(45) NOT NULL,
  dt_nascimento DATE NOT NULL,
  salario DECIMAL(0.2) NOT NULL,
  dt_admissao DATETIME NOT NULL,
  departamento_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (departamento_id) REFERENCES departamentos (id)

);

-- -----------------------------------------------------
-- Table telefones_funcionarios
-- -----------------------------------------------------
CREATE TABLE telefones_funcionarios (

  funcionario_id INT UNSIGNED NOT NULL,
  numero VARCHAR(16) NOT NULL,
  PRIMARY KEY (funcionario_id, numero),
  FOREIGN KEY (funcionario_id) REFERENCES funcionarios (id)
  
);

-- -----------------------------------------------------
-- Table administradores
-- -----------------------------------------------------
CREATE TABLE administradores (

  funcionarios_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (funcionarios_id),
  FOREIGN KEY (funcionarios_id) REFERENCES funcionarios (id)

);

-- -----------------------------------------------------
-- Table especializacoes
-- -----------------------------------------------------
CREATE TABLE especializacoes (

  id INT UNSIGNED AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)

);

-- -----------------------------------------------------
-- Table administradores_especializacoes
-- -----------------------------------------------------
CREATE TABLE administradores_especializacoes (

  especializacoes_id INT UNSIGNED NOT NULL,
  administradores_funcionarios_id INT UNSIGNED NOT NULL,
  dt_inicializacao DATETIME NOT NULL,
  dt_finalizacao DATETIME NOT NULL,
  PRIMARY KEY (especializacoes_id, administradores_funcionarios_id, dt_inicializacao, dt_finalizacao),
  FOREIGN KEY (especializacoes_id) REFERENCES especializacoes (id),
  FOREIGN KEY (administradores_funcionarios_id) REFERENCES administradores (funcionarios_id)

);

-- -----------------------------------------------------
-- Table medicos
-- -----------------------------------------------------
CREATE TABLE medicos (

  funcionario_id INT UNSIGNED NOT NULL,
  crm VARCHAR(10) NOT NULL,
  escala_trabalho VARCHAR(45) NOT NULL,
  PRIMARY KEY (funcionario_id),
  FOREIGN KEY (funcionario_id) REFERENCES funcionarios (id)
  
);

-- -----------------------------------------------------
-- Table medicos_especializacoes
-- -----------------------------------------------------
CREATE TABLE medicos_especializacoes (

  especializacoes_id INT UNSIGNED NOT NULL,
  medicos_funcionario_id INT UNSIGNED NOT NULL,
  dt_inicializacao DATETIME NOT NULL,
  dt_finalizacao DATETIME NOT NULL,
  PRIMARY KEY (especializacoes_id, medicos_funcionario_id, dt_inicializacao, dt_finalizacao),
  FOREIGN KEY (especializacoes_id) REFERENCES especializacoes (id),
  FOREIGN KEY (medicos_funcionario_id) REFERENCES medicos (funcionario_id)

);

-- -----------------------------------------------------
-- Table enderecos
-- -----------------------------------------------------
CREATE TABLE enderecos (

  id INT UNSIGNED AUTO_INCREMENT,
  cep VARCHAR(9) NOT NULL,
  uf VARCHAR(2) NOT NULL,
  cidade VARCHAR(50) NOT NULL,
  bairro VARCHAR(50) NOT NULL,
  logradouro VARCHAR(50) NOT NULL,
  numero VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)

);

-- -----------------------------------------------------
-- Table quartos
-- -----------------------------------------------------
CREATE TABLE quartos (

  id INT UNSIGNED AUTO_INCREMENT,
  numero INT NOT NULL,
  tipo VARCHAR(45) NOT NULL,
  num_leitos INT NOT NULL,
  num_leitos_ocupados INT NOT NULL,
  localizacao VARCHAR(45) NOT NULL,
  status VARCHAR(45) NOT NULL,
  valor DECIMAL(0.2) NOT NULL,
  PRIMARY KEY (id)

);

-- -----------------------------------------------------
-- Table convenios
-- -----------------------------------------------------
CREATE TABLE convenios (

  id INT UNSIGNED AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  cnpj VARCHAR(18) NOT NULL,
  cobertura VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
  
);

-- -----------------------------------------------------
-- Table pacientes
-- -----------------------------------------------------
CREATE TABLE pacientes (

  id INT UNSIGNED AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  rg VARCHAR(12) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  sexo VARCHAR(20) NOT NULL,
  dt_nascimento DATE NOT NULL,
  endereco_id INT UNSIGNED NOT NULL,
  convenios_id INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (endereco_id) REFERENCES enderecos (id),
  FOREIGN KEY (convenios_id) REFERENCES convenios (id)
  
);

-- -----------------------------------------------------
-- Table telefones_pacientes
-- -----------------------------------------------------
CREATE TABLE telefones_pacientes (

  paciente_id INT UNSIGNED NOT NULL,
  numero VARCHAR(16) NOT NULL,
  PRIMARY KEY (paciente_id, numero),
  FOREIGN KEY (paciente_id) REFERENCES pacientes (id)

);

-- -----------------------------------------------------
-- Table internacoes
-- -----------------------------------------------------
CREATE TABLE internacoes (

  id INT UNSIGNED AUTO_INCREMENT,
  paciente_id INT UNSIGNED NOT NULL,
  medico_id INT UNSIGNED NOT NULL,
  quarto_id INT UNSIGNED NOT NULL,
  motivo VARCHAR(255) NOT NULL,
  data_ini DATETIME NOT NULL,
  data_fim DATETIME NULL,
  diagnostico VARCHAR(100) NULL,
  valor_total DECIMAL(0.2) NULL DEFAULT(0),
  PRIMARY KEY (id),
  FOREIGN KEY (paciente_id) REFERENCES pacientes (id),
  FOREIGN KEY (medico_id) REFERENCES medicos (funcionario_id),
  FOREIGN KEY (quarto_id) REFERENCES quartos (id)

);

-- -----------------------------------------------------
-- Table cirurgias
-- -----------------------------------------------------
CREATE TABLE cirurgias (

  id INT UNSIGNED AUTO_INCREMENT,
  internacao_id INT UNSIGNED NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  data_ini DATETIME NOT NULL,
  data_fim DATETIME NULL,
  status VARCHAR(20) NOT NULL,
  valor DECIMAL(0.2) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (internacao_id) REFERENCES internacoes (id)
    
);

-- -----------------------------------------------------
-- Table consultas
-- -----------------------------------------------------
CREATE TABLE consultas (

  id INT UNSIGNED AUTO_INCREMENT,
  paciente_id INT UNSIGNED NOT NULL,
  medico_id INT UNSIGNED NOT NULL,
  motivo VARCHAR(45) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  data_hora DATETIME NOT NULL,
  status VARCHAR(20) NOT NULL,
  diagnostico VARCHAR(45) NULL,
  valor_total DECIMAL(0.2) NULL DEFAULT(0),
  PRIMARY KEY (id),
  FOREIGN KEY (paciente_id) REFERENCES pacientes (id),
  FOREIGN KEY (medico_id) REFERENCES medicos (funcionario_id)

);

-- -----------------------------------------------------
-- Table unidades_medidas
-- -----------------------------------------------------
CREATE TABLE unidades_medidas (

  id INT UNSIGNED AUTO_INCREMENT,
  tipo VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)

);

-- -----------------------------------------------------
-- Table enfermeiros
-- -----------------------------------------------------
CREATE TABLE enfermeiros (

  funcionarios_id INT UNSIGNED NOT NULL,
  coren VARCHAR(13) NOT NULL,
  formacao VARCHAR(45) NOT NULL,
  PRIMARY KEY (funcionarios_id),
  FOREIGN KEY (funcionarios_id) REFERENCES funcionarios (id)
   
);

-- -----------------------------------------------------
-- Table enfermeiros_especializacoes
-- -----------------------------------------------------
CREATE TABLE enfermeiros_especializacoes (

  especializacoes_id INT UNSIGNED NOT NULL,
  enfermeiros_funcionarios_id INT UNSIGNED NOT NULL,
  dt_inicializacao DATETIME NOT NULL,
  dt_finalizacao DATETIME NOT NULL,
  PRIMARY KEY (especializacoes_id, enfermeiros_funcionarios_id, dt_inicializacao, dt_finalizacao),
  FOREIGN KEY (especializacoes_id) REFERENCES especializacoes (id),
  FOREIGN KEY (enfermeiros_funcionarios_id) REFERENCES enfermeiros (funcionarios_id)
    
);

-- -----------------------------------------------------
-- Table enfermeiros_internacoes
-- -----------------------------------------------------
CREATE TABLE enfermeiros_internacoes (

  enfermeiros_funcionarios_id INT UNSIGNED NOT NULL,
  internacoes_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (enfermeiros_funcionarios_id, internacoes_id),
  FOREIGN KEY (enfermeiros_funcionarios_id) REFERENCES enfermeiros (funcionarios_id),
  FOREIGN KEY (internacoes_id) REFERENCES internacoes (id)

);

-- -----------------------------------------------------
-- Table estoque_itens
-- -----------------------------------------------------
CREATE TABLE estoque_itens (

  id INT UNSIGNED AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  categoria VARCHAR(100) NOT NULL,
  unidade_medida VARCHAR(45) NOT NULL,
  quantidade INT NOT NULL,
  localizacao VARCHAR(45) NOT NULL,
  fornecedor VARCHAR(45) NOT NULL,
  status VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)

);

-- -----------------------------------------------------
-- Table estoque_itens_consultas
-- -----------------------------------------------------
CREATE TABLE estoque_itens_consultas (

  consultas_id INT UNSIGNED NOT NULL,
  estoque_itens_id INT UNSIGNED NOT NULL,
  dt_usado DATETIME NOT NULL,
  PRIMARY KEY (consultas_id, estoque_itens_id, dt_usado),
  FOREIGN KEY (consultas_id) REFERENCES consultas (id),
  FOREIGN KEY (estoque_itens_id) REFERENCES estoque_itens (id)
    
);

-- -----------------------------------------------------
-- Table estoque_itens_internacoes
-- -----------------------------------------------------
CREATE TABLE estoque_itens_internacoes (

  internacoes_id INT UNSIGNED NOT NULL,
  estoque_itens_id INT UNSIGNED NOT NULL,
  dt_usado DATETIME NOT NULL,
  PRIMARY KEY (internacoes_id, estoque_itens_id, dt_usado),
  FOREIGN KEY (internacoes_id) REFERENCES internacoes (id),
  FOREIGN KEY (estoque_itens_id) REFERENCES estoque_itens (id)
  
);

-- -----------------------------------------------------
-- Table estoque_medicamentos
-- -----------------------------------------------------
CREATE TABLE estoque_medicamentos (

  id INT UNSIGNED AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  quantidade INT NOT NULL,
  localizacao VARCHAR(45) NOT NULL,
  data_validade DATE NOT NULL,
  fornecedor VARCHAR(45) NOT NULL,
  status VARCHAR(45) NOT NULL,
  valor DECIMAL(0.2) NOT NULL,
  PRIMARY KEY (id)
  
);

-- -----------------------------------------------------
-- Table vias_administracao
-- -----------------------------------------------------
CREATE TABLE vias_administracao (

  id INT UNSIGNED AUTO_INCREMENT,
  via VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
  
);

-- -----------------------------------------------------
-- Table receitas
-- -----------------------------------------------------
CREATE TABLE receitas (

  consultas_id INT UNSIGNED NOT NULL,
  medicamentos_id INT UNSIGNED NOT NULL,
  qtd_medicamento INT NOT NULL,
  descricao_uso VARCHAR(255) NOT NULL,
  unidade_medida_id INT UNSIGNED NOT NULL,
  vias_administracao_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (consultas_id, medicamentos_id),
  FOREIGN KEY (vias_administracao_id) REFERENCES vias_administracao (id),
  FOREIGN KEY (unidade_medida_id) REFERENCES unidades_medidas (id),
  FOREIGN KEY (consultas_id) REFERENCES consultas (id),
  FOREIGN KEY (medicamentos_id) REFERENCES estoque_medicamentos (id)
  
);

-- -----------------------------------------------------
-- Table exames
-- -----------------------------------------------------
CREATE TABLE exames (

  id INT UNSIGNED AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  data_hora DATETIME NOT NULL,
  status VARCHAR(20) NOT NULL,
  resultado VARCHAR(255) NOT NULL,
  valor DECIMAL(0.2) NOT NULL,
  PRIMARY KEY (id)
  
);

-- -----------------------------------------------------
-- Table exames_consultas
-- -----------------------------------------------------
CREATE TABLE exames_consultas (

  consulta_id INT UNSIGNED NOT NULL,
  exame_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (consulta_id, exame_id),
  FOREIGN KEY (consulta_id) REFERENCES consultas (id),
  FOREIGN KEY (exame_id) REFERENCES exames (id)

);

-- -----------------------------------------------------
-- Table estoque_itens_exames
-- -----------------------------------------------------
CREATE TABLE estoque_itens_exames (

  exames_id INT UNSIGNED NOT NULL,
  estoque_itens_id INT UNSIGNED NOT NULL,
  dt_usado DATETIME NOT NULL,
  PRIMARY KEY (exames_id, estoque_itens_id, dt_usado),
  FOREIGN KEY (exames_id) REFERENCES exames (id),
  FOREIGN KEY (estoque_itens_id) REFERENCES estoque_itens (id)
  
);

-- -----------------------------------------------------
-- Table exames_internacoes
-- -----------------------------------------------------
CREATE TABLE exames_internacoes (

  internacao_id INT UNSIGNED NOT NULL,
  exame_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (internacao_id, exame_id),
  FOREIGN KEY (internacao_id) REFERENCES internacoes (id),
  FOREIGN KEY (exame_id) REFERENCES exames (id)

);

-- -----------------------------------------------------
-- Table historicos_medicos
-- -----------------------------------------------------
CREATE TABLE historicos_medicos (

  id INT UNSIGNED AUTO_INCREMENT,
  pacientes_id INT UNSIGNED NOT NULL,
  historico VARCHAR(255) NOT NULL,
  data DATETIME NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (pacientes_id) REFERENCES pacientes (id)

);

-- -----------------------------------------------------
-- Table pagamentos
-- -----------------------------------------------------
CREATE TABLE pagamentos (

  id INT UNSIGNED AUTO_INCREMENT,
  valor_total DECIMAL(0.2) NOT NULL,
  data_pag DATETIME NOT NULL,
  status VARCHAR(45) NOT NULL,
  pacientes_id INT UNSIGNED NOT NULL,
  consultas_id INT UNSIGNED NULL DEFAULT NULL,
  internacoes_id INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (id),  
  FOREIGN KEY (pacientes_id) REFERENCES pacientes (id),
  FOREIGN KEY (consultas_id) REFERENCES consultas (id),
  FOREIGN KEY (internacoes_id) REFERENCES internacoes (id)

);

-- -----------------------------------------------------
-- Table servicos_gerais
-- -----------------------------------------------------
CREATE TABLE servicos_gerais (

  funcionarios_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (funcionarios_id),
  FOREIGN KEY (funcionarios_id) REFERENCES funcionarios (id)
    
);

-- -----------------------------------------------------
-- Table servicos_gerais_especializacoes
-- -----------------------------------------------------
CREATE TABLE servicos_gerais_especializacoes (

  especializacoes_id INT UNSIGNED NOT NULL,
  servicos_gerais_funcionarios_id INT UNSIGNED NOT NULL,
  dt_inicializacao DATETIME NOT NULL,
  dt_finalizacao VARCHAR(45) NOT NULL,
  PRIMARY KEY (especializacoes_id, servicos_gerais_funcionarios_id, dt_inicializacao, dt_finalizacao),
  FOREIGN KEY (especializacoes_id) REFERENCES especializacoes (id),
  FOREIGN KEY (servicos_gerais_funcionarios_id) REFERENCES servicos_gerais (funcionarios_id)
  
);

-- -----------------------------------------------------
-- Table servicos_gerais_quartos
-- -----------------------------------------------------
CREATE TABLE servicos_gerais_quartos (

  quartos_id INT UNSIGNED NOT NULL,
  servicos_gerais_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (quartos_id, servicos_gerais_id),
  FOREIGN KEY (quartos_id) REFERENCES quartos (id),
  FOREIGN KEY (servicos_gerais_id) REFERENCES servicos_gerais (funcionarios_id)
  
);

-- -----------------------------------------------------
-- Table servicos_gerais_quartos_estoque_itens
-- -----------------------------------------------------
CREATE TABLE servicos_gerais_quartos_estoque_itens (

  estoque_itens_id INT UNSIGNED NOT NULL,
  quartos_id INT UNSIGNED NOT NULL,
  servicos_gerais_id INT UNSIGNED NOT NULL,
  dt_usado DATETIME NOT NULL,
  PRIMARY KEY (estoque_itens_id, quartos_id, servicos_gerais_id, dt_usado),
  FOREIGN KEY (estoque_itens_id) REFERENCES estoque_itens (id),
  FOREIGN KEY (quartos_id , servicos_gerais_id) REFERENCES servicos_gerais_quartos (quartos_id , servicos_gerais_id)

);


/**
* Procedures: Registrar consultas e gerar receitas médicas automaticamente.
*/

DELIMITER $$
CREATE PROCEDURE gerar_receita(IN new_consulta_id INT, IN new_medicamentos_id INT, IN new_qtd_medicamento INT, 
										 IN new_descricao_uso VARCHAR(255), IN new_unidade_medida_id INT, 
										 IN new_vias_administracao_id INT)
BEGIN 

	INSERT INTO receitas (
		consultas_id, medicamentos_id, qtd_medicamento, 
		descricao_uso, unidade_medida_id, vias_administracao_id
	)
	VALUES(
		(new_consulta_id, new_medicamentos_id, new_qtd_medicamento, new_descricao_uso, 
		 new_unidade_medida_id, new_vias_administracao_id)
	);

END $$
DELIMITER ;


/**
* Triggers: Atualizar o estoque de medicamentos após a prescrição.
*/

DELIMITER $$
CREATE TRIGGER tg_atualizar_estoque_medicamento
	AFTER
	INSERT
ON receitas
FOR EACH ROW
BEGIN 
	
	UPDATE estoque_medicamentos
	SET estoque_medicamentos.quantidade = estoque_medicamentos.quantidade - 1
	WHERE estoque_medicamentos.id = NEW.medicamentos.id;
	
END $$
DELIMITER $$


/**
* Views: Visão consolidada do prontuário médico de um paciente.
*/

CREATE OR REPLACE VIEW prontuario_medico AS
SELECT pacientes.nome AS Nome_Paciente, pacientes.rg AS RG_Paciente, pacientes.cpf AS CPF_Paciente,
		 pacientes.sexo AS Sexo_Paciente, pacientes.dt_nascimento AS Data_Nascimento_Paciente,
		 enderecos.cep AS CEP, enderecos.uf AS UF, enderecos.cidade AS Cidade, 
		 enderecos.bairro AS Bairro, enderecos.logradouro AS Logradouro, enderecos.numero AS Numero,
		 convenios.nome AS Nome_Convenio, convenios.cobertura AS Cobertura_Convenio,
		 telefones_pacientes.numero AS Numero_Telefone, consultas.motivo AS Motivo_Consulta,
		 consultas.descricao AS Descricao_Consulta, consultas.data_hora AS Data_Hora_Consulta,
		 consultas.status AS Status_Consulta, consultas.diagnostico AS Diagnostico_Consulta,
		 consultas.valor_total AS Valor_Total_Consulta, funcionarios.nome AS Nome_Medico,
		 exames.nome AS Nome_Exame, exames.descricao AS Descricao_Exame, exames.data_hora AS Data_Hora_Exame,
		 exames.status AS Status_Exame, exames.resultado AS Resultado_Exame, exames.valor AS Valor_Exame,
		 unidades_medidas.tipo AS Unidade_Medida_Medicamento, 
		 vias_administracao.via AS Via_Administracao, 
		 estoque_medicamentos.nome AS Nome_Medicamento, estoque_medicamentos.valor AS Valor_Medicamento
FROM pacientes
JOIN historicos_medicos ON historicos_medicos.pacientes_id = pacientes.id
JOIN enderecos ON pacientes.endereco_id = enderecos.id
JOIN telefones_pacientes ON telefones_pacientes.paciente_id = pacientes.id
JOIN convenios ON pacientes.convenios_id = convenios.id
JOIN consultas ON consultas.paciente_id = pacientes.id
JOIN receitas ON receitas.consultas_id = consultas.id
JOIN estoque_medicamentos ON estoque_medicamentos.id = receitas.medicamentos_id
JOIN exames_consultas ON consultas.id = exames_consultas.consulta_id
JOIN exames ON exames.id = exames_consultas.exame_id
JOIN medicos ON consultas.medico_id = medicos.funcionario_id
JOIN funcionarios ON funcionarios.id = medicos.funcionario_id
JOIN vias_administracao ON vias_administracao.id = receitas.vias_administracao_id
JOIN unidades_medidas ON unidades_medidas.id = receitas.unidade_medida_id  


/**
* Subqueries: Encontrar médicos com mais consultas em um período.
*/

SELECT funcionarios.id, funcionarios.nome, COUNT(consultas.medico_id) AS QTD_Consultas
FROM consultas
JOIN medicos ON consultas.medico_id = medicos.funcionario_id
JOIN funcionarios ON medicos.funcionario_id = funcionarios.id
GROUP BY consultas.medico_id
HAVING COUNT(consultas.medico_id) = (SELECT COUNT(c.medico_id) FROM consultas AS c WHERE c.data_hora BETWEEN '2023-10-01 08:30:00' AND '2025-10-01 08:30:00' GROUP BY c.medico_id ORDER BY COUNT(c.medico_id) DESC LIMIT 1)  
ORDER BY consultas.medico_id ASC                                                                                                         


/**
* Gerenciamento de Usuários: Perfis de acesso para médicos, enfermeiros, 
  administradores, recepcionistas.
*/

CREATE USER 'medicos_user'@'localhost' IDENTIFIED BY 'medico123';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.receitas TO 'medicos_user'@'localhost';
GRANT SELECT ON banco_dados_hospitalar.vias_administracao TO 'medicos_user'@'localhost';
GRANT SELECT ON banco_dados_hospitalar.unidades_medidas TO 'medicos_user'@'localhost';
GRANT SELECT, UPDATE ON banco_dados_hospitalar.consultas TO 'medicos_user'@'localhost';
GRANT SELECT, UPDATE ON banco_dados_hospitalar.exames TO 'medicos_user'@'localhost';
GRANT SELECT, UPDATE ON banco_dados_hospitalar.internacoes TO 'medicos_user'@'localhost';

CREATE USER 'enfermeiros_user'@'localhost' IDENTIFIED BY 'enfermeiro123';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.estoque_medicamentos TO 'enfermeiros_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.estoque_itens TO 'enfermeiros_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.estoque_itens_exames TO 'enfermeiros_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.estoque_itens_consultas TO 'enfermeiros_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.estoque_itens_internacoes TO 'enfermeiros_user'@'localhost';

CREATE USER 'administradores_user'@'localhost' IDENTIFIED BY 'administrador123';
GRANT ALL PRIVILEGES ON banco_dados_hospitalar.* TO 'administradores_user'@'localhost';

CREATE USER 'recepcionistas_user'@'localhost' IDENTIFIED BY 'recepcionista123';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.pacientes TO 'recepcionistas_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.telefones_pacientes TO 'recepcionistas_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.convenios TO 'recepcionistas_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.enderecos TO 'recepcionistas_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.historicos_medicos TO 'recepcionistas_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.pagamentos TO 'recepcionistas_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.consultas TO 'recepcionistas_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.exames_consultas TO 'recepcionistas_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.internacoes TO 'recepcionistas_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.enfermeiros_internacoes TO 'recepcionistas_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.cirurgias TO 'recepcionistas_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON banco_dados_hospitalar.servicos_gerais_quartos TO 'recepcionistas_user'@'localhost';
GRANT SELECT ON banco_dados_hospitalar.exames TO 'recepcionistas_user'@'localhost';
GRANT SELECT ON banco_dados_hospitalar.medicos TO 'recepcionistas_user'@'localhost';
GRANT SELECT ON banco_dados_hospitalar.quartos TO 'recepcionistas_user'@'localhost';
GRANT SELECT ON banco_dados_hospitalar.enfermeiros TO 'recepcionistas_user'@'localhost';
GRANT SELECT ON banco_dados_hospitalar.servicos_gerais TO 'recepcionistas_user'@'localhost';


/**
* Tigger: Soma o valor de todos os exames de uma consulta.
*/
DROP TRIGGER IF EXISTS valor_total_consultas;
DELIMITER //
CREATE TRIGGER valor_total_consultas AFTER UPDATE ON exames
FOR EACH ROW
BEGIN

	IF (SELECT status FROM exames WHERE id = NEW.id) = 'Concluído' THEN

		UPDATE consultas SET valor_total = valor_total + (SELECT valor FROM exames WHERE id = NEW.id) WHERE id = (SELECT consulta_id FROM exames_consultas WHERE exame_id = NEW.id);
        
    END IF;
     
END //
DELIMITER ;


/**
* Tigger: Soma o valor de todos os exames de uma internações.
*/
DROP TRIGGER IF EXISTS valor_total_internacoes;
DELIMITER //
CREATE TRIGGER valor_total_internacoes AFTER UPDATE ON exames
FOR EACH ROW
BEGIN

	IF (SELECT status FROM exames WHERE id = NEW.id) = 'Concluído' THEN

		UPDATE internacoes SET valor_total = valor_total + (SELECT valor FROM exames WHERE id = NEW.id) WHERE id = (SELECT internacoes_id FROM exames_internacoes WHERE exame_id = NEW.id);
        
    END IF;
     
END //
DELIMITER ;


/**
* Tigger: Soma o valor de todas as cirurgias de uma internações.
*/
DROP TRIGGER IF EXISTS valor_total_cirurgias;
DELIMITER //
CREATE TRIGGER valor_total_cirurgias AFTER INSERT ON cirurgias
FOR EACH ROW
BEGIN

	UPDATE internacoes SET valor_total = valor_total + NEW.valor WHERE id = NEW.internacao_id;
     
END //
DELIMITER ;

