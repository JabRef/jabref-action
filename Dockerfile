# Corresponding Dockerfile: https://github.com/JabRef/jabref/blob/main/Dockerfile.jabkit
FROM ghcr.io/jabref/jabkit:edge

ENTRYPOINT ["/jabref/jabkit/bin/jabkit"]
