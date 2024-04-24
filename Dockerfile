FROM postgres:16.2-alpine3.19

COPY scripts/create-multi-db-entrypoint.sh /docker-entrypoint-initdb.d/

RUN chmod +x /docker-entrypoint-initdb.d/create-multi-db-entrypoint.sh