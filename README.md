# Docker Templates

This repo contains sample docker-compose and dockerfile of common services used in development. It also contains a primitive docker management script (docker-init.sh).

```
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL
NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED",  "MAY", and
"OPTIONAL" in this document are to be interpreted as described in
RFC 2119.
```

### Usage

Download / clone this repo and modify it.

Add a new docker service by creating a folder using the following convention: <docker_service>.docker. The folder MUST contain a docker-compose.yml file.

Example:
```
mariadb.docker
    - docker-compose.yml
    - .env
    - mariadb.Dockerfile
```

#### docker-init.sh
A very basic script can help orchestrate running multiple docker-compose. By default, it will run all docker-compose.yml files under any folders inside init.docker directory.

```
docker-init.sh
**************

Options & Examples:

Command       Example                             Description
add           docker-init.sh add mariadb          Adds a service to the run folder (default: init.docker)
rm            docker-init.sh rm mariadb           Removes a service from the run folder (default: init.docker)
ls            docker-init.sh ls                   Lists all services in the run folder (default: init.docker)
run           docker-init run                     Builds all docker-compose.yml files in the run folder (default: init.docker)

```
### Contributing

Help this repo grow by adding more examples! 

### LICENSE

Feel free to copy, modify, and distribute.