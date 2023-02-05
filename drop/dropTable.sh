echo "Enter the name of table "
read table
	if  [[ -f "$table" ]]
	then
		echo "----------------------$table Table----------------------"
		cat $table
		echo ""
		echo "------------------------------------------"
		val1="Select specific record"
		select val in  "$val1" 
		do
			case $val in
				$val1 ) clear ; deleterecord         ; break;;
				* ) echo "Invalid choice"
			esac
		done
	else
		echo "There is no table with this name!"
		# val1="Re-enter name of table"
		# val2="Back to MENU"
		# select val in "$val1" "$val2"
		# do
		# 	case $val in
		# 		$val1 ) clear ; . selectTB.sh    ; clear ; break;;
		# 		$val2 ) clear ; . select2.sh ; clear ; break;;
		# 		* ) echo "Invalid choice"
		# 	esac
		# done
	fi

function deleterecord { 
	echo "Enter the ID of the record you want to delete "
	read id

		if ! [[ $id =~ ^[0-9]*$ ]]
		then
			echo "Invalid ID!"
			val1="Re-enter ID"
			select val in "$val1" "$val2"
			do
				case $val in
					$val1 ) clear ; deleterecord ; break;;
					* ) echo "Invalid choice"
				esac
			done
		else
               if [  `awk -F ":" '{NF=1; print $1}' $table | grep "$id" ` ]
                then 
                 row=`awk 'BEGIN{FS=":"}{if ($1=="'$id'") print NR}' $table`
                 `sed -i ''$row'd' $table`
                    echo "Record is deleted successfully"

                else 
                   echo "This id doesn't exist"
                fi   
		fi
}