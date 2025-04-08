#!/bin/bash
seed=$1
if [ -z "$seed" ]; then
  echo "Usage: $0 '<seed>'"
  exit 1
fi
# check if it has more than 1 argument
if [ $# -gt 1 ]; then
  echo "Usage: $0 '<seed>'"
  exit 1
fi
docker compose exec phoenixd touch /root/.phoenix/seed.dat
docker compose exec phoenixd mv /root/.phoenix/seed.dat /root/.phoenix/seed.dat.bak
docker compose exec phoenixd su -c "echo $1 > /root/.phoenix/seed.dat"
