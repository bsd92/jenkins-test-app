# Étape 1 : build
FROM openjdk:21 AS build
WORKDIR /app
COPY src ./src
RUN javac src/main/java/org/example/Main.java -d .

# Étape 2 : image d'exécution
FROM openjdk:21
WORKDIR /app
COPY --from=build /app/org/example ./org/example
CMD ["java", "org.example.Main"]

