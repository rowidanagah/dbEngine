#!/bin/bash

# cd ..
# path=$PWD/data/$1


function validName(){
    if [[ $1 =~ ^[a-zA-Z]+$  ]]
    then
        return 0
    else
        return 1
    fi
}

function checkDbDir(){
    if [[ -d $1 ]]
    then 
        return 0
    else
        return 1
    fi 
}
cd ..

path=$PWD/data/$1

if validName $1
then
    if checkDbDir $path
    then

        echo "connected to $1 database"
        db_name=$1
        PS3=`$1 > `
    else 
        echo "database not exists"
    fi 
fi


export connected_db=$db_name
