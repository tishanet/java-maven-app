FROM openjdk:17-slim

WORKDIR /app

RUN apt-get update && apt-get install -y maven && apt-get clean

COPY ./target/java-maven-app-1.1.0-SNAPSHOT.jar /app/

EXPOSE 8080:8080

CMD ["jar", "-jar", "java-maven-app-1.1.0-SNAPSHOT.jar"]