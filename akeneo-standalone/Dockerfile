FROM akeneo:1.7.0-stable

COPY ./mysql /install

ENV  DATABASE_HOST=127.0.0.1 \
     DATABASE_PORT=3306 \
     DATABASE_NAME=akeneo_pim \
     DATABASE_USER=akeneo_pim \
     DATABASE_PASSWORD=akeneo_pim \
     MYSQL_DATABASE=akeneo_pim \
     MYSQL_USER=akeneo_pim \
     MYSQL_PASSWORD=akeneo_pim

RUN /install/prepare.sh && \
    /install/mysql-entry.sh && \
    /install/cleanup.sh
