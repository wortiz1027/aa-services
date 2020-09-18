-- Base de datos que permite gestionar booking de American AirLine
DROP SCHEMA IF EXISTS bookingdb ;

-- Creando la base de datos para booking
CREATE DATABASE IF NOT EXISTS bookingdb;
USE bookingdb;

-- Creando tablas
CREATE TABLE IF NOT EXISTS bookingdb.Vuelos (
    id        VARCHAR(100) NOT NULL,
    numero    VARCHAR(50)  NOT NULL,
    origen    VARCHAR(100)  NOT NULL,
    destino   VARCHAR(200)  NOT NULL,
    fecha     VARCHAR(200)  NOT NULL
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS bookingdb.Sillas (
    id         VARCHAR(100) NOT NULL,
    numero     VARCHAR(10)  NOT NULL,
    disponible varchar(1),
    id_vuelo   VARCHAR(100) NOT NULL
)ENGINE = InnoDB;

-- Creando llaves primarias
ALTER TABLE bookingdb.Vuelos   ADD CONSTRAINT PRIMARY KEY pk_vuelos (id);
ALTER TABLE bookingdb.Sillas   ADD CONSTRAINT PRIMARY KEY pk_sillas (id);

-- Creando llaves secundarias
ALTER TABLE bookingdb.Sillas ADD FOREIGN KEY (id_vuelo) REFERENCES Vuelos(id);

-- INSERTS
SET @MIN = '2020-01-01 00:00:00';
SET @MAX = '2020-12-31 23:59:59';

INSERT INTO bookingdb.Vuelos VALUES ('a16b40ad-c7ec-4f2b-8516-cd8a2dc20fb1', '439C9', 'Bogota', 'Manizales', TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @MIN, @MAX)), @MIN));
INSERT INTO bookingdb.Vuelos VALUES ('7402d48f-d4db-4918-85fd-7cb66a59bb3d', 'XPM5D', 'Medellin', 'Cartagena', TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @MIN, @MAX)), @MIN));
INSERT INTO bookingdb.Vuelos VALUES ('d1837739-1bd1-44a2-9040-34cc8809d71a', 'XYST9', 'Cali', 'Barranquilla', TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @MIN, @MAX)), @MIN));
INSERT INTO bookingdb.Vuelos VALUES ('de90a39a-391d-45af-8d60-e39dec1b517b', 'W56WS', 'Barranquilla', 'Bogota', TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @MIN, @MAX)), @MIN));
INSERT INTO bookingdb.Vuelos VALUES ('af45eb43-66c9-439e-90cc-cb3fa9ac9fa5', 'KVION', 'Bucaramanga', 'Armenia', TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @MIN, @MAX)), @MIN));
INSERT INTO bookingdb.Vuelos VALUES ('aec1d9cf-81b2-478f-b803-e0da25102cc4', 'M1225', 'Santa Marta', 'Pereira', TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @MIN, @MAX)), @MIN));
INSERT INTO bookingdb.Vuelos VALUES ('f5ed7730-7e28-4649-a718-2e6ae8cb0242', 'E2R1X', 'Cartagena', 'Manizales', TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @MIN, @MAX)), @MIN));
INSERT INTO bookingdb.Vuelos VALUES ('11132223-0f79-4b75-adfb-2b1c0770f36a', 'C19YC', 'Manizales', 'Bogota', TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @MIN, @MAX)), @MIN));
INSERT INTO bookingdb.Vuelos VALUES ('ce6bfc70-afce-4746-891f-2ddfaf3545f3', 'H0TZS', 'Armenia', 'Barranquilla', TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @MIN, @MAX)), @MIN));
INSERT INTO bookingdb.Vuelos VALUES ('9f55eef4-65a7-47de-8444-0a28d903a262', '60BG7', 'Pereira', 'Barranquilla', TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @MIN, @MAX)), @MIN));

INSERT INTO bookingdb.Sillas VALUES ('6df3cf43-b714-46d5-914e-0ca575b12b99', '01A', 'S', 'a16b40ad-c7ec-4f2b-8516-cd8a2dc20fb1');
INSERT INTO bookingdb.Sillas VALUES ('ec50b62e-d884-4668-898e-03c6d98e66af', '20C', 'S', 'a16b40ad-c7ec-4f2b-8516-cd8a2dc20fb1');
INSERT INTO bookingdb.Sillas VALUES ('35cae427-f2d8-43e8-b262-93e4fe34f265', '05D', 'S', 'a16b40ad-c7ec-4f2b-8516-cd8a2dc20fb1');
INSERT INTO bookingdb.Sillas VALUES ('29e77e1a-0348-4d79-b671-4ef5888a6029', '03B', 'N', 'a16b40ad-c7ec-4f2b-8516-cd8a2dc20fb1');
INSERT INTO bookingdb.Sillas VALUES ('0fe5e284-1072-45d8-87de-611052a3fe0d', '12F', 'S', 'a16b40ad-c7ec-4f2b-8516-cd8a2dc20fb1');

