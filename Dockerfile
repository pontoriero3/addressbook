# syntax=docker/dockerfile:1

FROM eclipse-temurin:17-jdk-jammy

FROM bitnami/tomcat
COPY addressbook.war /opt/bitnami/tomcat/webapps

RUN ./mvnw dependency:resolve

COPY src ./src

CMD ["./mvnw", "spring-boot:run"]
