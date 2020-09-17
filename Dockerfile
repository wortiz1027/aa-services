# -------------------------------------------------------------
# - DOCKERFILE
# - AUTOR: Brian Suarez | Eduardo Franco | Jhon Celemin | Wilman Ortiz
# - FECHA: 14-Septiembre-2020
# - DESCRIPCION: Dockerfile que permite la creacion del
# -              contenedor con el servicio de booking AA
# -------------------------------------------------------------

# escape=\ (backslash)
# Imagen base del Docker Registry para compilar nuestra servicio de booking AA
# Build Stage
FROM maven:3.6.3-jdk-11-slim AS BUILDER
WORKDIR /build/
COPY pom.xml .
COPY /src ./src
RUN mvn clean package -Dmaven.test.skip=true

# Run Stage
FROM payara/server-full
ENV APP_HOME="/app"

ENV HTTP_PORT 8090
ENV MYSQL_HOST db_bookings
ENV MYSQL_PORT 33060
ENV LIBS /opt/payara/appserver/glassfish/domains/domain1/lib
ENV MYSQL_DRIVER_VERSION 5.1.49
ENV MYSQL_DRIVER mysql-connector-java-5.1.49.jar
ENV JDBC_CONNECTION_POOL_CMD "create-jdbc-connection-pool --datasourceclassname com.mysql.jdbc.jdbc2.optional.MysqlDataSource --restype javax.sql.ConnectionPoolDataSource --property user=booking:password=booking2020++:DatabaseName=bookingdb:ServerName=${MYSQL_HOST}:port=${MYSQL_PORT} mysql-pool"
ENV JDBC_RESOURCE_CMD "create-jdbc-resource --connectionpoolid mysql-pool jdbc/mysql-pool"

USER root

RUN apt-get update -y && apt-get install -y wget

USER payara

# Informacion de la persona que mantiene la imagen
LABEL org.opencontainers.image.created=$BUILD_DATE \
	  org.opencontainers.image.authors="Brian Suarez | Eduardo Franco | Jhon Celemin | Wilman Ortiz Navarro " \
	  org.opencontainers.image.url="https://gitlab.com/bcamilo/aa-service/-/blob/master/master/Dockerfile" \
	  org.opencontainers.image.documentation="" \
	  org.opencontainers.image.source="https://gitlab.com/bcamilo/aa-service/-/blob/master/master/Dockerfile" \
	  org.opencontainers.image.version=$BUILD_VERSION \
	  org.opencontainers.image.revision=$BUILD_REVISION \
	  org.opencontainers.image.vendor="Pontificia Universidad Javeriana | https://www.javeriana.edu.co/" \
	  org.opencontainers.image.licenses="" \
	  org.opencontainers.image.title="Reservas American Airline" \
	  org.opencontainers.image.description="El siguiente servicio tiene como finalidad gestionar el proceso de reserva de vuelos para toures balon"

RUN wget --quiet https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.49/mysql-connector-java-5.1.49.jar -O mysql-connector-java-5.1.49.jar
USER root
RUN chown payara mysql-connector-java-5.1.49.jar
USER payara

RUN mkdir -p ${LIBS}
RUN mv mysql-connector-java-5.1.49.jar ${LIBS}
RUN echo ${JDBC_CONNECTION_POOL_CMD} > ${POSTBOOT_COMMANDS} && \
    echo ${JDBC_RESOURCE_CMD} >> ${POSTBOOT_COMMANDS}

COPY --from=BUILDER /build/target/bookings-service.war ${DEPLOY_DIR}

ENTRYPOINT  ${PAYARA_PATH}/generate_deploy_commands.sh && \
            ${PAYARA_PATH}/bin/startInForeground.sh \
            --passwordfile=/opt/pwdfile \
            --postbootcommandfile ${POSTBOOT_COMMANDS} ${PAYARA_DOMAIN}