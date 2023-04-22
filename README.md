# Database-management system (DBMS)

Database management system (DBMS) using Bash-Script A simple queries to handel Database Management System using bash shell scripting that handles CRUD operations.

# Getting started

How to interact with our database query engine .

## Setup

1- get the repo on your machine 
  - _clone our repo_

  ``` shell
  git clone git@github.com:Rowida46/dbEngine.git
  
  ```

  - or download the source code.
  
  2- add the folder of the source code to your environment variable path on your `~/.bashrc` 
  
  - To open your _bashrc+ file
  
  ``` shell
  vi ~/.bashrc
  ```
  or
  
  ``` sh
  code ~/.bashrc
  ```
  - and then append the folder dir to your path  environment variables
  
  ``` sh
  base=[project directory or path on your machine]
  PATH="$base:$base/create:$base/connect:$base/drop:$base/list:$base/select:$base/update:$base/insert:$PATH"
  ```

# Features and How to Excute 

- Create DB `create database` and then enter database name
- Connect DB ` connect database_name`.
- Drop DB `drop database_name`
- List All DB `list databases`
- Create Table `create table table_name`
- Insert into Table `insert into table_name`
- Select from Table `select all from table_name`
- Update Table  `update table table_name`
- List All Tables for the current connected database `list tables`
- Delete from Table `drop tables table_name`
- Drop Table `drop table_name`

# Create Database 
``` shell
create database database_name

```
After executing create database command a folder in your path directory will be created.

# Connect Database
``` shell
connect database_name
```

> On connecting to a non-existent database, you will get this error message.
``` sh
it doesn't exist!
```

### Connecting to a Database Is Required to do the following :
- Create Table
- List Tables
- Insert into Table
- Select From Table
- Update Table
- Drop Table


# Create Table 
You must enter the number of columns, spesify column name for each column as well as  column data type ,by default the first column will be the Primay Key(PK) with data type as _int_.
to create a new table, you need to first connect to a database
```  sh
create table table_name
```

> error massage for not connecting to database
``` shell
you need to connect to a database first

``` 

# Insert Into Table 
``` sh
insert into table_name
```
- After executing the previous command you will get the table's columns' name.
- You must enter data for all columns with a valid data as well as a matched  data type for eac column.


## Select From Table

``` sh
select all from table_name
```

# Update Table

``` sh
update table table_name
```
- After executing the previous command you will get the table's columns' name along with its data types
- You'll be asked about the number of pk ,row number , of the  record that you need to change its data.
- And then you'll be asked about the column name and the value tha you need to change.
- The new Updated value must be a valid data and with a mutched data type for the spesified column.
> Error massage for a not valid data type 

``` shell
not a valid column type
```

# Demo With All Validation

[BashProject.webm](https://user-images.githubusercontent.com/52299389/217188332-0bb35a77-6d94-47f1-8567-fa8ebbfb7b45.webm)

