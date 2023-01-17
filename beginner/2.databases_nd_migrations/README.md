# Migrations

Migrations are set of database instructions written in ruby.
Essentially they describe the database changes from one state to another.

## Benefits of Migrations
Keep db schema with app code.
Executable and repeatable.
Allow sharing of schema changes.
Allow writing ruby instead of SQL.
Able to access code in the Rails project.

## Generate a migration
- `rails generate migration MigrationName` (creates a migration file in db directory)
- `rails generate model ModelName columns` (creates a task model in our apps models directory & create a migration file in db directory)
- `rails db:migrate` (rails will execute the code in up or change method for any migrations that have not been executed before.)

```
== 20230114054521 DoNothingYet: migrating =====================================
== 20230114054521 DoNothingYet: migrated (0.0000s) ============================

== 20230114055102 CreateTasks: migrating ======================================
-- create_table(:tasks)
   -> 0.0299s
== 20230114055102 CreateTasks: migrated (0.0300s) =============================
```

- `show tables`
- `use <db>`
- `show fields from table1`
- `select * from schema_migrations;`
- `rails db:migrate:status` # shows the status
- `rails db:migrate VERSION=0` # any tables that will be created will be dropped
- `rails db:migrate VERSION=20230114055102` # up, until that timestamp
- `rails db:migrate or rake db:migrate` # are equivalent