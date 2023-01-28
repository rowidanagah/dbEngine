
echo "Enter the name of database "
read databaseName

# validName () {
#     if [[ $1 =~ [a-zA-Z][a-zA-Z]* ]]
#         then
#         return 0
#     else
#         echo Ivalid name: $1
#         return 1
#     fi
# }
# if [  $databaseName == "back" ]
# then
# 	clear 
# 	. select.sh
# fi
cd ..
cd data
if [[ -d "$databaseName" ]]
then
    echo "duplicated database name, you should write another name!"
    cd -
    cd create
    options=("Create another one" "Exit")
	select val in "${options[@]}"
	do
		case $val in
             "Create another one")
            clear ; . createdb.sh      ; break
            ;;
			#  "Back to MENU")
      #       clear ; . select.sh ; clear ; break
      #       ;;
             "Exit")
            	echo "Goodbye :("   ; exit
            ;;
			* ) echo "Invalid Choice"
		esac
	done
else
    mkdir $databaseName
    cd -
    cd create
# eli fo2 da law kolo true
 
  if [[ $? -eq 0 ]] 
  then
    echo "Database Created Successfully :)"
  else
    echo "Error Creating Database $databaseName Please try again!"
  fi
fi

