FROM ubuntu

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        ca-certificates \
        wget \
    && rm -r /var/lib/apt/lists/*

RUN wget -q --content-disposition https://minergate.com/download/deb-cli \
    && dpkg -i *.deb || true \
    && rm *.deb \
    && apt-get -f install

ENTRYPOINT ["minergate-cli"]
CMD ["-user", "m@abreto.net", "-xmr"]