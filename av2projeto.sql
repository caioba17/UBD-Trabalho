CREATE TABLE Cliente (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    cpf VARCHAR2(15) UNIQUE NOT NULL,
    contato VARCHAR2(16),
    cep VARCHAR2(13),
    bairro VARCHAR2(50),
    cidade VARCHAR2(50),
    estado VARCHAR2(2),
    logradouro VARCHAR2(100),
    numero VARCHAR2(12),
    complemento VARCHAR2(50),
    ativo CHAR(1) DEFAULT 'S' CHECK (ativo IN ('S', 'N'))
);

CREATE TABLE Animal (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    cliente_id NUMBER NOT NULL,
    nome VARCHAR2(50) NOT NULL,
    raca VARCHAR2(50),
    cor VARCHAR2(30),
    idade NUMBER,
    especie VARCHAR2(50),
    problemas_saude VARCHAR2(100),
    nascimento DATE,
    foto VARCHAR(100)
);

ALTER TABLE Animal
ADD CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES Cliente(id);

CREATE TABLE Agenda (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    cliente_id NUMBER NOT NULL,
    animal_id NUMBER NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    descricao VARCHAR2(100) NOT NULL,
    valor NUMBER(10, 2) NOT NULL,
    retirar VARCHAR2(30) NOT NULL,
    perfume VARCHAR2(50),
    contato VARCHAR2(30),
    sexo VARCHAR2(10),

ALTER TABLE AGENDA
ADD CONSTRAINT fk_cliente_id_agenda FOREIGN KEY (cliente_id) REFERENCES Cliente(id);
    servico VARCHAR2(50)
);

ALTER TABLE AGENDA
ADD CONSTRAINT fk_animal_id_agenda FOREIGN KEY (animal_id) REFERENCES Animal(id);

CREATE TABLE Consulta (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    cliente_id NUMBER NOT NULL,
    animal_id NUMBER NOT NULL,
    contato VARCHAR2(15) NOT NULL,
    horarioData DATE NOT NULL,
    servico VARCHAR2(50),
    observacoes VARCHAR2(100),
    tipoAtendimento VARCHAR2(50),
    exames VARCHAR2(100),
    valorConsulta NUMBER(10, 2),
    valorVacina NUMBER(10, 2),
    vermifugo VARCHAR2(50),
    dataVacina DATE,
    dataRetorno DATE
);

ALTER TABLE Consulta
ADD CONSTRAINT fk_cliente_id_consulta FOREIGN KEY (cliente_id) REFERENCES Cliente(id);

ALTER TABLE Consulta
ADD CONSTRAINT fk_animal_id_consulta FOREIGN KEY (animal_id) REFERENCES Animal(id);

CREATE TABLE Rastreio (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    cliente_id NUMBER NOT NULL,
    animal_id NUMBER NOT NULL,
    etapa VARCHAR2(100)
);

ALTER TABLE Rastreio
ADD CONSTRAINT fk_animal_id_rastreio FOREIGN KEY (animal_id) REFERENCES Animal(id);

ALTER TABLE Rastreio
ADD CONSTRAINT fk_cliente_id_rastreio FOREIGN KEY (cliente_id) REFERENCES Cliente(id);

CREATE TABLE Login (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    usuario VARCHAR2(50) UNIQUE NOT NULL,
    senha VARCHAR2(100) NOT NULL
);

CREATE TABLE Administrador (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    login_id NUMBER UNIQUE REFERENCES Login(id) ON DELETE CASCADE
);

CREATE TABLE Veterinaria (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    login_id NUMBER UNIQUE REFERENCES Login(id) ON DELETE CASCADE
);