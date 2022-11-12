FROM mysql:8

ENV MYSQL_ROOT_PASSWORD=root


COPY ./bancodedados-isee-v3.sql /docker-entrypoint-initdb.d/
