# ---- Build Stage ----
FROM maven:3.9.6-eclipse-temurin-18 AS build
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

# ---- Run Stage ----
FROM eclipse-temurin:18-jre-alpine
WORKDIR /app
COPY --from=build /app/target/users-api-0.0.1-SNAPSHOT.jar app.jar

# Expose the port (matches application.properties)
EXPOSE 8083

# Environment variables (can be overridden at runtime)
ENV JWT_SECRET=myfancysecret
ENV SERVER_PORT=8083

ENTRYPOINT ["java", "-jar", "app.jar"]

