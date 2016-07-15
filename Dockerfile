FROM ubuntu:14.04
MAINTAINER hello@menzo.io

RUN apt-get update

RUN apt-get install -y apache2 php5

RUN apt-get clean

RUN rm /var/www/html/index.html

RUN mkdir /vhosts

COPY create-vhost.sh /create-vhost.sh

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN echo "<?php phpinfo(); ?>" > /var/www/html/index.php

RUN chmod +x /create-vhost.sh

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]