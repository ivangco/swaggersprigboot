# Usa una imagen base de Java
FROM openjdk:11.0.14.1

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos necesarios al directorio de trabajo
COPY . .

RUN chmod 777 gradlew

# Ejecuta Gradle para construir el proyecto
RUN ./gradlew build -x test

# Expone el puerto en el que se ejecuta la aplicación Spring Boot
EXPOSE 8080

# Comando para ejecutar la aplicación Spring Boot al iniciar el contenedor
CMD ["java", "-jar", "build/libs/platzi-market-0.0.1-SNAPSHOT.jar"]