# LNbits docker compose enviroments
Multiple setups with different fundingsources to choose from.

- Postgres database
- (optional) nginx reverse proxy with letsencrypt certificates


## Available fundingsources
- FakeWallet
- PhoenixWallet


## how to run with docker
Prerequisites (tested on ubuntu 22.04 LTS), install and start docker
```sh
sudo apt-get install docker.io docker-compose-v2
# enable so docker starts on boot
sudo systemctl enable docker
# start docker
sudo systemctl start docker
# check if docker is running
sudo systemctl status docker
```
Clone the repository and choose a setup
```sh
git clone https://github.com/lnbits/docker
cd docker
# choose setup
cd fakewallet # or phoenixd
docker compose up
```

## Nginx

### Run the nginx webserver
IMPORTANT: connect the nginx container to the same network as the lnbits container
```sh
cd nginx
docker compose up
# use fakewallet_default or phoenixd_default
docker network connect fakewallet_default nginx-nginx-1
```

### Getting a certificate
IMPORTANT: be sure that your server is reachable from the internet and that you have a domain name pointing to your server.
```sh
cd nginx
sh create_cert.sh mydomain.com
```

### Renewing a certificate
```sh
cd nginx
sh renew_cert.sh mydomain.com
```
