#!/bin/bash
java -version
if [ $? -eq 0 ]
    then
    echo \"java instalado\"
    sleep 6
    else
    echo \"java não instalado\"

    echo \"instalado pacote java\"
        echo \"instalado repositorio\"
        sleep 6
        sudo add-apt-repository ppa:webupd8team/java -y
        clear
        echo \"Atualizando repositorio\"
        sleep 
        sudo apt-get update -y
        clear

        echo \"Instalando Java na versão 11\"
        sudo apt-get install default-jre -y
        sleep 10
        clear
        echo \"java instalado versão 11\"
fi
