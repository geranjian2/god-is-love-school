#!/bin/bash
exitv=9

Green='\033[0;34m'
NC='\033[0m' # No Color


deleteImage(){
  docker rmi $1
 exit 0
}
deleteContainer(){
  docker rm $1
 exit 0
}
bashContainer(){
  docker exec -it $1 bash  
 exit 0
}

echo "select option for docker 🐬"
echo -e " 
    1-${Green}Delete Image${NC} 
    2-${Green}Delete Container${NC} 
    3-${Green}Composer build${NC} 
    4-${Green}Composer up${NC} 
    5-${Green}Composer down${NC} 
    6-${Green}docker bash${NC} 
    7-${Green}delete vendor and composer lock${NC} 
    8-${Green}docker-compose logs${NC} 
    ${exitv}-${Green}Salir${NC}"
read x

while [ $x != $exitv ]
do
  case $x in
    1)
        docker images
        echo "enter image for delete"
        read y
        deleteImage "$y" 
        exit
    ;;
    2)
        docker ps
        echo "enter id conatiner for delete"
        read y
        deleteContainer "$y" 
        exit
    ;;
    3)
        echo "docker-compose build"
        docker-compose build
        exit
    ;;
    4)
        echo "docker-compose up -d"
        docker-compose up -d
        exit
    ;;
    5)
        echo "docker-compose down"
        docker-compose down
        exit
    ;;
    6)
        docker images
        echo "enter name image for bash"
        read y
        bashContainer "$y" 
        exit
    ;;
    7)
        
        echo "delete vendor and composer.lock"
        sudo rm -R vendor
        sudo rm -R composer.lock 
        exit
    ;;
    8)
        
        echo "log container"
        docker-compose logs
        exit
    ;;
    $exitv)
        exit 0
    ;;
    esac
done