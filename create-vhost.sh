#/bin/bash

 echo "server {
        listen   80;
        server_name ${1};
        location / {
            proxy_pass http://$2:80;
        }

}" > /vhosts/$1.conf