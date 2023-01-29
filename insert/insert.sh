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

function checkTypeofCol(){
    # $1 -> for val col
    if checkTypeofInt $ColsNumber -a $2 -eq "int" #both f type if -> match types
    then 
        return 0
    elif checkTypeofSTring $ColsNumber -a $2 -eq "string" #both f type if -> match types
    then 
        return 0

    else 
        return 1
    fi
}

function getColsumbers(){
	ColsNumber=$(awk -F : 'NR==1{print $2}' $1)
	echo $ColsNumber
}

function getColsNameAndTypes(){
	colHeaders=($(awk -F : 'NR!=1{print $1}' $1))
	colType=($(awk -F : '{print $3}' $1))
	echo ${colHeaders[@]}
	echo ${colType[@]}

}


function insertIntoTable(){
    table_file="$path/$table_name"
    echo $newRecord >> $table_file


}


meta=$PWD/data/tmp/metaData/rowida

getColsumbers $meta

getColsNameAndTypes $meta

# a function that will handel adding col val along with  validating its  its types
function InsertIntoColumns(){
    ## GET table name as oarameter of this function :)"
    getColsumbers $1
    let index=0
    newRecord=""
    let lstindx=$ColsNumber-1
    echo $lstindx

    if checkTypeofInt $ColsNumber
    then 
        
        while [ $ColsNumber -gt $index ]
        do
        	read -p "write value of the column name (${colHeaders[index]}) : " col_val
            
            if checkTypeofCol $col_val ${colType[index]}
            then
                echo "col val inserted successfully"
                if [ $index -eq $lstindx ]
                then
                    newRecord+="$col_val"
                else 
                    newRecord+="$col_val:"
                fi
                let index-=1;
            else
                echo "type of col val doesn't match"
            fi 
        done
        else 
            echo "not a valid number of columns -> table with no cols"
        fi
}


# insert into table 

# if duplicatedTable $2:
# then
#     CreateColumns 
#     insertIntoTable
# else 
#     echo "table does't exist"
# fi