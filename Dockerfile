FROM alpine:latest AS builder

RUN apk fix && \
    apk --no-cache --update add git

RUN git clone https://github.com/n-murphy/swagger-editor.git


FROM scratch

LABEL org.opencontainers.image.title="Swagger Editor" \
    org.opencontainers.image.description="Swagger Editor Docker extension" \
    org.opencontainers.image.vendor="SmartBear" \
    com.docker.desktop.extension.api.version=">= 0.2.3" \
    com.docker.desktop.extension.icon="swagger.svg" \
    com.docker.extension.screenshots='[{"alt":"Swagger Editor", "url":"https://static1.smartbear.co/swagger/media/images/tools/opensource/swagger_editornew.png"}]' \
    com.docker.extension.detailed-description="Swagger Editor as a docker extension" \
    com.docker.extension.publisher-url="https://swagger.io/" \
    com.docker.extension.additional-urls='[{"title":"Swagger","url":"https://swagger.io/"}]' \
    com.docker.extension.changelog="<ul><li>Updated for version 4.4.0 of Swagger Editor.</li></ul>"

COPY --from=builder /swagger-editor/dist ./swagger-editor/dist
COPY --from=builder /swagger-editor/index.html ./swagger-editor/index.html

COPY swagger.svg swagger.svg
COPY metadata.json .