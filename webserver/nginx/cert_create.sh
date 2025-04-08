#!/bin/sh
domain=$1
if [ -z "$domain" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi
cat ./http.conf | sed "s/%domain%/$domain/g" > ./conf/http.conf
docker compose restart
docker compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run -d $domain
docker compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ -d $domain
cat ./https.conf | sed "s/%domain%/$domain/g" > ./conf/https.conf
docker compose restart
