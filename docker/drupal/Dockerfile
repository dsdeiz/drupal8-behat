FROM drupal:8

RUN apt-get update -qq \
  && apt-get install wget mysql-client -yq

RUN usermod -u 1000 www-data

RUN sed -i "s#/var/www/html#/var/www/web#g" /etc/apache2/apache2.conf

ADD vhost.conf /etc/apache2/sites-available/000-default

WORKDIR /var/www/web
