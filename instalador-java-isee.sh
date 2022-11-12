#!/bin/bash
java -version
if [ $? -eq 0 ]
    then
    echo \"[Java já instalado]\"
    sleep 6
    else
    echo \"[Java ainda não instalado]\"

    echo \"[Preparando para instalação...instalando pacote Java...]\"
        echo \"[instalando repositório...]\"
        sleep 6
        sudo add-apt-repository ppa:webupd8team/java -y
        clear
        echo \"[[Atualizando repositório...]\"
        sleep 
        sudo apt-get update -y
        clear

        echo \"[Instalando Java - versão 11...]\"
        sudo apt-get install default-jre -y
        sleep 10
        clear
        echo \"[Java instalado - versão 11 ]\"
        sleep 2

fi
