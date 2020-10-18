| <img src="logo/logo_pug.png" width="130px" height="180px"> | <h1> PONTIFICIA UNIVERSIDAD JAVERIANA </h1> |
| :--: |  :--: |

## TALLE PICA(Proyecto de Implementacion Centrado en la Arquitectura)

### EQUIPO 5 
El equipo 5 está conformado por:
  - *Jhon Edward Celemin Florez*
  - *Eduardo José Franco Rivera*
  - *Wilman Alberto Ortiz Navarro*
  - *Brian Camilo Suarez Botia*  

### TABLA DE CONTENIDO
---
    1. [Web Service American Airline](#WEB-SERVICE)
    2. [Descripcion](#DESC)
    3. [Configuracion](#CONFIG)
    4. [Reques/Response](#RQ-RS)
        4.1. [Operacion GetFlights](#GETFLIHTS)
        4.2. [Operacion GetAllFlights](#GETALLFLIHTS)
    5. [Codigos/Mensajes](#CODES-MSGS)

### 1. Web Service American Airlines <a name="WEB-SERVICE"></a>

### 2. Descripcion <a name="DESC"></a>
El presente servicio tiene por objetivo consultar los vuelos disponibles entre distintas ciudades de Colombia

### 3. Configuracion <a name="CONFIG"></a>
A continuacion se ilustran los pasos necesarios para poner en funcionamiento el servicio de consulta de vuelos de american airline

#### Descargar los fuentes del servicio

 - Clonar el repositorio
    > git clone git@gitlab.com:wortiz1027/aa-services.git

  - moverse a la raiz del repositorio  
    > cd aa-services

#### Crear la red [backend] en docker

> docker network create --driver bridge backend

#### Ejecucion de los contenedores

> docker-compose up -d

#### Docker Tips

Si deseamos ver el log de un contenedor en tiempo real ejecutamos la sigueinte instruccion:

> docker logs -f --tail 10 <container_name>

### Url

A continuacion se ilustra la url para cargar el wsdl del servicio:

> http://localhost:7070/bookings/ws/booking.wsdl

### 4. Request/Response <a name="RQ-RS"></a>

#### 4.1. Operacion GetFlights <a name="GETFLIHTS"></a>
Esta operacion permite consultar vuelos disponibles para una ciudad origen y sus sillas disponibles

##### 4.1.1. Request

```xml
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:flig="http://us.aa.com/flights">
       <soapenv:Header/>
       <soapenv:Body>
          <flig:GetFlightsRequest>
             <flig:city>Santa Marta</flig:city>
          </flig:GetFlightsRequest>
       </soapenv:Body>
    </soapenv:Envelope>
```
##### 4.1.2. Response Exitoso
```xml
    <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
       <SOAP-ENV:Header/>
       <SOAP-ENV:Body>
          <ns2:GetFlightsResponse xmlns:ns2="http://us.aa.com/flights">
             <ns2:header>
                <ns2:code>000</ns2:code>
                <ns2:description>Success!</ns2:description>
             </ns2:header>
             <ns2:information>
                <ns2:flight>
                   <ns2:number>M1225</ns2:number>
                   <ns2:source>Santa Marta</ns2:source>
                   <ns2:destination>Pereira</ns2:destination>
                   <ns2:date>2020-10-05 02:56:45</ns2:date>
                   <ns2:seats>
                      <ns2:seat>
                         <ns2:number>20C</ns2:number>
                         <ns2:available>S</ns2:available>
                      </ns2:seat>
                      <ns2:seat>
                         <ns2:number>05D</ns2:number>
                         <ns2:available>S</ns2:available>
                      </ns2:seat>
                      <ns2:seat>
                         <ns2:number>12F</ns2:number>
                         <ns2:available>S</ns2:available>
                      </ns2:seat>
                      <ns2:seat>
                         <ns2:number>01A</ns2:number>
                         <ns2:available>S</ns2:available>
                      </ns2:seat>
                   </ns2:seats>
                </ns2:flight>
             </ns2:information>
          </ns2:GetFlightsResponse>
       </SOAP-ENV:Body>
    </SOAP-ENV:Envelope>
```

##### 4.1.3. Response Errado

```xml
    <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
       <SOAP-ENV:Header/>
       <SOAP-ENV:Body>
          <ns2:GetFlightsResponse xmlns:ns2="http://us.aa.com/flights">
             <ns2:header>
                <ns2:code>103</ns2:code>
                <ns2:description>Error! no information available for city: Santa Marta1</ns2:description>
             </ns2:header>
          </ns2:GetFlightsResponse>
       </SOAP-ENV:Body>
    </SOAP-ENV:Envelope>
```

```xml
    <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
       <SOAP-ENV:Header/>
       <SOAP-ENV:Body>
          <ns2:GetFlightsResponse xmlns:ns2="http://us.aa.com/flights">
             <ns2:header>
                <ns2:code>101</ns2:code>
                <ns2:description>Error! request parameter is empty or null</ns2:description>
             </ns2:header>
          </ns2:GetFlightsResponse>
       </SOAP-ENV:Body>
    </SOAP-ENV:Envelope>
```

#### 4.2. Operacion GetAllFlights <a name="GETALLFLIHTS"></a>

##### 4.2.1. Request

```xml
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:flig="http://us.aa.com/flights">
       <soapenv:Header/>
       <soapenv:Body>
          <flig:GetAllFlightsRequest>
             <flig:available>S</flig:available>
          </flig:GetAllFlightsRequest>
       </soapenv:Body>
    </soapenv:Envelope>
```

##### 4.2.2 Response Exitoso

```xml
    <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
       <SOAP-ENV:Header/>
       <SOAP-ENV:Body>
          <ns2:GetAllFlightsResponse xmlns:ns2="http://us.aa.com/flights">
             <ns2:header>
                <ns2:code>000</ns2:code>
                <ns2:description>Success!</ns2:description>
             </ns2:header>
             <ns2:information>
                <ns2:flights>
                   <ns2:flight>
                      <ns2:number>C19YC</ns2:number>
                      <ns2:source>Manizales</ns2:source>
                      <ns2:destination>Bogota</ns2:destination>
                      <ns2:date>2020-06-04 20:05:34</ns2:date>
                      <ns2:seats>
                         <ns2:seat>
                            <ns2:number>03B</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>01A</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>20C</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>12F</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                      </ns2:seats>
                   </ns2:flight>
                   <ns2:flight>
                      <ns2:number>XPM5D</ns2:number>
                      <ns2:source>Medellin</ns2:source>
                      <ns2:destination>Cartagena</ns2:destination>
                      <ns2:date>2020-10-13 10:45:28</ns2:date>
                      <ns2:seats>
                         <ns2:seat>
                            <ns2:number>03B</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>01A</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>20C</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>12F</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                      </ns2:seats>
                   </ns2:flight>
                   <ns2:flight>
                      <ns2:number>60BG7</ns2:number>
                      <ns2:source>Pereira</ns2:source>
                      <ns2:destination>Barranquilla</ns2:destination>
                      <ns2:date>2020-04-01 19:15:12</ns2:date>
                      <ns2:seats>
                         <ns2:seat>
                            <ns2:number>03B</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>01A</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>20C</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>12F</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                      </ns2:seats>
                   </ns2:flight>
                   <ns2:flight>
                      <ns2:number>439C9</ns2:number>
                      <ns2:source>Bogota</ns2:source>
                      <ns2:destination>Manizales</ns2:destination>
                      <ns2:date>2020-02-05 02:42:45</ns2:date>
                      <ns2:seats>
                         <ns2:seat>
                            <ns2:number>03B</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>01A</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>20C</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>12F</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                      </ns2:seats>
                   </ns2:flight>
                   <ns2:flight>
                      <ns2:number>M1225</ns2:number>
                      <ns2:source>Santa Marta</ns2:source>
                      <ns2:destination>Pereira</ns2:destination>
                      <ns2:date>2020-10-05 02:56:45</ns2:date>
                      <ns2:seats>
                         <ns2:seat>
                            <ns2:number>03B</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>01A</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>20C</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>12F</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                      </ns2:seats>
                   </ns2:flight>
                   <ns2:flight>
                      <ns2:number>KVION</ns2:number>
                      <ns2:source>Bucaramanga</ns2:source>
                      <ns2:destination>Armenia</ns2:destination>
                      <ns2:date>2020-01-08 02:58:54</ns2:date>
                      <ns2:seats>
                         <ns2:seat>
                            <ns2:number>03B</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>01A</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>20C</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>12F</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                      </ns2:seats>
                   </ns2:flight>
                   <ns2:flight>
                      <ns2:number>H0TZS</ns2:number>
                      <ns2:source>Armenia</ns2:source>
                      <ns2:destination>Barranquilla</ns2:destination>
                      <ns2:date>2020-11-27 11:06:22</ns2:date>
                      <ns2:seats>
                         <ns2:seat>
                            <ns2:number>03B</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>01A</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>20C</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>12F</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                      </ns2:seats>
                   </ns2:flight>
                   <ns2:flight>
                      <ns2:number>XYST9</ns2:number>
                      <ns2:source>Cali</ns2:source>
                      <ns2:destination>Barranquilla</ns2:destination>
                      <ns2:date>2020-08-16 21:39:07</ns2:date>
                      <ns2:seats>
                         <ns2:seat>
                            <ns2:number>03B</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>01A</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>20C</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>12F</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                      </ns2:seats>
                   </ns2:flight>
                   <ns2:flight>
                      <ns2:number>W56WS</ns2:number>
                      <ns2:source>Barranquilla</ns2:source>
                      <ns2:destination>Bogota</ns2:destination>
                      <ns2:date>2020-10-12 03:59:14</ns2:date>
                      <ns2:seats>
                         <ns2:seat>
                            <ns2:number>03B</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>01A</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>20C</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>12F</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                      </ns2:seats>
                   </ns2:flight>
                   <ns2:flight>
                      <ns2:number>E2R1X</ns2:number>
                      <ns2:source>Cartagena</ns2:source>
                      <ns2:destination>Manizales</ns2:destination>
                      <ns2:date>2020-09-28 05:47:10</ns2:date>
                      <ns2:seats>
                         <ns2:seat>
                            <ns2:number>03B</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>01A</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>20C</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                         <ns2:seat>
                            <ns2:number>12F</ns2:number>
                            <ns2:available>S</ns2:available>
                         </ns2:seat>
                      </ns2:seats>
                   </ns2:flight>
                </ns2:flights>
             </ns2:information>
          </ns2:GetAllFlightsResponse>
       </SOAP-ENV:Body>
    </SOAP-ENV:Envelope>
```

##### 4.2.3. Response Errado

```xml
    <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
       <SOAP-ENV:Header/>
       <SOAP-ENV:Body>
          <ns2:GetAllFlightsResponse xmlns:ns2="http://us.aa.com/flights">
             <ns2:header>
                <ns2:code>103</ns2:code>
                <ns2:description>Error! no information available seats: x</ns2:description>
             </ns2:header>
          </ns2:GetAllFlightsResponse>
       </SOAP-ENV:Body>
    </SOAP-ENV:Envelope>
```

```xml
    <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
       <SOAP-ENV:Header/>
       <SOAP-ENV:Body>
          <ns2:GetAllFlightsResponse xmlns:ns2="http://us.aa.com/flights">
             <ns2:header>
                <ns2:code>101</ns2:code>
                <ns2:description>Error! request parameter is empty or null</ns2:description>
             </ns2:header>
          </ns2:GetAllFlightsResponse>
       </SOAP-ENV:Body>
    </SOAP-ENV:Envelope>
```

### 5. Codigos/Mensajes <a name="CODES-MSGS"></a>

| Codigo | Mensaje |
| :--: | :--: |
| 000 | Success |
| 101 | Error! request parameter is empty or null |
| 102 | Error perform flights query |
| 103 | Error! no information available seats: {seat} |
| 103 | Error! no information available for city: {city} |