INSERT INTO bookingdb.Sillas VALUES ('243d6c04-08d2-48c4-9d98-8b1c31be74b3', '01A', 'S', '7402d48f-d4db-4918-85fd-7cb66a59bb3d');
INSERT INTO bookingdb.Sillas VALUES ('b65120d7-1260-4852-a1d7-3beec9b136a5', '20C', 'N', '7402d48f-d4db-4918-85fd-7cb66a59bb3d');
INSERT INTO bookingdb.Sillas VALUES ('ac5e313f-902a-45af-94e9-40c1c6ac2e95', '05D', 'S', '7402d48f-d4db-4918-85fd-7cb66a59bb3d');
INSERT INTO bookingdb.Sillas VALUES ('8ec9fa90-b7cc-4176-9f9b-72cbec125f4e', '03B', 'N', '7402d48f-d4db-4918-85fd-7cb66a59bb3d');
INSERT INTO bookingdb.Sillas VALUES ('9fc9331f-d11a-4b18-b6e7-3a1f069a177a', '12F', 'S', '7402d48f-d4db-4918-85fd-7cb66a59bb3d');

INSERT INTO bookingdb.Sillas VALUES ('efade80b-b8fb-428b-bcde-f5aeec45d438', '01A', 'S', 'd1837739-1bd1-44a2-9040-34cc8809d71a');
INSERT INTO bookingdb.Sillas VALUES ('a1832a9c-2f75-4545-974f-dd82cb865903', '20C', 'S', 'd1837739-1bd1-44a2-9040-34cc8809d71a');
INSERT INTO bookingdb.Sillas VALUES ('bcee25cf-1420-4f20-a2e7-423a176a27f1', '05D', 'N', 'd1837739-1bd1-44a2-9040-34cc8809d71a');
INSERT INTO bookingdb.Sillas VALUES ('c42c9016-effb-4091-9a9e-16656a244c2d', '03B', 'S', 'd1837739-1bd1-44a2-9040-34cc8809d71a');
INSERT INTO bookingdb.Sillas VALUES ('eeca920d-4f93-4774-b722-2ede3c7ba7c5', '12F', 'S', 'd1837739-1bd1-44a2-9040-34cc8809d71a');

INSERT INTO bookingdb.Sillas VALUES ('8aaf7e2a-cdfc-42f7-a967-032464782adc', '01A', 'N', 'de90a39a-391d-45af-8d60-e39dec1b517b');
INSERT INTO bookingdb.Sillas VALUES ('91856e4f-b337-4433-b7ad-a94ffce15459', '20C', 'S', 'de90a39a-391d-45af-8d60-e39dec1b517b');
INSERT INTO bookingdb.Sillas VALUES ('c1be8d7e-c253-49cd-a1ab-9eb1e550ceb4', '05D', 'S', 'de90a39a-391d-45af-8d60-e39dec1b517b');
INSERT INTO bookingdb.Sillas VALUES ('13a9b79c-3f08-4706-a28b-84b56bf75d16', '03B', 'S', 'de90a39a-391d-45af-8d60-e39dec1b517b');
INSERT INTO bookingdb.Sillas VALUES ('6108b19d-29d2-4801-8e8b-74175838fcc6', '12F', 'N', 'de90a39a-391d-45af-8d60-e39dec1b517b');

INSERT INTO bookingdb.Sillas VALUES ('61344063-686c-4f09-8428-26d605178976', '01A', 'S', 'af45eb43-66c9-439e-90cc-cb3fa9ac9fa5');
INSERT INTO bookingdb.Sillas VALUES ('105c2850-bfdf-4159-b312-d6c95c56a943', '20C', 'N', 'af45eb43-66c9-439e-90cc-cb3fa9ac9fa5');
INSERT INTO bookingdb.Sillas VALUES ('f033bfbc-5e77-431d-855b-a747d6c403e3', '05D', 'S', 'af45eb43-66c9-439e-90cc-cb3fa9ac9fa5');
INSERT INTO bookingdb.Sillas VALUES ('e81a5831-4284-4e95-94bc-966c0c782c77', '03B', 'S', 'af45eb43-66c9-439e-90cc-cb3fa9ac9fa5');
INSERT INTO bookingdb.Sillas VALUES ('9e46d423-cea5-4f01-9314-6193017d6b35', '12F', 'S', 'af45eb43-66c9-439e-90cc-cb3fa9ac9fa5');

