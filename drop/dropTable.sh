#!/bin/bash
cd ..
echo "Enter the name of table "
read table
table_file=$PWD/data/tmp/$table 

echo $table_file
	if  [[ -f $table_file ]]
	then
		echo "----------------------$table Table----------------------"
		table_file=$PWD/data/tmp/$table 

		cat $table_file
		echo ""
		e cho "------------------------------------------"
		val1="Select specific record"
		select val in  "$val1" 
		do
			case $val in
				$val1 ) 
					cd drop/; echo $PWD; 
					deleterecord;
					 break;;
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
               if [  `awk -F ":" '{NF=1; print $1}' $table_file | grep "$id" ` ]
                then 
                 row=`awk 'BEGIN{FS=":"}{if ($1=="'$id'") print NR}' $table_file`
                 `sed -i ''$row'd' $table_file`
                    echo "Record is deleted successfully"

                else 
                   echo "This id doesn't exist"
                fi   
		fi
}