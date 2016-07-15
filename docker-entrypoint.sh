#/bin/bash

CONTAINER_IP=$(awk 'END{print $1}' /etc/hosts)

/create-vhost.sh example.dev $CONTAINER_IP

/bin/bash -c "source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND"