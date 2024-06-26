# PostgreSQL Server | pgAdmin 4

This setup contains the following Docker Images:
- [PostgreSQL Server](https://hub.docker.com/_/postgres)  
  The PostgreSQL object-relational database system provides reliability and data integrity.
- [pgAdmin 4](https://hub.docker.com/r/dpage/pgadmin4)  
  pgAdmin 4 is a web based administration tool for the PostgreSQL database.

> **Warning**  
> This setup is only intended as a local test setup.  
> Don't use this for production.

## Environment
This provides a Docker Compose setup: `local_postgresql`

- Containers
  - `postgres-server`: PostgreSQL Server
  - `pgadmin4`: pgAdmin 4
- Ports | Endpoints
  - PostgreSQL Server: `5432`
  - pgAdmin 4: [`http://localhost:5433`](http://localhost:5433)
- Bind Mounts
  - `./postgresql_data`
  - `./pgadmin4_data`
- Network `local_postgresql` with Hosts:
     - `postgresql`
     - `pgadmin4`

#### Bind Mounts
Note the information in the documentation of [pgAdmin 4: Container Deployment](https://www.pgadmin.org/docs/pgadmin4/latest/container_deployment.html):

>pgAdmin runs as the pgadmin user (`UID: 5050`) in the pgadmin group (`GID: 5050`) in the container. You must ensure that all files are readable, and where necessary (e.g. the working/session directory) writeable for this user on the host machine.  

In this example setup this means to make sure that directory with the bind mount for pgAdmin has the required permissions: `sudo chown -R 5050:5050 ./pgadmin4_data`

#### pgAdmin 4: AutoLogin | Connection to PostgreSQL Server

pgAdmin is configured to auto-login without a master password required.

Connect from pgAdmin to PostgreSQL server:
- `host.docker.internal:5432`  
  The host has a changing IP address, or none if you have no 
  network access. Docker recommends that you connect to the 
  special DNS name `host.docker.internal`, which resolves to the 
  internal IP address used by the host.
- `postgresql:5432`  
   - Host `postgresql` is in the docker network `local_postgresql`
   - pgAdmin runs within Host `pgadmin4` in the same network


## Docker Compose

Use the following commands for this setup

### Start the setup

```
docker-compose up -d
```

### Stop all services in this setup

```
docker-compose stop
```

### Remove all services from this setup

```
docker-compose down
```

### Update all services from this setup

These 3 commands will first tear down the existing containers, then pull the latest versions from Docker Hub and set everything up again:

```
docker-compose down
docker-compose pull
docker-compose up -d
```
