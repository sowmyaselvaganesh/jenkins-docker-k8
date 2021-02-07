FROM openjdk:8-jdk-alpine

# Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/gs-spring-boot-docker-0.1.0.jar $PROJECT_HOME/gs-spring-boot-docker.jar

WORKDIR $PROJECT_HOME
CMD ["java" ,"-jar","./gs-spring-boot-docker.jar"]
