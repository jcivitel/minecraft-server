FROM alpine:latest

LABEL maintainer="jan@civitelli.de"

RUN apk update && \
    apk add --no-cache openjdk21-jre wget eudev bash

WORKDIR /app

RUN wget -O /opt/server.jar https://piston-data.mojang.com/v1/objects/59353fb40c36d304f2035d51e7d6e6baa98dc05c/server.jar

COPY opt/entry.sh /opt/entry.sh
RUN chmod +x /opt/entry.sh

EXPOSE 25565

ENV EULA=FALSE

ENTRYPOINT ["bash","/opt/entry.sh"]