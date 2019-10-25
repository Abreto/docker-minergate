FROM ubuntu

LABEL maintainer="Abreto<m@abreto.net>"

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        ca-certificates \
        wget \
    && rm -r /var/lib/apt/lists/*

WORKDIR /minegate

ENV PKG_FILE "MinerGate-xFast-cli-1.5-ubuntu.deb"

COPY ${PKG_FILE} .

RUN dpkg -i ${PKG_FILE} || true

RUN apt update && apt -qyf install && rm *.deb

ENTRYPOINT [ "minergate-cli" ]
CMD ["-u", "m@abreto.net", "-xmr"]
