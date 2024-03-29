# CubeSQL Server

This setup contains the following Docker Image:
- [CubeSQL Server](https://hub.docker.com/r/jotools/cubesql)  
  CubeSQL (© sqlabs) is a fully featured and high performance relational database management system built on top of the sqlite database engine.

> **Warning**  
> This setup is only intended as a local test setup.  
> Don't use this for production.

## Environment
This provides a Docker Compose setup: `local_cubesql`

- Containers
  - `cubesql-server`: CubeSQL Server
- Ports | Endpoints
  - CubeSQL Server: `4430`
- Bind Mounts
  - `./cubesql_data`
- Network `local_cubesql` with Hosts:
     - `cubesql`

### CubeSQL License / Registration

You will need to register cubeSQL.

1. [Request a Key](https://www.sqlabs.com/cubesql_devkey) from [sqlabs](https://www.sqlabs.com/cubesql)
2. Download [CubeSQL Admin](https://github.com/cubesql/cubeSQLAdmin), connect to CubeSQL Server and register your server


## Docker Compose

Use the following commands for this setup

### Start the setup

```
docker-compose up
```

### Stop all services in this setup

```
docker-compose stop
```

### Remove all services and volumes from this setup

```
docker-compose down -v
```
