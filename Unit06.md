### Writing Queries against a simple database

Inside of this repo, there is a database called *marketplace.sql*

Take a minute, inside of your code editor, to look at the marketplace.sql file.  A good amount of the file reads like English.

Read through the file. What does it look like this file is for ? What is it doing ?

This file is called a "database dump". It was exported from a database.

One of the great things about psql (and SQL in general) is that its very easy to import database dumps.

First, in your terminal (not the postgres CLI, just your normal terminal), create the database that we will import this data into:

```
createdb marketplace

```

then, import the dump into that database:


```
psql marketplace < marketplace.sql

```
remember that you must be in the directory where the marketplace.sql file resides in order for this command to work.  Otherwise, you would have to put the full path to the marketplace.sql file in the last part of the statement above. 
