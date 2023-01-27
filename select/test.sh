#!/bin/bash
cd ..

#numberofRecords=awk -F : '{print $#}' $table


headers=$PWD/data/tmp/metaData/employees
table=$PWD/data/tmp/employees

#sed "1d" $metaFile | awk -F: '{print $1}' 

#awk -F : '{print $1 }' $table #first record

NR=$(awk -F : 'END{print NR}' $table)

#head -n1 $headers > select.txt 

tail -n$NR $table >> select.txt

column -t -s ':' select.txt  > output.txt  

cat output.txt

echo "--------------------"
cat select.txt

rm select.txt output.txt

awk  '{
			print $0;
			if(NR==1){
				print "-------------------------------------------------------------------------------"
			}
		}' output.txt

