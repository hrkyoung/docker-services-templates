#!/usr/bin/env bash


main(){
    case "$1" in
    "add")
        add $@
        ;;
    "rm")
        remove "$@"
        ;;
    "ls")
        list "$@"
        ;;
    "up" | "down")
        run "$@"
        ;;
    *)
        help
        ;;
    esac
}

error(){
 echo "Invalid input. Type docker-init.sh help for help."
 exit 1
}

add(){

    serviceExists "$@"
    setFolder "$@"

    ln -sv "$PWD/$2.docker" "$folder/$2"
}

serviceExists(){
    if [[ ! -d "$PWD/$2.docker" ]]
        then
        error
    fi
}

setFolder(){
    folder="init.docker"
    if [[ ! -z "$3" ]]
        then
        if [[ -d "$3" ]]
            then
            folder="$3"
        else
            echo "Invalid folder!"
            exit 1
        fi
    fi
    return 0
}

remove(){
    serviceExists "$@"
    setFolder "$@"
    rm -Rv "$PWD/$folder/$2"
}

list(){
    setFolder "$@"
    echo "${folder} services:"
    echo ""
    ls -t "$PWD/$folder"
}

run(){
    folder="init.docker"
    find "./${folder}" -mindepth 1 -maxdepth 1 -type l |
     while read LINE
     do
         cd "${LINE}"
         if [[ $? -eq 0 ]]
            then
            sudo docker-compose $@
            cd "../../"
         fi
     done
}

help(){
    echo "docker-init.sh v0.0.1"
    echo "**************"
    echo ""
    echo "Options & Examples:"
    echo ""
    echo "Command       Example                             Description"
    echo "add           docker-init.sh add mariadb          Adds a service to the run folder (default: init.docker)"
    echo "rm            docker-init.sh rm mariadb           Removes a service from the run folder (default: init.docker)"
    echo "ls            docker-init.sh ls                   Lists all services in the run folder (default: init.docker)"
    echo "up            docker-init up                      Calls docker-compose up on all docker-compose.yml files in the run folder (default: init.docker); accepts all arguments for docker-compose"
    echo "down          docker-init down                    Calls docker-compose down on all docker-compose.yml files in the run folder (default: init.docker); accepts all arguments for docker-compose"
}



main "$@"

