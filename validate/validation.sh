# here we will handle some validation 

function notValid(){
    if ! [[ $1 =~ ^[a-zA-Z]+$ ]]; then
        echo 'wrong name. only a-zA-Z characters are allowed'
        return 0
    else
        return 1

    fi
}  