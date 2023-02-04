
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

# a function that will check of type int
function checkTypeofInt(){
    # $1 -> for val name
    if ! [[ $1 =~ ^[0-9]+$ ]]
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
    read -p "enter a valid table name :>  " table_name
    while notValid $table_name 
    do 
        read -p "pLeaze enter a valid table name " table_name
    done
}
# get& handel table name -> keep on reading till we get a valid name
function getColName(){
    read -p "enter a valid column name :>  " col_name
    while notValid $col_name 
    do 
        read -p "pLeaze enter a valid column name " col_name
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

# kinda of validation if a record with a given pk is given
function find_record(){
    # find row val based on PK number&val
    # $1- > for table name
    # $2 -> for pk value

    let indx=0
    ## get the first field of each row/record in table -> get pk
    for record in $(cut -f1 -d: "$1") 
    do
        # if pk was found
		if [[ $record = "$2" ]]
        then
           echo "this record was found ${record} "
           rows=($(cut -d: -f1- "$1")) # get all rows in arrary
           #old_record=$(awk '{if(NR == ${2} ) print $1}' $1) -> not used -> failed to get NR of val equal $PK
           # echo ${rows[@]} # all array vals -> all rows in table
           echo "------------"
           old_record=${rows[$record]} #row with matched pk :)"
           echo "row was this '${2}' PK val was found :> " 
           #echo $old_record
           echo "------------"
           OIFS=$IFS
           IFS=":"
           old_record_array=($old_record) 
           echo ${old_record_array[@]}
           return 0
        fi
        let indx+=1
    done
        echo "record not found, pk number is greater than number of table records"
    return 1
}

# a function to check existence of a col name
function CheckCOlExist(){
    echo ${colHeaders[@]}
    echo "---------------"
    for col in ${colHeaders[@]}:
    do
        if [ $1 == $col ]
        then
            echo $1
            echo "match found ${col} "
            return 0
        fi
    done
    echo "col name not found"
    return 1

}

# start from here 
cd ..
table_file=$PWD/data/tmp/metaData/$1 ## meta file
table_name=$PWD/data/tmp/$1 # table file


getColsNameAndTypes $table_file
getColsumbers $table_file

typeset -i pk_val

read -p "enter pk val of the record you need to update :> " pk_val

while ! find_record $table_name $pk_val
do
    typeset -i pk_val

    read -p "enter pk val of the record you need to update :> " pk_val

done


getColName # return col_name

CheckCOlExist $col_name