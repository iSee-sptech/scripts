#!/bin/bash
    docker -version

    if [$? -eq 0]
        then
        echo \"[Docker já instalado]\"
        sleep 3
    else
        echo \"[Docker ainda não instalado...]\"
        sleep 3

        echo \"[Preparando para iniciar instalação....Instalando Docker...]\"
            echo 
            sudo apt update 
            sleep 4

            sudo apt install docker.io -y
            sleep 4
            
            sudo systemctl start docker
            sudo systemctl enable docker

            sudo docker pull mysql:8
            sleep 4
            
            docker create -v /var/lib/mysql --name mysqldata mysql:8
            
            sudo docker run -p 3306:3306 -d -e "MYSQL_ROOT_PASSWORD=urubu100" --volumes-from mysqldata --name=ContainerMySql mysql:8

            echo \"[Criando Container de MySql...Acessando o Container...]\"
            sleep 2
            
            sudo su
            docker exec -it ContainerMySql bash

            sleep 1
            docker build -t mysql_db  .
            docker run mysql_db
            
            sleep 3

            echo \"[Imagem de MySQL em Container Docker instalada...e tabelas mySQL criadas]\"
            sleep 3
    fi
