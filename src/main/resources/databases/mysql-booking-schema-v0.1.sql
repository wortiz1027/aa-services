-- Base de datos que permite gestionar booking de American AirLine
DROP SCHEMA IF EXISTS bookingdb ;

-- Creando la base de datos para booking
CREATE DATABASE IF NOT EXISTS bookingdb;
USE bookingdb;

-- Creando tablas
CREATE TABLE IF NOT EXISTS Vuelos (
    id        VARCHAR(100) NOT NULL,
    numero    VARCHAR(50)  NOT NULL,
    origen    VARCHAR(100)  NOT NULL,
    destino   VARCHAR(200)  NOT NULL,
    fecha     DATETIME
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Sillas (
    id         VARCHAR(100) NOT NULL,
    numero     VARCHAR(10)  NOT NULL,
    disponible varchar(1),
    id_vuelo   VARCHAR(100) NOT NULL
)ENGINE = InnoDB;

-- Creando llaves primarias
ALTER TABLE Vuelos   ADD CONSTRAINT PRIMARY KEY pk_vuelos (id);
ALTER TABLE Sillas   ADD CONSTRAINT PRIMARY KEY pk_sillas (id);

-- Creando llaves secundarias
ALTER TABLE Sillas ADD FOREIGN KEY (id_vuelo) REFERENCES Vuelos(id);

-- INSERT INTO Vuelos VALUES ();