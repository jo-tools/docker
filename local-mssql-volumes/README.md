# Microsoft SQL Server | Adminer

This setup contains the following Docker Images:
- [Microsoft SQL Server](https://hub.docker.com/_/microsoft-mssql-server)  
  Official images for Microsoft SQL Server based on Ubuntu
- [Adminer]https://hub.docker.com/_/adminer)  
  Database management in a single PHP file.

> **Notes**  
> The volume `mssql_data` needs to be created before starting this setup:  
> `docker volume create mssql_data`  
>   
> Password needs to be at least 8 characters and strong enough

> **Warning**  
> This setup is only intended as a local test setup.  
> Don't use this for production.

## Environment
This provides a Docker Compose setup: `local_mssql`

- Containers
  - `mssql-server`: Microsoft SQL Server
  - `adminer`: Adminer
- Ports | Endpoints
  - Microsoft SQL Server: `1433`
  - Adminer: [`http://localhost:1434`](http://localhost:1434)
- Volumes
  - `mssql_data`
- Network `local_mssql` with Hosts:
     - `mssql`
     - `adminer`

#### Adminer: Connection to Microsoft SQL Server

Adminer can't be preconfigured with all settings. You have to select the connection data manually:
- Database System: `mssql`
- Server: `mssql` | `host.docker.internal`
- Username: `sa`
- Password: `Passw0rd`
- Database: `master`

Connect from Adminer to Microsoft SQL server:
- `host.docker.internal:1433`  
  The host has a changing IP address, or none if you have no 
  network access. Docker recommends that you connect to the 
  special DNS name `host.docker.internal`, which resolves to the 
  internal IP address used by the host.
- `mssql:1433`  
   - Host `mssql` is in the docker network `local_mssql`
   - Adminer runs within Host `adminer` in the same network


## Docker Compose

Use the following commands for this setup

### Create Volume `mssql_data`

```
docker volume create mssql_data
```

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

### Delete Volume `mssql_data`

```
docker volume rm mssql_data
```
