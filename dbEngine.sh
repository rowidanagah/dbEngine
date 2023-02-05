#!/bin/bash

# setup File 

# 1-  handle main base dir


## 2- add path -> handle env vals

## Keep on reading commands from user ->

### excute commands 

base="$PWD"

PATH="$base:$base/connect:$PATH"


# echo $PATH


while true
do
	read -p "dbEngine > " cmd
	cmd=". $cmd" ## ecxcute source  . s1.sh
	$cmd	
done

