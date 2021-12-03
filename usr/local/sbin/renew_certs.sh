#!/bin/bash

service apache2 stop
letsencrypt renew -n
service apache2 start

# HH MM DD MM DY 
# 03 02 * * 7 /bin/bash /usr/local/sbin/renew_certs.sh

