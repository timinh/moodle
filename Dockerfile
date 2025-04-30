ARG SERVER_IMAGE=timinh/php-apache:8.2

FROM ${SERVER_IMAGE}

ARG MOODLE_VERSION=MOODLE_500_STABLE
ENV ENV_VERSION=${MOODLE_VERSION}

RUN cd /tmp \
    && git clone -b "$ENV_VERSION" git://git.moodle.org/moodle.git moodle \
    && mv moodle/* /var/www/html/ \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

COPY ./vhost.conf /etc/apache2/sites-enabled/000-default.conf
COPY ./php.ini /usr/local/etc/php/conf.d/moodle.ini