# Getting Started with SQL

### Install postgres : 
-brew install postgres

-Heed the post-install notes. There may be something like: 
  "To have launchd start postgresql at login:"
  <blockquote>
        ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
  </blockquote>

-Then to load postgresql now:
  <blockquote>
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
  </blockquote>
  
But most importantly, you should run : 

<blockquote>
 postgres -D /usr/local/var/postgres
</blockquote>

Running brew info postgres can help you see what your options are after the setup screens are gone. 

### If your postgres connection ever dies or goes bad, you can restart postgres with this command: 
<blockquote>
  pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
</blockquote>


Now Postgres should be running.  
You can check to see whether or not psql is running by looking at all system processes related to postgres: 
<blockquote>
        ps aux | grep postgres
</blockquote>

- nmuta           34650   0.0  0.0  2463676   3260 s003  S+    7:37AM   0:00.01 psql postgres
- nmuta           30961   0.0  0.0  2455484   3276 s002  S+    6:26AM   0:00.01 psql postgres
- nmuta           35738   0.0  0.0  2432772    652 s004  S+    8:38AM   0:00.00 grep --color=auto psql

notice that the last matching "process" is actually the search we just did, so ruling that one out, we have two matching processes.  

Every once in a while, you may get this error is there are version mismatches: 
http://blog.10ninox.com/2015/01/psql-database-incompatible/


To get into the psql terminal as the default user, type: 
<blockquote>
      psql postgres 
</blockquote>

You should now see a command prompt.: 
<blockquote>
        postgres=# 
</blockquote>

In the terminal now, we can see the defaults that ship with postgres, but we don't have any user created databases yet. 

### list databases: 
<blockquote>
  \l
</blockquote>
(backslash and then the letter “l” as in lemon)

Use the above command to list the current databases. 

Now , create a new database with the command below: 

### create database: 
<blockquote>
  CREATE DATABASE mydatabase; 
</blockquote>

Now list your databases again, and you should see the database that you created. 

Once we've created a database, even if its empty, we have to "connect" to it in order to do queries: 

### connect to a database: 
\c mydatabase 


Even though we don't want to drop the database yet, later we can drop it with this command: 
### drop database:
DROP DATABASE demodb1;


## Importing a Database

To exit the postgres cli ( command line interface) , do
\q

We can import a database from the standard bash window. 

Navigate to where world.sql is stored ( it should be in the repo you cloned). 

### import a database (OUTSIDE of the psql command prompt, from terminal ) : 
<blockquote>
  psql mydatabase < world.sql
</blockquote>

OR 
psql mydatabase < ~/path/to/file/world.sql  ( if you're in a different directory) . 

### dump (export) a database: (outside of the psql command prompt, from terminal ) :
Although we will not be using it now, we can also dump from the terminal:
pg_dump mydatabase > new_file_name.sql


Ok, so now we can go back into the terminal and view our data. 
<blockquote>
        psql postgres
</blockquote>


### connect to the database we want: 
<blockquote>
    \c world
</blockquote>

### describe tables:
<blockquote>
    \dt 
</blockquote>

### describe one table:
<blockquote>
    \d country
</blockquote>

### alter a table:
ALTER TABLE foo ADD COLUMN id;

### alter a table with an auto-incrementing column 
ALTER TABLE foo ADD COLUMN id SERIAL;


Now , we are ready to start doing some queries. 
All of these queries can be run in the psql cli. 
However, the cli is not a great tool when it comes to viewing large tables or large amounts of data. 

To do this, we can install a gui tool. For this lesson, we will use PGCommander. 
PGCommander is useful because not only is it cleaner than using the psql cli, it allows you to export and save queries. 
We will use PGCommander for you to email saved queries to the instructor. 
<br>

Here are some ways that we can do CRUD in SQL : 

##QUERIES: 

###Insert
<blockquote>
  INSERT into tbl values('fred', 'scott', 'denver', 'colorado'); 
</blockquote>
<blockquote>
  INSERT into tbl ('name', 'city') values ('fred', 'denver');
</blockquote>

##Select
<blockquote>
  SELECT * from tbl; 
</blockquote>
<blockquote>
SELECT * from tbl WHERE column_name  = ‘desired_value’ ; 
</blockquote>
<blockquote>
SELECT name from tbl where weight = (select max(weight) from tbl)
</blockquote>
<blockquote>
SELECT name from products where price > 5.00 
</blockquote>


##Update
<blockquote>
  UPDATE televisions SET cost=5000, discount='20' WHERE id=25;
</blockquote>

##Delete
<blockquote>
  DELETE from country WHERE code='SSD' ; 
</blockquote>

##JOIN
<blockquote>
  SELECT customer.name from customers INNER JOIN purchases ON purchases.customer_id = customer.id
</blockquote>
<blockquote>
SELECT customer.tag as customer_tag, purchase.tag as purchase_tag from customers INNER JOIN purchases ON purchases.customer_id = customer.id
</blockquote>
More info on joins can be found in Unit02
<blockquote>
- CREATING A NEW TABLE 
CREATE TABLE Persons
(
PersonID int,
LastName varchar(255),
FirstName varchar(255),
Address varchar(255),
City varchar(255)
);
</blockquote>




### fyi: a list of data types in postgres:
http://www.postgresql.org/docs/9.1/static/datatype.html



### South Sudan data:
'SSD', 'South Sudan', 'Africa', 'Eastern Africa', 193, 2014, 193000, 72, 5796, 400, 'South Sudan', 'Federal Presidential Republic', 'Salva Kiir Mayardit', 4075, 'SS';

 


##EXERCISES: 

PLEASE LOCALLY SAVE all of your queries after inserting them. 

Since this data was created, a new country, South Sudan, is now part of the global map.  Using the above "South Sudan data", 
add South Sudan to the list of countries. 

Insert a new country called "Atlantis", using modified South Sudan data. Make the country code "ATL" , and an  independence date of 1

Update Atlantis after you create it changing the to "ATS" and changing the independence date to 2015

Select all countries who have more than 156 million people

Select the country wtih the highest gross national product 

Select all of the countries and their capitals in one query 

Going back to your Mongo associations assignment, create some tables and then do a join to join one or more tables. 

When you have finished doing the join query, export that query and then email me the query 

Delete Atlantis from the country table



----------------
CREATE TABLE drivers ( id  int,  name varchar(255), motorcycle_id int );

CREATE TABLE motorcycles ( id int, name varchar(255),  garage_id int,  driver_id int);

CREATE TABLE garage ( id int, name varchar(255), zone_id int);

CREATE TABLE zone ( id int, name varchar(255) );

-----------
optional : 

COPY drivers FROM '/Users/nmuta/Documents/drivers.csv' DELIMITER ',' CSV;





