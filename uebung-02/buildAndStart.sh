#!/bin/bash

# Lösche aktuelle files in build
./gradlew clean

# erstelle JAR-File
./gradlew assemble

# Führe JAR-File aus
java -jar ./build/libs/docker-demo-0.0.1-SNAPSHOT.jar