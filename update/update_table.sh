
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
    read -p "enter a valid table name :>  " table_name
    while notValid $table_name 
    do 
        read -p "pLeaze enter a valid table name " table_name
    done
}

function getColsumbers(){
    ## GET table name as parameter of this function :)" -> from meta file
	ColsNumber=$(awk -F : 'NR==1{print $2}' $1)
	echo $ColsNumber
}

function getColsNameAndTypes(){
    # get cols name and heaser 
    # get table name from meta file as a parameter
	colHeaders=($(awk -F : 'NR!=1{print $1}' $1))
	colType=($(awk -F : '{print $3}' $1))
	echo ${colHeaders[@]}
	echo ${colType[@]}
    PK=${colHeaders[0]}
    echo $PK
}


cd ..
table_file=$PWD/data/tmp/metaData/$1 ## meta file

table=$PWD/data/tmp/$1 # table file

# echo $table

# getColsNameAndTypes $table_file
# getColsumbers $table_file