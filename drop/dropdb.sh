echo "Enter the name of database you want to delete "
read databaseName
# if [  $databaseName == "back"  ]
# then
# 	clear 
# 	. select.sh
# fi
  cd ..
cd data
if [[ -d "$databaseName" ]]
then
  
	rm -r $databaseName
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
            clear ; . dropdb.sh ; clear ; break
            ;;
			#  "Back to MENU")
            # clear ; . select.sh ; clear ; break
            # ;;
             "Exit")
            echo "Goodbye :(" ; exit
            ;;
			* ) echo "Invalid choice"
		esac
	done
fi