FROM maven as build

COPY . /app
WORKDIR /app
RUN mvn clean install spring-boot:repackage


FROM openjdk:21-jdk-slim as deploy

COPY --from=build /app/target/docker-compose-example-0.0.1-SNAPSHOT.jar /app/app.jar
WORKDIR /app
COPY ./entrypoint.sh /app/entrypoint.sh
COPY --from=build /app/src/main/resources/application.yml /app/application.yml
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]