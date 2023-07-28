#!/bin/bash
exitv=3
testSingle(){

 npm test -- "$(pwd)/$1"
 exit 0
}
testSingleCoverage(){

 npm test -- --coverage "$(pwd)/$1"
 exit 0
}

init(){
    Green='\033[0;32m'
    NC='\033[0m' # No Color

    echo "Seleccione una opcion de test"
    echo -e " 1-${Green}test single${NC} \n 2-${Green}test coverage${NC} \n ${exitv}-${Green}Salir${NC}"
    read x

    while [ $x != $exitv ]
    do
    case $x in
        1)
            echo "Ingreser el path del archivo"
            read y
            testSingle "$y" 
            exit
        ;;
        2)
            echo "Ingreser el path del archivo"
            read y
            testSingleCoverage "$y" 
            exit
        ;;
        $exitv)
            exit 0
        ;;
        esac
    done
}