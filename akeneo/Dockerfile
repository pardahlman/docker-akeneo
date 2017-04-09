FROM php:5.6.30-apache

COPY ./installation /installation

RUN  /installation/php/install.sh && \
     /installation/composer/install.sh && \
     /installation/akeneo/download.sh && \
     /installation/akeneo/composer-install.sh && \
     /installation/apache2/configure.sh && \
     /installation/cleanup.sh

COPY ./entry /entry

ENTRYPOINT /entry/entry-point.sh

