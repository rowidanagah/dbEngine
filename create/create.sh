
if [ $# -eq 0 ]
    then
    echo create: not a valid query 

elif [ $1 == "table" ]
    then
    if [ -z $db_name ]
        then
        echo you need to connect to databse first
    else
        create_table $2
    fi

elif [ $1 == 'database' ]
    then
    createdb $2 # $2 = name
fi