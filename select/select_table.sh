#!/bin/bash
#cd ..

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

function checkTableFile(){
    if [[ -f $1 ]] 
    then
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

function displayTableData(){
    # giiven table name -> display its res using awk or cut :)"

	#NR=$(awk -F : 'END{print NR}' $1)
	
	let NR=$(awk 'END { print NR }' $1)


	tail -n$NR $1 >> select.txt

	column -t -s ':' select.txt  > output.txt  

	cat output.txt

	rm select.txt output.txt
}

# Start from here

# get a table name as a first argument for this script
meta=$PWD/data/$connected_db/metaData/$1
table_name=$1
table_file=$PWD/data/$connected_db/$1


# v.0.1 -> skip other options for now -> work on select all first
if checkTableFile $table_file
then
   echo "Showing your table file records"
   echo "--------------------------"

else
	echo "table with '$table_name' name not found"
	getTableName
fi


table_file=$PWD/data/$connected_db/$table_name

echo $table_name
displayTableData $table_file



# getColsumbers $meta

# getColsNameAndTypes $meta