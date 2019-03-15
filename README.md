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

You use the contents of <service>.docker folders as a reference to build your own docker-compose / Dockerfiles.

Alternatively, you can leverage the docker-init.sh script for basic docker-compose orchestration. See docker-init.sh section below. 

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
up            docker-init up                      Calls docker-compose up on all docker-compose.yml files in the run folder (default: init.docker); accepts all arguments for docker-compose
down          docker-init down                    Calls docker-compose down on all docker-compose.yml files in the run folder (default: init.docker); accepts all arguments for docker-compose

```

#### docker-init.sh add | rm | ls
```
docker-init.sh add mariadb
# adds a symlink to the mariadb.docker folder inside init.docker.
# rm removes the symlink and ls lists all contents of init.docker
```
#### docker-init.sh up | down
```
docker-init.sh up --build -d
# Runs docker-compose on the symlinks / folders inside init.docker
```

Add a new docker service by creating a folder using the following convention: <docker_service>.docker. The folder MUST contain a docker-compose.yml file.

Example:
```
mariadb.docker
    - docker-compose.yml
    - .env
    - mariadb.Dockerfile
```

### Contributing

Help this repo grow by adding more examples! Check out the docker-init.sh section for folder structures when contributing example docker-compose and Dockerfiles!

### LICENSE

See License.