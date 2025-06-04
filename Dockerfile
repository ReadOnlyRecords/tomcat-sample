FROM maven:3.9-eclipse-temurin-24 AS maven
LABEL COMPANY="minimus"
LABEL MAINTAINER="neil@minimus.io"
LABEL APPLICATION="Sample Application"

WORKDIR /usr/src/app
COPY . /usr/src/app
RUN mvn package

FROM tomcat
COPY --from=maven /usr/src/app/target/java-tomcat-maven-example.war /usr/local/tomcat/webapps/root.war

