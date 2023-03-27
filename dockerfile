FROM maven:3.8.4-openjdk-11-slim AS build
WORKDIR /
COPY src src
COPY pom.xml pom.xml
RUN mvn clean install -Dmaven.test.skip=true

FROM openjdk:11.0

COPY --from=build target/customerapi-0.0.1-SNAPSHOT.jar customerapi-0.0.1-SNAPSHOT.jar
EXPOSE 6062
ENTRYPOINT ["java","-jar","customerapi-0.0.1-SNAPSHOT.jar"]