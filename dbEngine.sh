#!/bin/bash

# setup File 

# 1-  handle main base dir


## 2- add path -> handle env vals

## Keep on reading commands from user ->

### excute commands 

base="$HOME/bin/dbEngine"
PATH="$base:$base/connect:$base/create:$base/helpers:$PATH"


echo $PATH

PS="SHQL > "

while true
do
	query=()

	read -p  "shql@ > " cmd

	eval $(  create table tmpopoppoo )
    
done
