# docker
LNbits docker compose setups, multiple setups with different fundingsources to choose from, all of them run on following stack:
- postgres
- nginx reverse proxy
- letsencrypt certificates


## fundingsources
- FakeWallet
- PhoenixWallet


### how to run
```sh
git clone https://github.com/lnbits/docker
cd docker
# choose setup
cd fakewallet # or phoenixd
docker-compose up
```

### run the nginx webserver
```sh
cd nginx
docker-compose up
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
