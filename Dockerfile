# Étape 1 : image de compilation
FROM openjdk:21 as build
WORKDIR /app
COPY src ./src
RUN javac src/Main.java -d .

# Étape 2 : image d'exécution
FROM openjdk:21
WORKDIR /app
COPY --from=build /app/Main.class .
CMD ["java", "Main"]
