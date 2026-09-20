FROM eclipse-temurin:17-jdk

USER root

WORKDIR /app

COPY Hello.java /app/Hello.java

RUN javac /app/Hello.java

RUN useradd -m appuser && \
    chown -R appuser:appuser /app

USER appuser

EXPOSE 8080

VOLUME ["/app/data"]

ENTRYPOINT ["java", "Hello"]
