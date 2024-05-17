# cubeSQL Server | cubeSQL Web Admin

This setup contains the following Docker Images:
- [cubeSQL Server](https://hub.docker.com/r/jotools/cubesql)  
  cubeSQL (© sqlabs) is a fully featured and high performance relational database management system built on top of the sqlite database engine.
- [cubeSQL Web Admin](https://hub.docker.com/r/jotools/cubesql-webadmin)  
  Web Administration for cubeSQL Server.

> **Warning**  
> This setup is only intended as a local test setup.  
> Don't use this for production.

## Environment
This provides a Docker Compose setup: `local_cubesql`

- Containers
  - `cubesql-server`: cubeSQL Server
  - `cubesql-webadmin`: cubeSQL Web Admin
- Ports | Endpoints
  - cubeSQL Server: `4430`
  - cubeSQL Web Admin: [`http://localhost:4431`](http://localhost:4431)
- Bind Mounts
  - `./cubesql_data`
- Network `local_cubesql` with Hosts:
     - `cubesql`
     - `cubesql-webadmin`

### cubeSQL License / Registration

You will need to register cubeSQL.

1. Login with [cubeSQL Web Admin](http://localhost:4450)
2. Go to "Server -> Registration"
3. [Request a Key](https://www.sqlabs.com/cubesql_devkey) from [sqlabs](https://www.sqlabs.com/cubesql)
4. Register your server


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
