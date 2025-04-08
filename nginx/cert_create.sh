#!/bin/sh
domain=$1
if [ -z "$domain" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi
cat ./template.conf | sed "s/%domain%/$domain/g" > ./conf/app.conf
docker compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run -d $domain
docker compose restart
