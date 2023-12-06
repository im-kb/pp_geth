FROM ethereum/client-go:alltools-release-1.13

ENV GOMAXPROCS=8
WORKDIR /app

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/bin/sh", "/app/entrypoint.sh"]