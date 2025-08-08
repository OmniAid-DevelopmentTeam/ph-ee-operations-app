FROM eclipse-temurin:17-jdk as builder
WORKDIR /build
COPY . .
RUN ./gradlew clean build -x test

FROM eclipse-temurin:17-jre as runner
WORKDIR /app

RUN useradd -ms /bin/bash appuser
USER appuser

COPY --from=builder /build/build/libs/*.jar app.jar

ENV JAVA_TOOL_OPTIONS=-Xmx512m
EXPOSE 5000
ENTRYPOINT ["java", "-jar", "/app/app.jar"]