#!/bin/bash

# setup File 

# 1-  handle main base dir


## 2- add path -> handle env vals

## Keep on reading commands from user ->

### excute commands 

base="$PWD"
PATH="$base:$base/connect:$base/create:$base/helpers:$PATH"


echo $PATH


while true
do
	query=()

	read -p  "shql@ > " cmd
	$cmd
	
    
done


