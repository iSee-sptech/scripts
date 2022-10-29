#!/bin/bash
    docker -version

    if [$? -eq 0]
        then
        echo \"docker instalado\"
        sleep 3
    else
        \"docker não instalado\"
        sleep 3

        echo \"instalando Docker\"
            echo 
            sudo apt update 
            sleep 150

            sudo apt install docker.io -y
            sleep 10
            
            sudo systemctl start docker
            sudo systemctl enable docker

            sudo docker pull mysql:8
            sleep 10

            sudo docker run -d -p 3306:3306 --name ContainerMySql -e "MYSQL_DATABASE=isee" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:8

            echo \"Acessando o Container\"
            sudo su
            docker exec -it ContainerMySql bash
            mysql -u root -p
            urubu100

                ---------------------------
                Script criação de tabelas
                ---------------------------
            
            sleep 3
            exit
            echo \*Docker e tabelas criadas*\
            sleep 3
    fi
