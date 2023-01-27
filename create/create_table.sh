#!/bin/bash

# validation 
function notValid(){
    if ! [[ $1 =~ ^[a-zA-Z]+$ ]]
    then
        echo 'Wrong name. Only a-zA-Z characters are allowed'
        return 0
    else
        return 1

    fi
}   

function validName(){
    if [[ $1 =~ ^[a-zA-Z]+$  ]]
    then
        return 0
    else
        return 1
    fi
}

# a function that will check is the 
function checkTypeofInt(){
    # $1 -> for val name
    if [[ $1 =~ ^[0-9]+$ ]]
    then 
        return 0
    else 
        return 1
    fi
}

function checkTypeofSTring(){
   if  [[ $1 =~ ^[a-zA-Z]+$ ]]
   then
        return 0
    else
        return 1
    fi
}

# check if table file exists 
function duplicatedTable(){
    if [[ -f $1 ]] 
    then
        echo "duplicated file name "
        return 0
    else 
        return 1
    fi

}

# get& handel table name -> keep on reading till we get a valid name
function getTableName(){
    read -p " enter a valid table name " table_name
    while notValid $table_name 
    do 
        read -p "PLeaze enter a valid user name " table_name
    done
}

# a functions that handel pk constrain 
function CreatePrimaryKey(){
    read -p "write (pk) column name : " col_name
    if validateColName $col_name 
    then
        colType+=("int")
    else 
        echo "not a valid column name "
        CreatePrimaryKey
    fi 
}

colHeaders=()
colType=()
# copy with it  till now
#cd ../
path=$PWD/data/tmp


function validateColName(){
    # if a valid col name -> append it to colHeaders array
    if validName $1
    then
        colHeaders+=($1)
        return 0
    else
        return 1
    fi 
}

# a function that will handel creating col along with its types
function CreateColumns(){
    typeset -i numOfCols
    
    read -p "write your number of columns : " numOfCols
    if checkTypeofInt $numOfCols
    then 
        let ColsNumber=$numOfCols+1
        echo $ColsNumber
        while [ $numOfCols -gt 0 ]
        do
            read -p "write column name : " col_name
            
            if validateColName $col_name 
            then # get  col type
                echo "chooce column datatype : "
                    select datatype in "int" "string"
                    do
                        case $datatype in
                            "int" )
                                colType+=($datatype)
                                break;;

                            "string" ) 
                                colType+=($datatype)
                                break;;
                        esac
                    done
                    let numOfCols-=1
        
            else 
                echo "not a valid column name !"
            fi 
            
        done
        else 
            echo "write a valid number of columns "
        fi
}


# to handel file for table cols records and metadata file
function CreateTablefiles(){

    table_file="$path/$table_name"
    meta_file="$path/metaData/$table_name"

    
    echo "$table_name:$ColsNumber"  >> $meta_file
    
    touch $table_file

    #colHeaders colType
    ColNumber=0
    while [ ! $ColsNumber -eq $ColNumber ]
    do
        echo "${colHeaders[$ColNumber]}:$(( $ColNumber+1)):${colType[$ColNumber]}" >> $meta_file
        let ColNumber+=1

    done        
    
}

# start running rigth here
getTableName 

# if validName $1 :
# then
#     table_name=$1
# else :
#     getTableName $1


echo $table_name


if duplicatedTable $table_name
then
    getTableName
else
    CreatePrimaryKey #get pk first
    CreateColumns  # handel the rest of cols
    CreateTablefiles  #touch file
    echo "table created successfully"
fi

#CreateColumns 
# echo colsname is ${colHeaders[@]}
# echo ${colType[@]}
