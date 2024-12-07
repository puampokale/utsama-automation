# Use the official Java 21 runtime image as the base image
FROM eclipse-temurin:21-jre

# Set the working directory inside the container
#WORKDIR /app

# Copy the JAR file into the container

# Expose port 8080
EXPOSE 8080
ADD target/utsama-devops-integration.jar utsama-devops-integration.jar

# Set the entry point to run the application
ENTRYPOINT ["java", "-jar", "/utsama-devops-integration.jar"]
