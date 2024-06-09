# Ich verwende das GradleImage JDK21 zum bauen
FROM gradle:8-jdk21 as build

# Kopiere die Inhalte in dein Container
COPY . /app

# Definiere dein Arbeitsbereich
WORKDIR /app

# Baue deine JAR
RUN gradle build

# Verwenden des offiziellen Alpine Linux als Basisimage - nimmt :latest als Tag
FROM alpine as app

# Ausführen eines Befehls zur Installation von OpenJDK21
RUN apk add --update openjdk21

# Kopieren Dateien in das Image
COPY --from=build /app/build/libs/docker-demo-0.0.1-SNAPSHOT.jar /app/SpringBoot-HelloWorld.jar
COPY ./entrypoint.sh /entrypoint.sh

# Erteile Rechte zum ausführen für die entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose den Port zur Dokumentation
EXPOSE 8080

# Definiere deinen startpunkt
ENTRYPOINT ["/entrypoint.sh"]
