// Corresponding Dockerfile: https://github.com/JabRef/jabref/blob/main/Dockerfile.jabkit
FROM ghcr.io/jabref/jabkit:edge

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
