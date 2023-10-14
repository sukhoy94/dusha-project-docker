FROM php:8.2-apache
LABEL maintainer="Andrii Sukhoi"

COPY composer-installer.sh /usr/local/bin/composer-installer

RUN chmod +x /usr/local/bin/composer-installer \
    && composer-installer \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && composer --version \
    && a2enmod rewrite negotiation \
    && apt-get update \
    && apt-get install zip unzip

COPY /app /src/app
COPY .docker/apache/vhost.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /src/app