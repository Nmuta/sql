### Understanding Joins

Please feel free to reference the Venn diagrams in [Unit 2](/Unit02.md) to visualize what's happening with joins.


*The most important thing to know and remember about joins is that joins are specifically for getting information that is shared across one or more tables, characterized by a complex relationship between data*

Joins are NOT NEEDED when retrieving data from "one to many" relationship.

Example:  _A child has many toys_.  This is a one to many relationship.  A database query for this would simply be

```
select * from toys where child_id=5;

```

That's it.  That's a simple one to many relationship.  You would somehow first identified that the child_id needed for this toy retrieval is '5'.

The next step is just querying the database for all of the toys with a child_id of "5".   It's not a join, it's a simple query.

### "Ok, so when do we actually need joins, then? "

Let's say you have the following database tables:

#### Students

| id | firstname | lastname | city_id |
|----|-----------|----------|---------|
| 4  | Sam       | Olujare  |    8    |
| 6  | Emma      | Jackson  |    4    |
| 8  | Chris     | Samuels  |    6    |


#### Cities

| id | name        | state_id        |
|----|-----------  |-----------      |
| 4  | Denver      | 1               |
| 6  | Austin      | 2               |
| 8  | Phoenix     | 3               |

#### States

| id | name       |
|----|------------|
| 1  | Colorado   |
| 2  | Texas      |
| 3  | Arizona    |


*A JOIN TABLE* would be needed if you wanted to get each student's first and last name and the state they are from, because the state is not directly connected to the student.  That data is spread across 3 tables, and the links between these tables are connected through a network of primary and foreign keys that join all of that data together.  Here is the join query that would join all of that data:


*SELECT students.firstname, students.lastname, states.name join cities on students.city_id = cities.id join states on cities.state_id = states.id*

It may sound like a mouthful, but once you get the rhythm of joins, it's fairly intuitive.  See [Unit 3](Unit03.md) "The Building of a Query" to build up to doing joins by examining the syntax of joins by seeing how joins are just a natural progression of SELECT syntax with extra conditions added on top.
