#!/bin/bash

# setup File 

# 1-  handle main base dir


## 2- add path -> handle env vals

## Keep on reading commands from user ->

### excute commands 

baseDir=''
#PATH=$PATH:$baseDir/create:$baseDir/validate:

PATH="$baseDir:$baseDir/connect:$baseDir/create:$baseDir/databases:$baseDir/validate:$PATH"
echo $PATH