
echo "Enter the name of database "
read databaseName

# if [  $databaseName == "back" ]
# then
# 	clear 
# 	. select.sh
# fi
# if [ "$databaseName" = "" ] || [ "${databaseName//[!0-9]}" != "" ] || [[ $databaseName =~ ['!@#$%^&*()_+'] ]]
# then
cd ..
cd data
if [[ -d "$databaseName" ]]
then
  clear;
    echo "duplicated database name, you should write another name!"
    cd ../create
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

  if [ "$databaseName" = "" ] || [ "${databaseName//[!0-9]}" != "" ] || [[ $databaseName =~ ['!@#$%^&*()_+'] ]]
  then
  clear;
  echo "please enter a valid name"

  cd ../create
  . createdb.sh 
  else
   mkdir $databaseName
   echo "Database Created Successfully :)"
    cd ../create
   fi

# eli fo2 da law kolo true
fi

