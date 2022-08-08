FROM alpine

LABEL org.opencontainers.image.title="Swagger Editor" \
    org.opencontainers.image.description="Swagger Editor Docker extension" \
    org.opencontainers.image.vendor="SmartBear" \
    com.docker.desktop.extension.api.version=">= 0.2.3" \
    com.docker.desktop.extension.icon="swagger.svg" \
    com.docker.extension.screenshots="[{}]" \
    com.docker.extension.detailed-description="Swagger Editor as a docker extension" \
    com.docker.extension.publisher-url="https://swagger.io/" \
    com.docker.extension.additional-urls='[{"title":"Swagger","url":"https://swagger.io/"}]' \
    com.docker.extension.changelog=""

COPY swagger.svg .
COPY docker-compose.yaml .
COPY metadata.json .
COPY ui ui