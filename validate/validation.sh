# here we will handle some validation 

function notValid(){
    if ! [[ $1 =~ ^[a-zA-Z]+$ ]]; then
        echo 'wrong name. only a-zA-Z characters are allowed'
        return 0
    else
        return 1

    fi
}  

function validName(){
    if  [[ $1 =~ ^[a-zA-Z]+$ ]]
    then
        return 1
    else
        return 0

    fi
}


# a function that will check is the 
function checkTypeofInt(){
    # $1 -> for val name
    if [[ $1 =~ ^[0-9]+$ ]]
    then 
        return 1
    else 
        return 0
    fi
}

function checkTypeofSTring(){
   if  [[ $1 =~ ^[a-zA-Z]+$ ]]
   then
        return 1
    else
        return 0
    fi
}

