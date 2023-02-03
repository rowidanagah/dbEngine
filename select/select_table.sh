#!/bin/bash
cd ..

function duplicatedTable(){
    if [[ -f $1 ]] 
    then
        return 0
    else 
        return 1
    fi

}

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

# get& handel table name -> keep on reading till we get a valid name
function getTableName(){
    read -p " enter a valid table name " table_name
    while notValid $table_name 
    do 
        read -p "PLeaze enter a valid user name " table_name
    done
}

function Select_all(){

	#NR=$(awk -F : 'END{print NR}' $1)
	
	let NR=$(awk 'END { print NR }' $1)


	tail -n$NR $1 >> select.txt

	column -t -s ':' select.txt  > output.txt  

	cat output.txt

	rm select.txt output.txt
}



meta=$PWD/data/tmp/metaData/$1
table_name=$PWD/data/tmp/$1


if duplicatedTable $table_name
then
   echo "Showing your table file records"
   echo "--------------------------"
   Select_all $table_name

else
	echo "table name not found"
	getTableName
fi


# getColsumbers $meta

# getColsNameAndTypes $meta