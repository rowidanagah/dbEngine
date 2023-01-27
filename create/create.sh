

if [ $# -eq 0 ]
    then
    echo create: Missing argument

elif [ $1 == "table" ]
    then
    if [ -z $db_name ]
        then
        echo Error: connect to database first
    else
        create_table $2
    fi

elif [ $1 == 'database' ]
    then
    createdb $2 # $2 = name
fi