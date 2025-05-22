-- -----------------------------
-- TABLAS INDEPENDIENTES
-- -----------------------------

-- EMPRESA
CREATE TABLE empresa (
    idEmpresa INT PRIMARY KEY
);

-- CLIENTE
CREATE TABLE cliente (
    idContacto INT PRIMARY KEY,
    nombre VARCHAR2(100),
    apellido VARCHAR2(100),
    email VARCHAR2(100),
    mensaje CLOB,
    fechaEnvio DATE
);

-- NOTICIA
CREATE TABLE noticia (
    idNoticia INT PRIMARY KEY,
    titulo VARCHAR2(255),
    autor VARCHAR2(100),
    categoria VARCHAR2(100),
    fechaPubli DATE,
    contenido CLOB
);

-- -----------------------------
-- TABLAS CON CLAVES FORÁNEAS A EMPRESA
-- -----------------------------

-- REPORTERO
CREATE TABLE reportero (
    idMiembro INT PRIMARY KEY,
    DNI VARCHAR2(15),
    nombre VARCHAR2(100),
    apellido VARCHAR2(100),
    telefono VARCHAR2(20),
    idEmpresa INT,
    FOREIGN KEY (idEmpresa) REFERENCES empresa(idEmpresa)
);

-- ESPECIALISTA
CREATE TABLE especialista (
    idEspec INT PRIMARY KEY,
    DNI VARCHAR2(15),
    nombre VARCHAR2(100),
    apellido VARCHAR2(100),
    telefono VARCHAR2(20),
    idEmpresa INT,
    FOREIGN KEY (idEmpresa) REFERENCES empresa(idEmpresa)
);

-- ATENCION_CLIENTE
CREATE TABLE atencion_cliente (
    idRelac INT PRIMARY KEY,
    DNI VARCHAR2(15),
    nombre VARCHAR2(100),
    apellido VARCHAR2(100),
    telefono VARCHAR2(20),
    idEmpresa INT,
    FOREIGN KEY (idEmpresa) REFERENCES empresa(idEmpresa)
);

-- COLABORADOR
CREATE TABLE colaborador (
    idColab INT PRIMARY KEY,
    nomEmpresa VARCHAR2(100),
    direccion VARCHAR2(150),
    sector VARCHAR2(50),
    idEmpresa INT,
    FOREIGN KEY (idEmpresa) REFERENCES empresa(idEmpresa)
);

-- -----------------------------
-- TABLAS INTERMEDIAS N:M
-- -----------------------------

-- CLIENTE - ATENCION_CLIENTE (contacta)
CREATE TABLE cliente_contacta_atencion (
    idContacto INT,
    idRelac INT,
    PRIMARY KEY (idContacto, idRelac),
    FOREIGN KEY (idContacto) REFERENCES cliente(idContacto),
    FOREIGN KEY (idRelac) REFERENCES atencion_cliente(idRelac)
);

-- CLIENTE - ESPECIALISTA (tratado)
CREATE TABLE cliente_tratado_especialista (
    idContacto INT,
    idEspec INT,
    PRIMARY KEY (idContacto, idEspec),
    FOREIGN KEY (idContacto) REFERENCES cliente(idContacto),
    FOREIGN KEY (idEspec) REFERENCES especialista(idEspec)
);

-- REPORTERO - NOTICIA (escribe)
CREATE TABLE reportero_escribe_noticia (
    idMiembro INT,
    idNoticia INT,
    PRIMARY KEY (idMiembro, idNoticia),
    FOREIGN KEY (idMiembro) REFERENCES reportero(idMiembro),
    FOREIGN KEY (idNoticia) REFERENCES noticia(idNoticia)
);


