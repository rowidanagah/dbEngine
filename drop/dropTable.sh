echo "Enter the table you want to delete or type (back) to go back to MENU: "
read table
if [  $table == "back" ]
then
	clear 
	. select2.sh
fi
if [[ -f "$table" ]]
then
	rm -i $table
	if [[ ! -f $table ]]
	then
    	echo "Deleted!"
	fi
else
	val1="Re-enter name of table"
	val2="Back to MENU"
	echo "There is no table with this name!"
	select val in "$val1" "$val2"
	do
		case $val in
			$val1 ) clear ; . dropTB.sh ; clear ; break;;
			$val2 ) clear ; . select2.sh ; clear ; break;;
			* ) echo "Invalid choice"
		esac
	done
fi
