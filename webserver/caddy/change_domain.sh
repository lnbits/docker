#!/bin/sh
domain=$1
if [ -z "$domain" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi
cat Caddyfile.template | sed "s/%domain%/$domain/g" > Caddyfile