INSERT INTO bookingdb.Sillas VALUES ('ad72a349-5717-4d27-8c96-2b98f0cd0242', '01A', 'S', 'aec1d9cf-81b2-478f-b803-e0da25102cc4');
INSERT INTO bookingdb.Sillas VALUES ('3d6cbefe-3d1f-47b9-9685-e6bf31f0b451', '20C', 'S', 'aec1d9cf-81b2-478f-b803-e0da25102cc4');
INSERT INTO bookingdb.Sillas VALUES ('8184ef51-2d37-49f1-a265-7a03b029eb8e', '05D', 'S', 'aec1d9cf-81b2-478f-b803-e0da25102cc4');
INSERT INTO bookingdb.Sillas VALUES ('e4436f25-9467-4a53-b19f-8892dd9d4793', '03B', 'N', 'aec1d9cf-81b2-478f-b803-e0da25102cc4');
INSERT INTO bookingdb.Sillas VALUES ('8471eeac-0bf3-4015-8d36-00091e0f6fd4', '12F', 'S', 'aec1d9cf-81b2-478f-b803-e0da25102cc4');

INSERT INTO bookingdb.Sillas VALUES ('5950f880-df1d-42d8-83d8-218c29b3e280', '01A', 'S', 'f5ed7730-7e28-4649-a718-2e6ae8cb0242');
INSERT INTO bookingdb.Sillas VALUES ('ae4aa714-f00c-47bb-8674-f060bab7ac73', '20C', 'S', 'f5ed7730-7e28-4649-a718-2e6ae8cb0242');
INSERT INTO bookingdb.Sillas VALUES ('eb6b338e-df34-4393-ad5a-a8e94ba4eaf5', '05D', 'N', 'f5ed7730-7e28-4649-a718-2e6ae8cb0242');
INSERT INTO bookingdb.Sillas VALUES ('251e9a55-8d4c-44f9-a84c-b3c8cd488b49', '03B', 'S', 'f5ed7730-7e28-4649-a718-2e6ae8cb0242');
INSERT INTO bookingdb.Sillas VALUES ('d913973c-f27e-4c20-aff5-6fa27edaded6', '12F', 'S', 'f5ed7730-7e28-4649-a718-2e6ae8cb0242');

INSERT INTO bookingdb.Sillas VALUES ('68707ee7-694c-420b-97bb-7451018dd21a', '01A', 'N', '11132223-0f79-4b75-adfb-2b1c0770f36a');
INSERT INTO bookingdb.Sillas VALUES ('570aedda-de18-41cf-8def-bc405eb4e471', '20C', 'S', '11132223-0f79-4b75-adfb-2b1c0770f36a');
INSERT INTO bookingdb.Sillas VALUES ('5ad348bf-74bc-41b7-bbfb-aed7f72b2a1f', '05D', 'S', '11132223-0f79-4b75-adfb-2b1c0770f36a');
INSERT INTO bookingdb.Sillas VALUES ('947fe4dd-d21c-4430-a224-0a9686bf3e19', '03B', 'S', '11132223-0f79-4b75-adfb-2b1c0770f36a');
INSERT INTO bookingdb.Sillas VALUES ('981e5c8e-af73-464c-bb3c-39044da3bf14', '12F', 'S', '11132223-0f79-4b75-adfb-2b1c0770f36a');

INSERT INTO bookingdb.Sillas VALUES ('06ec9fd4-38e0-4398-b70b-01a71c050bc3', '01A', 'S', 'ce6bfc70-afce-4746-891f-2ddfaf3545f3');
INSERT INTO bookingdb.Sillas VALUES ('3cd09632-b0fe-4860-a66f-c14caf73f629', '20C', 'N', 'ce6bfc70-afce-4746-891f-2ddfaf3545f3');
INSERT INTO bookingdb.Sillas VALUES ('26d0cbc9-b612-4555-9840-98f53b35eeaa', '05D', 'N', 'ce6bfc70-afce-4746-891f-2ddfaf3545f3');
INSERT INTO bookingdb.Sillas VALUES ('4d8c8c64-05cb-482d-8c3b-318551d2c5b5', '03B', 'S', 'ce6bfc70-afce-4746-891f-2ddfaf3545f3');
INSERT INTO bookingdb.Sillas VALUES ('578c614f-0f7c-4a38-afa5-ae2d8a2f1f3a', '12F', 'S', 'ce6bfc70-afce-4746-891f-2ddfaf3545f3');

INSERT INTO bookingdb.Sillas VALUES ('2b7b22c8-b299-428b-a4ae-60d6c9a3579c', '01A', 'N', '9f55eef4-65a7-47de-8444-0a28d903a262');
INSERT INTO bookingdb.Sillas VALUES ('f95d6172-1ce9-4064-9c64-d87356f80d4a', '20C', 'S', '9f55eef4-65a7-47de-8444-0a28d903a262');
INSERT INTO bookingdb.Sillas VALUES ('6391672d-2800-4f6c-b333-d1468d10005b', '05D', 'N', '9f55eef4-65a7-47de-8444-0a28d903a262');
INSERT INTO bookingdb.Sillas VALUES ('ae39152e-cc54-412f-b065-692d48017aeb', '03B', 'N', '9f55eef4-65a7-47de-8444-0a28d903a262');
INSERT INTO bookingdb.Sillas VALUES ('951e128e-0a9a-44e5-8626-86a09fcc6f72', '12F', 'S', '9f55eef4-65a7-47de-8444-0a28d903a262');