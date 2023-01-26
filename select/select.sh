#!/bin/bash

# check if table file exists 
function checkTableFile(){
    if [[ -f $1 ]] 
    then
        return 0
    else 
        return 1
    fi
}

function displayTableData(){
    # giiven table name -> display its res using awk or cut :)"
}

# query 
#  cmd   $1  $2    $3
# select all from  tablename 

# v.0.1 -> skip other options for now -> work on select all first
if checkTableFile $3
then
    displayTableData $3
else    
    echo "table doesn't exist"
fi