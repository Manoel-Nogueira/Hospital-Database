CREATE DATABASE banco_dados_hospitalar;

USE	banco_dados_hospitalar;

CREATE TABLE administradores (

  funcionarios_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (funcionarios_id),
  FOREIGN KEY (funcionarios_id) REFERENCES funcionarios (id)

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
-- Table cirurgias
-- -----------------------------------------------------
CREATE TABLE cirurgias (

  id INT UNSIGNED NULL AUTO_INCREMENT,
  internacao_id INT UNSIGNED NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  data_ini DATETIME NOT NULL,
  data_fim DATETIME NULL,
  status VARCHAR(20) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (internacao_id) REFERENCES internacoes (id)
    
);

-- -----------------------------------------------------
-- Table consultas
-- -----------------------------------------------------
CREATE TABLE consultas (

  id INT UNSIGNED NULL,
  paciente_id INT UNSIGNED NOT NULL,
  medico_id INT UNSIGNED NOT NULL,
  motivo VARCHAR(45) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  data_hora DATETIME NOT NULL,
  status VARCHAR(20) NOT NULL,
  diagnostico VARCHAR(45) NULL,
  valor_total DECIMAL(0,2) NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (paciente_id) REFERENCES pacientes (id),
  FOREIGN KEY (medico_id) REFERENCES medicos (funcionario_id)

);

-- -----------------------------------------------------
-- Table convenios
-- -----------------------------------------------------
CREATE TABLE convenios (

  id INT UNSIGNED NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  cnpj VARCHAR(18) NOT NULL,
  cobertura VARCHAR(45) NOT NULL,
  valor DECIMAL(0,2) NOT NULL,
  PRIMARY KEY (id)
  
);

-- -----------------------------------------------------
-- Table departamentos
-- -----------------------------------------------------
CREATE TABLE departamentos (

  id INT UNSIGNED NULL,
  nome VARCHAR(45) NOT NULL,
  numero INT(8) NOT NULL,
  localizacao VARCHAR(45) NOT NULL,
  descricao VARCHAR(100) NOT NULL,
  gerente INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (gerente) REFERENCES funcionarios (id)

);

-- -----------------------------------------------------
-- Table dosagem
-- -----------------------------------------------------
CREATE TABLE dosagem (

  id INT UNSIGNED NULL AUTO_INCREMENT,
  tipo VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)

);

-- -----------------------------------------------------
-- Table enderecos
-- -----------------------------------------------------
CREATE TABLE enderecos (

  id INT UNSIGNED NULL AUTO_INCREMENT,
  cep VARCHAR(9) NOT NULL,
  uf VARCHAR(2) NOT NULL,
  cidade VARCHAR(50) NOT NULL,
  bairro VARCHAR(50) NOT NULL,
  logradouro VARCHAR(50) NOT NULL,
  numero VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)

);

-- -----------------------------------------------------
-- Table enfermeiros
-- -----------------------------------------------------
CREATE TABLE enfermeiros (

  funcionarios_id INT UNSIGNED NOT NULL,
  coren VARCHAR(13) NOT NULL,
  formaçao VARCHAR(45) NOT NULL,
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
-- Table especializacoes
-- -----------------------------------------------------
CREATE TABLE especializacoes (

  id INT UNSIGNED NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)

);

-- -----------------------------------------------------
-- Table estoque_itens
-- -----------------------------------------------------
CREATE TABLE estoque_itens (

  id INT UNSIGNED NULL AUTO_INCREMENT,
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

  id INT UNSIGNED NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  quantidade INT NOT NULL,
  localizacao VARCHAR(45) NOT NULL,
  data_validade DATE NOT NULL,
  fornecedor VARCHAR(45) NOT NULL,
  status VARCHAR(45) NOT NULL,
  valor DECIMAL(0,2) NOT NULL,
  PRIMARY KEY (id)
  
);

-- -----------------------------------------------------
-- Table estoque_medicamentos_receitas
-- -----------------------------------------------------
CREATE TABLE estoque_medicamentos_receitas (

  receitas_id INT UNSIGNED NOT NULL,
  medicamentos_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (receitas_id, medicamentos_id),
  FOREIGN KEY (receitas_id) REFERENCES prescricoes (id),
  FOREIGN KEY (medicamentos_id) REFERENCES estoque_medicamentos (id)
  
);

