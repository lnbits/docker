# LNbits docker compose enviroments
Multiple setups with different fundingsources to choose from.

- Postgres database
- (optional) nginx reverse proxy with letsencrypt certificates
- (optional) caddy reverse proxy with letsencrypt certificates


## Available fundingsources
- FakeWallet
- PhoenixWallet

### Prerequisites (tested on ubuntu 22.04 LTS), install and start docker
```sh
sudo apt-get install docker.io docker-compose-v2
# enable so docker starts on boot
sudo systemctl enable docker
# start docker
sudo systemctl start docker
# check if docker is running
sudo systemctl status docker
```

### Run LNbits
Clone the repository and choose a setup
```sh
git clone https://github.com/lnbits/docker
cd docker
# choose setup
cd fakewallet # or phoenixd
docker compose up
```

### Update LNbits
```sh
git pull
cd docker/fakewallet # or docker/phoenixd
docker compose pull
docker compose down
docker compose up -d
```

## Webserver
IMPORTANT: be sure that your server is reachable from the internet and that you have a domain name pointing to your server.
Also dont forget connect the webserver container to the lnbits container

### Caddy
```sh
cd webserver/caddy
sh change_domain.sh mydomain.com
docker compose up
# connect to lnbits container use fakewallet_default or phoenixd_default
docker network connect fakewallet_default caddy-caddy-1
```


### Nginx
#### Run the nginx webserver
```sh
cd webserver/nginx
docker compose up
# connect to lnbits container use fakewallet_default or phoenixd_default
docker network connect fakewallet_default nginx-nginx-1
```

#### Getting a certificate
```sh
cd webserver/nginx
sh create_cert.sh mydomain.com
```

#### Renewing a certificate
```sh
cd webserver/nginx
sh renew_cert.sh mydomain.com
```
