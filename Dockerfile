FROM alpine:latest

LABEL maintainer="jan@civitelli.de"

RUN apk update && \
    apk add --no-cache openjdk21-jre wget eudev bash

WORKDIR /app

RUN wget -O /opt/server.jar https://piston-data.mojang.com/v1/objects/95495a7f485eedd84ce928cef5e223b757d2f764/server.jar

COPY opt/entry.sh /opt/entry.sh
RUN chmod +x /opt/entry.sh

EXPOSE 25565

ENV EULA=FALSE

ENTRYPOINT ["bash","/opt/entry.sh"]