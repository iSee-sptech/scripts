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

            sudo docker run -d -p 3306:3306 --name ContainerMySql -e "MYSQL_DATABASE=isee" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:8

            echo \"[Criando Container de MySql...Acessando o Container...]\"
            sleep 2
            
            sudo su
            docker exec -it ContainerMySql bash
            mysql -u root -purubu100 -e "
            
use iSee;
create table Usuarios (
idUsuario int primary key auto_increment,
nomeUsuario varchar (100),
cargoUsuario varchar (30),
emailUsuario varchar (70) unique,
cepUsuario char (9),
cpfUsuario char (14) unique not null,
telefoneUsuario char (15) unique,
crmUsuario  char (6),
senhaUsuario varchar (20) not null,
dataNascUsuario date,
imagemPerfilUsuario varchar (255),
numeroLocalUsuario varchar (6),
complementoLocalUsuario varchar (25)
);
"
            
            sleep 3
            exit
            echo \"[Imagem de MySQL em Container Docker instalada...e tabelas mySQL criadas :)]"\
            sleep 3
    fi
