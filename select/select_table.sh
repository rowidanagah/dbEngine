#!/bin/bash
cd ..

table=$PWD/data/tmp/testHeaders

function Select_all(){

	NR=$(awk -F : 'END{print NR}' $1)
	echo $NR

	tail -n$NR $1 >> select.txt

	column -t -s ':' select.txt  > output.txt  

	cat output.txt

	rm select.txt output.txt
}
function getColsumbers(){
	ColsNumber=$(awk -F : 'NR==1{print $2}' $1)
	echo $ColsNumber
}

function getColsNameAndTypes(){
	colHeaders=($(awk -F : 'NR!=1{print $1}' $1))
	colType=($(awk -F : '{print $3}' $1))
	echo "header (${colHeaders[@]})"
	echo ${colType[1]}
	
}


meta=$PWD/data/tmp/metaData/rowida
Select_all $meta

getColsumbers $meta

getColsNameAndTypes $meta