-- -----------------------------------------------------
-- Table exames
-- -----------------------------------------------------
CREATE TABLE exames (

  id INT UNSIGNED NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  data_hora DATETIME NOT NULL,
  status VARCHAR(20) NOT NULL,
  resultado VARCHAR(255) NOT NULL,
  valor DECIMAL(0,2) NOT NULL,
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
-- Table exames_has_estoque_itens
-- -----------------------------------------------------
CREATE TABLE exames_has_estoque_itens (

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
-- Table funcionarios
-- -----------------------------------------------------
CREATE TABLE funcionarios (

  id INT UNSIGNED NULL,
  nome VARCHAR(50) NOT NULL,
  rg VARCHAR(12) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  sexo VARCHAR(45) NOT NULL,
  dt_nascimento DATE NOT NULL,
  salario DECIMAL(0,2) NOT NULL,
  dt_admissao DATETIME NOT NULL,
  departamento_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (departamento_id) REFERENCES departamentos (id)

);

-- -----------------------------------------------------
-- Table funcionarios_funcoes
-- -----------------------------------------------------
CREATE TABLE funcionarios_funcoes (

  funcionario_id INT UNSIGNED NOT NULL,
  funcao_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (funcao_id, funcionario_id),
  FOREIGN KEY (funcionario_id) REFERENCES funcionarios (id),
  FOREIGN KEY (funcao_id) REFERENCES funcoes (id)

);

-- -----------------------------------------------------
-- Table funcoes
-- -----------------------------------------------------
CREATE TABLE funcoes (

  id INT UNSIGNED NULL,
  nome VARCHAR(50) NOT NULL,
  descricao VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
  
);

-- -----------------------------------------------------
-- Table historicos_medicos
-- -----------------------------------------------------
CREATE TABLE historicos_medicos (

  id INT UNSIGNED NULL,
  pacientes_id INT UNSIGNED NOT NULL,
  historico VARCHAR(255) NOT NULL,
  data DATETIME NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (pacientes_id) REFERENCES pacientes (id)

);

-- -----------------------------------------------------
-- Table internacoes
-- -----------------------------------------------------
CREATE TABLE internacoes (

  id INT UNSIGNED NULL AUTO_INCREMENT,
  paciente_id INT UNSIGNED NOT NULL,
  medico_id INT UNSIGNED NOT NULL,
  quarto_id INT UNSIGNED NOT NULL,
  motivo VARCHAR(255) NOT NULL,
  data_ini DATETIME NOT NULL,
  data_fim DATETIME NULL,
  diagnostico VARCHAR(100) NULL,
  valor_total DECIMAL(0,2) NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (paciente_id) REFERENCES pacientes (id),
  FOREIGN KEY (medico_id) REFERENCES medicos (funcionario_id),
  FOREIGN KEY (quarto_id) REFERENCES quartos (id)

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
-- Table pacientes
-- -----------------------------------------------------
CREATE TABLE pacientes (

  id INT UNSIGNED NULL,
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
-- Table pagamentos
-- -----------------------------------------------------
CREATE TABLE pagamentos (

  id INT UNSIGNED NULL AUTO_INCREMENT,
  valor_total DECIMAL(0,2) NOT NULL,
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
-- Table prescricoes
-- -----------------------------------------------------
CREATE TABLE prescricoes (

  id INT UNSIGNED NULL AUTO_INCREMENT,
  qtd_medicamento INT NOT NULL,
  uso VARCHAR(255) NOT NULL,
  dosagem_id INT UNSIGNED NOT NULL,
  vias_administracao_id INT UNSIGNED NOT NULL,
  consultas_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (consultas_id) REFERENCES consultas (id),
  FOREIGN KEY (vias_administracao_id) REFERENCES vias_administracao (id),
  FOREIGN KEY (dosagem_id) REFERENCES dosagem (id)
  
);

-- -----------------------------------------------------
-- Table quartos
-- -----------------------------------------------------
CREATE TABLE quartos (

  id INT UNSIGNED NULL AUTO_INCREMENT,
  numero INT NOT NULL,
  tipo VARCHAR(45) NOT NULL,
  num_leitos INT NOT NULL,
  num_leitos_ocupados INT NOT NULL,
  localizacao VARCHAR(45) NOT NULL,
  status VARCHAR(45) NOT NULL,
  valor DECIMAL(0,2) NOT NULL,
  PRIMARY KEY (id)

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
-- Table telefones_pacientes
-- -----------------------------------------------------
CREATE TABLE telefones_pacientes (

  paciente_id INT UNSIGNED NOT NULL,
  numero VARCHAR(16) NOT NULL,
  PRIMARY KEY (paciente_id, numero),
  FOREIGN KEY (paciente_id) REFERENCES pacientes (id)

);

-- -----------------------------------------------------
-- Table vias_administracao
-- -----------------------------------------------------
CREATE TABLE vias_administracao (

  id INT UNSIGNED NULL AUTO_INCREMENT,
  via VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
  
);