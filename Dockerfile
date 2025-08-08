FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY build/libs/*.jar app.jar
ENV JAVA_TOOL_OPTIONS=-Xmx512m
ENTRYPOINT ["java", "-jar", "/app/app.jar"]