# Models and ActiveRecords

ActiveRecords and ActiveRelations are powerful tools for working with databases inside your Ruby on Rails Projects.

## ActiveRecord
- Common Design patterns for working with relational databases
- Retrieve and manipulate data as objects, not as static rows
- they understand structure of the table
- know how to create, read, update & delete rows
- data validation & error handling.
- can be manipulated & saved with few simple commands.

### ActiveRecord Example

```
user = User.new
user.first_name = "Sai"
user.save # INSERT

user.last_name = "Marlakunta"
user.save # SQL UPDATE

user.destroy # SQL DELETE (ActiveRecord will write a delete statement to delete the row from the table.)
```

- The built-in code does the heavy lifting for us.

## ActiveRelation
- Known as "Arel" works with ActiveRecord.
- It is an object-oriented representation of relational algebra.
- Simplifies the generation of complex database queries.
- Small Queries are chainable.
- Complex joins and aggregations use efficient SQL.

### ActiveRelation Example

```
users = User.where(first_name: "Kevin")
users = users.order("last_name ASC").limit(5)

# up until this point query will not be executed.
users.each {|user|..}
```