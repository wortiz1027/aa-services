-- Base de datos que permite gestionar booking de American AirLine
DROP SCHEMA IF EXISTS bookingdb ;

-- Creando la base de datos para booking
CREATE DATABASE IF NOT EXISTS bookingdb;
USE bookingdb;

-- Creando tablas
/*CREATE TABLE IF NOT EXISTS Clientes (
    id        VARCHAR(100) NOT NULL,
    nombre    VARCHAR(50)  NOT NULL,
    apellidos VARCHAR(50)  NOT NULL,
    mail      VARCHAR(50)  NOT NULL
)ENGINE = InnoDB;*/

CREATE TABLE IF NOT EXISTS Vuelos (
    id        VARCHAR(100) NOT NULL,
    numero    VARCHAR(50)  NOT NULL,
    origen    VARCHAR(100)  NOT NULL,
    destino   VARCHAR(200)  NOT NULL,
    fecha     DATETIME
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Sillas (
    id        VARCHAR(100) NOT NULL,
    numero    VARCHAR(10)  NOT NULL
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Reservas (
    id         VARCHAR(100) NOT NULL,
    numero     VARCHAR(50)  NOT NULL,
    id_vuelo   VARCHAR(100) NOT NULL,
    id_silla   VARCHAR(100) NOT NULL
)ENGINE = InnoDB;

-- Creando llaves primarias
-- ALTER TABLE Clientes ADD CONSTRAINT PRIMARY KEY pk-clientes (id);
ALTER TABLE Vuelos   ADD CONSTRAINT PRIMARY KEY pk-vuelos (id);
ALTER TABLE Sillas   ADD CONSTRAINT PRIMARY KEY pk-sillas (id);
ALTER TABLE Reservas ADD CONSTRAINT PRIMARY KEY pk-sillas (id, id_vuelo, id_silla);

-- Creando llaves secundarias
ALTER TABLE Reservas ADD FOREIGN KEY (id_vuelo) REFERENCES Vuelos(id);
ALTER TABLE Reservas ADD FOREIGN KEY (id_silla) REFERENCES Sillas(id);