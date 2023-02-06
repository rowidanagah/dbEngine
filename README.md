# Data Base Engine


# Getting started

How to interact with our database query engine .

## Setup

1- get the repo on your machine 
  - _clone our repo_

  ```sh
  git clone git@github.com:Rowida46/dbEngine.git
  ```

  - or download the source code.
  
  2- add the folder of the source code to your environment variable path on your `~/.bashrc` 
  
  - To open your _bashrc+ file
  
  ```sh
  vi ~/.bashrc
  ```
  or
  
  ```sh
  code ~/.bashrc
  ```
  - and then append the folder dir to your path  environment variables
  
  ```sh
  base=[project directory or path on your machine]
  PATH="$base:$base/create:$base/connect:$base/drop:$base/list:$base/select:$base/update:$base/insert:$PATH"
  ```

