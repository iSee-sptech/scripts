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
            
            sudo apt install mysql-server-8 -y
            sudo apt install docker.io -y
            sleep 4
            
            sudo systemctl start docker
            sudo systemctl enable docker

            sudo docker pull mysql:8
            sleep 4

            sudo docker run -d -p 3306:3306 --name ContainerMySql -e "MYSQL_DATABASE=isee" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:8

            echo \"[Criando Container de MySql...Acessando o Container...]\"
            sleep 2
            
            
            docker exec -it ContainerMySql mysql -u root -purubu100 -D isee -e "
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

create table Maquinas (
idMaquina int primary key auto_increment,
serialMaquina varchar(25),
sistemaOperacionalMaquina varchar(25),
fabricanteMaquina varchar(25),
arquiteturaMaquina varchar(25),
tempoDeAtividade long,
nomeMaquina varchar (100),
discoMaquina varchar(10),
ramMaquina varchar(10),
processadorMaquina varchar(10),
cepMaquina char (9) unique,
numeroMaquina varchar (6),
pontoDeReferencia varchar (25), 
imgMaquina varchar (255),
complementoMaquina varchar (50),
fkUsuario int,
foreign key (fkUsuario)
references Usuarios (idUsuario)
);

create table Etiqueta (
idEtiqueta int primary key auto_increment,
fkMaquina int,
nomeEtiqueta varchar(50),
datahoraEtiqueta datetime,
foreign key (fkMaquina)
references Maquinas (idMaquina)
);

create table Historico (
idHistorico int primary key auto_increment,
usoRamHistorico varchar(10),
usoProcessadorHistorico varchar(10),
usoDiscoHistorico varchar(10),
dataHoraHistorico datetime default current_timestamp,
statusHistorico varchar (50),
logHistorico varchar (255),
fkMaquinaHistorico int,
foreign key (fkMaquinaHistorico)
references Maquinas (idMaquina)
);

create table Lembrete(
idLembrete int primary key auto_increment,
mensagemLembrete varchar (50),
dataHoraLembrete datetime,
horarioGeradoLembrete datetime,
fkUsuario int,
foreign key (fkUsuario)
references Usuarios (idUsuario)
);

create table Alerta (
idAlerta int primary key auto_increment,
fkMaquina int,
componente varchar(10),
nivelAlerta varchar(10),
dado varchar(10),
datahoraAlerta datetime,
foreign key (fkMaquina)
references Maquinas (idMaquina)
);
"
            
            sleep 3
            exit
            echo \"[Imagem de MySQL em Container Docker instalada...e tabelas mySQL criadas]\"
            sleep 3
    fi
