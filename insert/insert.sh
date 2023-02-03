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

function checkTypeofCol1(){
    # $1 -> for val col
    # 
    if checkTypeofInt $1 -a $2 -eq "int" #both f type if -> match types
    then 
        echo "col of type int "
        return 0
    elif checkTypeofSTring $1 -a $2 -eq "string" #both f type if -> match types
    then 
        echo "col of type string"
        return 0

    else 
        echo "type of col dnt match"
        return 1
    fi
}

function checkTypeofCol(){
    case $2 in 
        "int" )
            if checkTypeofInt $1 
            then 
                return 0
            else 
                return 1
            fi 
            ;;

        "string" )
            if checkTypeofSTring $1 
            then 
                return 0
            else 
                return 1
            fi
            ;;
        * )
			return 1
			;;
    esac
}

function getColsumbers(){
	ColsNumber=$(awk -F : 'NR==1{print $2}' $1)
	#echo $ColsNumber
}

function getColsNameAndTypes(){
	colHeaders=($(awk -F : 'NR!=1{print $1}' $1))
	colType=($(awk -F : '{print $3}' $1))
	# echo ${colHeaders[@]}
	# echo ${colType[@]}

}

function insertIntoTable(){
   # table_file="$path/$table_name"
    echo $newRecord
    echo $newRecord >> $1

}

function getfielddNumber(){
    #let NR=$(awk -F : '{print NR}' $1)
   # echo $1
    let NR=$(awk 'END { print NR }' $1)
}

# a function that will handel adding col val along with  validating its  its types
function InsertIntoColumns(){
    ## GET table name as parameter of this function :)"
    getColsumbers $1
    getfielddNumber $table # number of records
    let index=1 # to ignore the headers -> cols name at first
    newRecord="$NR:" # auto inc pk val 

    # keep tracking of the last col indx -> to skip adding 
        # `:` and the end of record line 
    let lastindx=$ColsNumber-1 

    if checkTypeofInt $ColsNumber
    then 
        
        while [ $ColsNumber -gt $index ]
        do
           
        	read -p "write value of the '${colHeaders[index]}' column : " col_val
            if checkTypeofCol $col_val ${colType[index]}
            then
                echo "col val inserted successfully"
                if [ $index -eq $lastindx ]
                then
                    newRecord+="$col_val"
                else 
                    newRecord+="$col_val:"
                fi
                let index+=1;
            else
                echo "type of col val doesn't match"
            fi 
        done
        else 
            echo "not a valid number of columns -> table with no cols"
        fi
}


cd ..
table_file=$PWD/data/tmp/metaData/$1 ## meta file
table=$PWD/data/tmp/$1 # table file


getColsNameAndTypes $table_file
# insert into table 
echo "cols name of ${table_file} "
echo ${colHeaders[@]}

echo "---------------------"


InsertIntoColumns $table_file
insertIntoTable $table


# if duplicatedTable $2:
# then
#     CreateColumns 
#     insertIntoTable
# else 
#     echo "table does't exist"
# fi