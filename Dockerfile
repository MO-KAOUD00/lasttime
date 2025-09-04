FROM openjdk:21-jdk-slim
RUN apt-get update && apt-get install -y maven
COPY src /app/src
COPY pom.xml /app
RUN mvn -f /app/pom.xml clean package

RUN mv /app/target/*.jar app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
