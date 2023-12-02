FROM ethereum/client-go:alltools-release-1.13

ARG ACCOUNT_PASSWORD

COPY genesis.json /tmp/
COPY node-2.private.key /keys/
COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh
ENV GOMAXPROCS=8

RUN geth init /tmp/genesis.json \
    && echo ${ACCOUNT_PASSWORD} > /tmp/password \
    && geth account import --password /tmp/password /keys/node-2.private.key

ENTRYPOINT ["/bin/sh", "/usr/local/bin/entrypoint.sh"]