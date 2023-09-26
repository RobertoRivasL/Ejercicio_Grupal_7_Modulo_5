create
database prev_riesgo;
use
prev_riesgo;

CREATE TABLE users
(
    id              INT PRIMARY KEY AUTO_INCREMENT,
    username        VARCHAR(50) NOT NULL,
    password        varchar(50) NOT NULL,
    nombre          VARCHAR(50) NOT NULL,
    fechaNacimiento VARCHAR(50) NOT NULL,
    tipo            VARCHAR(50) NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO users (username, password, nombre, fechaNacimiento, tipo)
VALUES ('admin', '1234', 'Ganon', '18/11/1994', 'Administrativo');


CREATE TABLE capacitacion
(
    id                 INT PRIMARY KEY AUTO_INCREMENT,
    rutCliente         VARCHAR(50) NOT NULL,
    dia                VARCHAR(50) NOT NULL,
    hora               VARCHAR(50) NOT NULL,
    lugar              VARCHAR(50) NOT NULL,
    duracion           VARCHAR(50) NOT NULL,
    cantidadAsistentes varchar(50) NOT NULL,
    created_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


