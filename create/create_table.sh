#!/bin/bash

# validation 
function notValid(){
    if ! [[ $1 =~ ^[a-zA-Z]+$ ]]; then
        echo 'Wrong name. Only a-zA-Z characters are allowed'
        return 0
    else
        return 1

    fi
}   

# check if file exists 
function duplicatedTable(){
    if [[ -f $1 ]] 
    then
        echo "duplicated file name "
        return 1
    else 
        return 0
    fi

}

# get& handel table name
function getTableName(){
    read -p "PLeaze enter a valid user name " table_name
    while notValid $table_name 
    do 
        read -p "PLeaze enter a valid user name " table_name
    done
}

function CreatePrimaryKey(){
    
}

# a function that will handel creating col along with its types
function CreateColumns(){

}

# to handel file for table cols records and metadata file
function CreateTablefiles(){
    
}

# start running rigth here
getTableName 
echo $table_name


if duplicatedTable $table_name
then
    getTableName
else
    CreateColumns 
    CreateTablefiles 
    echo "table created successfully"
fi

