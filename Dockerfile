FROM ubuntu

LABEL maintainer="Abreto<m@abreto.net>"

WORKDIR /minegate

ENV PKG_FILE "MinerGateX-cli-1.4-amd64-cpu.deb"

COPY ${PKG_FILE} .

RUN dpkg -i ${PKG_FILE} || true

RUN apt update && apt -qyf install

ENTRYPOINT [ "minergate-cli" ]
