FROM alpine:latest AS client-builder

RUN apk fix && \
    apk --no-cache --update add git

WORKDIR /tmp

RUN git clone https://github.com/swagger-api/swagger-editor.git


FROM scratch

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

COPY --from=client-builder /tmp/swagger-editor ./swagger-editor
COPY swagger.svg swagger.svg
COPY metadata.json .
