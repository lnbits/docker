# LNbits docker compose enviroments
Multiple setups with different fundingsources to choose from.

- postgres database
- (optional) nginx reverse proxy with letsencrypt certificates


## available fundingsources
- FakeWallet
- PhoenixWallet


## how to run with docker
prerequisites (tested on ubuntu 22.04 LTS), install and start docker
```sh
sudo apt-get install docker.io docker-compose-v2
# enable so docker starts on boot
sudo systemctl enable docker
# start docker
sudo systemctl start docker
# check if docker is running
sudo systemctl status docker
```
clone the repository and choose a setup
```sh
git clone https://github.com/lnbits/docker
cd docker
# choose setup
cd fakewallet # or phoenixd
docker compose up
```

## NGINX
### run the nginx webserver
```sh
cd nginx
docker compose up
```
### getting a certificate
IMPORTANT: be sure that your server is reachable from the internet and that you have a domain name pointing to your server.
```sh
cd nginx
sh create_cert.sh mydomain.com
```

### renewing a certificate
```sh
cd nginx
sh renew_cert.sh mydomain.com
```
