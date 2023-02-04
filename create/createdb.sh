
echo "Enter the name of database "
read databaseName

cd ..
echo $PWD

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
  cd ../create
  echo "please enter a valid name"
  select val in "please try again and enter a valid database name" "Exit"
  do
  case $val in
  "please try again and enter a valid database name")
            clear ; . createdb.sh      ; break
            ;;
  "Exit")
  exit;;
  esac
  done

  # cd ../create
  # . createdb.sh 
  else
   mkdir $databaseName
   echo "Database Created Successfully :)"
    # cd ../create
   fi


fi

