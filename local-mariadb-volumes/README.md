# MariaDB | phpMyAdmin

This setup contains the following Docker Images:
- [MariaDB](https://hub.docker.com/_/mariadb)  
  MariaDB Server is a high performing open source relational database, forked from MySQL.
- [phpMyAdmin](https://hub.docker.com/_/phpmyadmin)  
  A web interface for MySQL and MariaDB.

> **Warning**  
> This setup is only intended as a local test setup.  
> Don't use this for production.

## Environment
This provides a Docker Compose setup: `local_mariadb`

- Containers
  - `mariadb-server`: MariaDB
  - `phpmyadmin`: phpMyAdmin
- Ports | Endpoints
  - MariaDB: `3306`
  - phpMyAdmin: [`http://localhost:3307`](http://localhost:3307)
- Volumes
  - `mariadb_data`
- Network `local_mariadb` with Hosts:
     - `mariadb`
     - `phpmyadmin`

#### phpMyAdmin: Connection to MariaDB

phpMyAdmin is configured to auto-login with the root user.

Connect from phpMyAdmin to MariaDB server:
- `host.docker.internal:3306`  
  The host has a changing IP address, or none if you have no 
  network access. Docker recommends that you connect to the 
  special DNS name `host.docker.internal`, which resolves to the 
  internal IP address used by the host.
- `mariadb:3306`  
   - Host `mariadb` is in the docker network `local_mariadb`
   - phpMyAdmin runs within Host `phpmyadmin` in the same network
- Note: `localhost:3306` *(from Host)*  
  - This might not work depending on the Connection Library.  
    It seems some need an IP (`127.0.0.1`) and won't work with `localhost`.

## phpMyAdmin: Add Themes

1. [Download a Theme](https://www.phpmyadmin.net/themes/) of your choice
2. Extract the downloaded .zip and save the Theme in e.g.:  
   `./pma-themes/boodark-nord/`
3. Add the local Theme as a Bind Mount volume to service `phpmyadmin`:
   ```
   volumes:
     - './pma-themes/boodark-nord:/var/www/html/themes/boodark-nord:ro'
   ```

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

### Remove all services and volumes from this setup

```
docker-compose down -v
```
