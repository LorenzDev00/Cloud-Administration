# Exercise 7: Docker
- La directory /exam/exercise7 dovrà contenere i files:
  - Dockerfile
  - start_application.sh
  - docker-compose.yml
- Dockerfile conterrà le istruzioni per la creazione della immagine Docker basata su fedora:lates con installato il servizio HTTPD e il servizio NGINX
- entrypoint.sh sarà lo script chiamato come ENTRYPOINT dalla immagine Docker, il cui compito è quello di andare ad attivare il processo HTTPD o il processo NGINX a seconda del valore riportato dalla variabile di ambiente SERVICE
  - se SERVICE=HTTPD allora dovrà essere attivato il processo httpd
  - se SERVICE=NGINX allora dovrà essere attivato il processo nginx
- docker-compose.yml verrà utilizzato per effettuare la build automatica della immagine (se non presente), per lanciare l’immagine Docker, per passare la variabile di ambiente SERVICE, per attivare port binding tra il vostro sistema di esame e la porta del servizio HTTP/NGINX presente sul container.
- NGINX:
  - porta di default è la porta 80 come per httpd
  - Per installare nginx potete utilizzare i repository configurati sul vostro sistema, così come fareste per installare httpd, quindi non è necessario cercare metodologie alternative.
  - Per attivare il servizio nginx (mai lanciato direttamente durante i laboratori proposti durante l’anno) in foreground utilizzare il comando nginx -g, "daemon off;"

### Dockerfile
```bash
FROM fedora:latest
COPY ./start_app.sh /usr/local/entrypoint.sh
RUN yum -y install httpd nginx
RUN chmod +x /usr/local/entrypoint.sh
ENV SERVICE=HTTPD
ENTRYPOINT ["/usr/local/entrypoint.sh"]
```
### Start_app.sh
```bash
#!/bin/bash
case ${SERVICE} in
	HTTPD)
		/usr/sbin/httpd -D FOREGROUND
		;;
	NGINX)
		/usr/sbin/nginx -g "daemon off;"
		;;
esac
```
### docker-compose.yml
```bash
version: "3.8"
services:
  app:
    build: .
    image: exam:08022022
    ports:
    - "8080:80"
    environment:
     SERVICE: NGINX
```
```bash
[root@class website1]# docker build -t exam:08022022 .
Sending build context to Docker daemon  4.096kB
Step 1/6 : FROM fedora:latest
 ---> 95b7a2603d3a
Step 2/6 : COPY ./start_app.sh /usr/local/entrypoint.sh
 ---> 79a6ee119bf9
Step 3/6 : RUN yum -y install httpd nginx
 ---> Running in 63e31fa0f3f1
Complete!
Removing intermediate container 63e31fa0f3f1
 ---> 72267d83c392
Step 4/6 : RUN chmod +x /usr/local/entrypoint.sh
 ---> Running in 2c8791897fe8
Removing intermediate container 2c8791897fe8
 ---> 631f5c6b6da4
Step 5/6 : ENV SERVICE=HTTPD
 ---> Running in 1b5f2dae2b68
Removing intermediate container 1b5f2dae2b68
 ---> 31633c718d3b
Step 6/6 : ENTRYPOINT ["/usr/local/entrypoint.sh"]
 ---> Running in 3388aaa9edd9
Removing intermediate container 3388aaa9edd9
 ---> 342572b1303d
Successfully built 342572b1303d
Successfully tagged exam:08022022

[root@class website1]# docker-compose up -d
Creating network "website1_default" with the default driver
Creating website1_app_1 ... done
[root@class website1]# docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED                                                                               STATUS          PORTS                                   NAMES
6b0cd5aaae70   exam:08022022   "/usr/local/entrypoi…"   37 seconds ago                                                                        Up 36 seconds   0.0.0.0:8080->80/tcp, :::8080->80/tcp   website1_app_                                                                     1
[root@class website1]# curl localhost:8080
