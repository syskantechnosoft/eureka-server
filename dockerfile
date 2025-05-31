## Use a base image with Java 21
#FROM openjdk:21-jdk-slim
#
## Set the working directory inside the container
#WORKDIR /app
#
## Copy the JAR file into the container
#COPY target/*.jar app.jar
#
## Expose the port that the Spring Boot application listens on
#EXPOSE 8761
#
## Command to run the application
#ENTRYPOINT ["java", "-jar", "app.jar"]


# Use a base image with Java (adjust version as needed)
FROM openjdk:21-jdk-slim

# Set the working directory within the container
WORKDIR /app

# Copy the project's pom.xml and source code
COPY pom.xml .
COPY src ./src

# Install Maven (if not pre-installed in the base image)
# This example assumes Maven needs to be installed
RUN apt-get update && apt-get install -y maven

# Run the Maven install command
RUN mvn install

# Copy the resulting JAR file (adjust the path accordingly)
COPY target/*.jar ./app/app.jar

#Expose the port that the Spring Boot application listens on
EXPOSE 8761

# Set the entrypoint (command to run when the container starts)
CMD ["java", "-jar", "/app/app.jar"]
