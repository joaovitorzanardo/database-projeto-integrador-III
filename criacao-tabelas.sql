CREATE TABLE usuario (
  usuario_id INTEGER PRIMARY KEY,
  primeiro_nome VARCHAR(200) NOT NULL,
  ultimo_nome VARCHAR(200) NOT NULL,
  email VARCHAR(200) UNIQUE NOT NULL,
  senha VARCHAR(60) NOT NULL,
  organizacao VARCHAR(200) NOT NULL,
  tipo_usuario VARCHAR(50) NOT NULL
);

CREATE TABLE equipe (
  equipe_id INTEGER PRIMARY KEY,
  nome VARCHAR(200) NOT NULL,
  descricao VARCHAR(200)
);

CREATE TABLE usuario_equipe (
	usuario_equipe_id INTEGER PRIMARY KEY,
	usuario_id INTEGER NOT NULL,
	equipe_id INTEGER NOT NULL,
	funcao_id INTEGER
);

CREATE TABLE funcao (
	funcao_id INTEGER PRIMARY KEY,
	descricao VARCHAR(200)
);

CREATE TABLE endereco (
  endereco_id INTEGER PRIMARY KEY,
  uf VARCHAR(2) NOT NULL,
  cidade VARCHAR(200) NOT NULL,
  cep VARCHAR(8) NOT NULL,
  rua VARCHAR(200) NOT NULL,
  bairro VARCHAR(200) NOT NULL,
  numero INTEGER NOT NULL,
  referencia VARCHAR(200)
);

CREATE TABLE cliente (
  cliente_id INTEGER PRIMARY KEY,
  primeiro_nome VARCHAR(200) NOT NULL,
  ultimo_nome VARCHAR(200) NOT NULL,
  cpf VARCHAR(11) UNIQUE NOT NULL,
  celular VARCHAR(11) UNIQUE NOT NULL,
  endereco_id INTEGER NOT NULL
);

CREATE TABLE pertence (
  pertence_id INTEGER PRIMARY KEY,
  nome VARCHAR(200) NOT NULL,
  cliente_id INTEGER NOT NULL,
  tipo_pertence_id INTEGER
);

CREATE TABLE tipo_pertence (
  tipo_pertence_id INTEGER PRIMARY KEY,
  descricao VARCHAR(200) NOT NULL
);

CREATE TABLE atividade (
  atividade_id INTEGER PRIMARY KEY,
  cliente_id INTEGER NOT NULL,
  prazo DATE,
  usuario_id INTEGER,
  status_atividade_id INTEGER NOT NULL,
  valor_total DECIMAL(8, 2)
);

CREATE TABLE status_atividade (
  status_atividade_id INTEGER PRIMARY KEY,
  descricao VARCHAR(200) NOT NULL
);

CREATE TABLE tipo_atividade (
  tipo_atividade_id INTEGER PRIMARY KEY,
  descricao VARCHAR(200) NOT NULL
);

CREATE TABLE pertence_atividade (
  pertence_atividade_id INTEGER PRIMARY KEY,
  atividade_id INTEGER NOT NULL,
  pertence_id INTEGER NOT NULL,
  tipo_atividade_id INTEGER,
  descricao TEXT,
  status_atividade_id INTEGER NOT NULL,
  valor DECIMAL(8, 2)
);

ALTER TABLE usuario_equipe ADD FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id);
ALTER TABLE usuario_equipe ADD FOREIGN KEY (equipe_id) REFERENCES equipe(equipe_id);
ALTER TABLE usuario_equipe ADD FOREIGN KEY (funcao_id) REFERENCES funcao(funcao_id);

ALTER TABLE cliente ADD FOREIGN KEY (endereco_id) REFERENCES endereco (endereco_id);

ALTER TABLE pertence ADD FOREIGN KEY (cliente_id) REFERENCES cliente (cliente_id);
ALTER TABLE pertence ADD FOREIGN KEY (tipo_pertence_id) REFERENCES tipo_pertence (tipo_pertence_id);

ALTER TABLE atividade ADD FOREIGN KEY (cliente_id) REFERENCES cliente (cliente_id);
ALTER TABLE atividade ADD FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id);
ALTER TABLE atividade ADD FOREIGN KEY (status_atividade_id) REFERENCES status_atividade (status_atividade_id);

ALTER TABLE pertence_atividade ADD FOREIGN KEY (atividade_id) REFERENCES atividade(atividade_id);
ALTER TABLE pertence_atividade ADD FOREIGN KEY (pertence_id) REFERENCES pertence(pertence_id);
ALTER TABLE pertence_atividade ADD FOREIGN KEY (tipo_atividade_id) REFERENCES tipo_atividade(tipo_atividade_id);
ALTER TABLE status_atividade ADD FOREIGN KEY (status_atividade_id) REFERENCES status_atividade(status_atividade_id);

CREATE SEQUENCE usuario_sequence INCREMENT 1;
CREATE SEQUENCE endereco_sequence INCREMENT 1;
CREATE SEQUENCE equipe_sequence INCREMENT 1;
CREATE SEQUENCE cliente_sequence INCREMENT 1;
CREATE SEQUENCE pertence_sequence INCREMENT 1;
CREATE SEQUENCE tipo_pertence_sequence INCREMENT 1;
CREATE SEQUENCE atividade_sequence INCREMENT 1;
CREATE SEQUENCE status_atividade_sequence INCREMENT 1;
CREATE SEQUENCE tipo_atividade_sequence INCREMENT 1;
CREATE SEQUENCE pertence_atividade_sequence INCREMENT 1;
CREATE SEQUENCE usuario_equipe_sequence INCREMENT 1;
CREATE SEQUENCE funcao_sequence INCREMENT 1;