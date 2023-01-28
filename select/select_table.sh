#!/bin/bash
cd ..

table=$PWD/data/tmp/testHeaders

function Select_all(){

	NR=$(awk -F : 'END{print NR}' $1)

	tail -n$NR $1 >> select.txt

	column -t -s ':' select.txt  > output.txt  

	cat output.txt

	rm select.txt output.txt
}

Select_all $table

