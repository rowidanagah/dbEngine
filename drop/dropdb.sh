echo "Enter the name of database you want to delete "
read databaseName

#   cd ..
cd data
if [[ -d "$databaseName" ]]
then
  
	rm -r -i $databaseName
	
	if [[ ! -d "$databaseName" ]]
	then
    	echo "Deleted!"
		cd ../drop
	fi

else
	cd ../drop
	echo "There is no Database with that name!"
    options=("enter again name of Database" "Exit")
	select val in "${options[@]}"
	do
		case $val in
             "enter again name of Database")
            echo $PWD ; . dropdb.sh ; clear ; break
            ;;
             "Exit")
            echo "Goodbye :(" ; exit
            ;;
			* ) echo "Invalid choice"
		esac
	done
fi