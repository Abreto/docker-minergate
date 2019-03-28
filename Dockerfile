FROM ubuntu

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        ca-certificates \
        wget

RUN wget -q --content-disposition https://minergate.com/download/deb-cli \
    && dpkg -i *.deb || true \
    && rm *.deb
RUN apt-get -qyf install \
    && rm -r /var/lib/apt/lists/*

ENTRYPOINT ["minergate-cli"]
CMD ["-user", "m@abreto.net", "-xmr"]