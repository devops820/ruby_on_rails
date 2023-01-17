```
ubuntu@ip-172-31-18-68:~/rails/task_manager$ rails db:migrate
== 20230114054521 DoNothingYet: migrating =====================================
== 20230114054521 DoNothingYet: migrated (0.0000s) ============================

== 20230114055102 CreateTasks: migrating ======================================
-- create_table(:tasks)
   -> 0.0299s
== 20230114055102 CreateTasks: migrated (0.0300s) =============================

ubuntu@ip-172-31-18-68:~/rails/task_manager/config$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 28
Server version: 8.0.31-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------------+
| Database                 |
+--------------------------+
| information_schema       |
| mysql                    |
| performance_schema       |
| sys                      |
| task_manager_development |
| task_manager_test        |
+--------------------------+
6 rows in set (0.00 sec)

mysql> use task_manager_development
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+------------------------------------+
| Tables_in_task_manager_development |
+------------------------------------+
| ar_internal_metadata               |
| schema_migrations                  |
| tasks                              |
+------------------------------------+
3 rows in set (0.01 sec)

mysql> select * from tasks;
Empty set (0.00 sec)

mysql> show fields from tasks;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | bigint       | NO   | PRI | NULL    | auto_increment |
| name        | varchar(255) | YES  |     | NULL    |                |
| description | text         | YES  |     | NULL    |                |
| position    | int          | YES  |     | NULL    |                |
| completed   | tinyint(1)   | YES  |     | NULL    |                |
| created_at  | datetime(6)  | NO   |     | NULL    |                |
| updated_at  | datetime(6)  | NO   |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
7 rows in set (0.00 sec)

mysql> select * from schema_migrations;
+----------------+
| version        |
+----------------+
| 20230114054521 |
| 20230114055102 |
+----------------+
2 rows in set (0.00 sec)

mysql> 20230114055102^C
mysql> 20230114054521^C
mysql> exit
Bye
ubuntu@ip-172-31-18-68:~/rails/task_manager/config$ cd ..
ubuntu@ip-172-31-18-68:~/rails/task_manager$ rails db:migrate:status

database: task_manager_development

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20230114054521  Do nothing yet
   up     20230114055102  Create tasks

ubuntu@ip-172-31-18-68:~/rails/task_manager$ rails db:migrate VERSION=0
== 20230114055102 CreateTasks: reverting ======================================
-- drop_table(:tasks)
   -> 0.0186s
== 20230114055102 CreateTasks: reverted (0.0293s) =============================

== 20230114054521 DoNothingYet: reverting =====================================
== 20230114054521 DoNothingYet: reverted (0.0000s) ============================

ubuntu@ip-172-31-18-68:~/rails/task_manager$ rails db:migrate:status

database: task_manager_development

 Status   Migration ID    Migration Name
--------------------------------------------------
  down    20230114054521  Do nothing yet
  down    20230114055102  Create tasks

ubuntu@ip-172-31-18-68:~/rails/task_manager$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 34
Server version: 8.0.31-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> select * from^C
mysql> show database;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'database' at line 1
mysql> show databases;
+--------------------------+
| Database                 |
+--------------------------+
| information_schema       |
| mysql                    |
| performance_schema       |
| sys                      |
| task_manager_development |
| task_manager_test        |
+--------------------------+
6 rows in set (0.00 sec)

mysql> use task_manager_development;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+------------------------------------+
| Tables_in_task_manager_development |
+------------------------------------+
| ar_internal_metadata               |
| schema_migrations                  |
+------------------------------------+
2 rows in set (0.00 sec)

mysql> select * from schema_migrations;
Empty set (0.00 sec)

mysql> 



ubuntu@ip-172-31-18-68:~/rails/task_manager$ rails db:migrate VERSION=0
== 20230114055102 CreateTasks: reverting ======================================
-- drop_table(:tasks)
   -> 0.0163s
== 20230114055102 CreateTasks: reverted (0.0248s) =============================

== 20230114054521 DoNothingYet: reverting =====================================
== 20230114054521 DoNothingYet: reverted (0.0000s) ============================

ubuntu@ip-172-31-18-68:~/rails/task_manager$ rails db:migrate:status

database: task_manager_development

 Status   Migration ID    Migration Name
--------------------------------------------------
  down    20230114054521  Do nothing yet
  down    20230114055102  Create tasks

ubuntu@ip-172-31-18-68:~/rails/task_manager$ ls -ltr db
total 12
-rw-rw-r-- 1 ubuntu ubuntu  374 Jan 10 15:53 seeds.rb
drwxrwxr-x 2 ubuntu ubuntu 4096 Jan 14 05:51 migrate
-rw-rw-r-- 1 ubuntu ubuntu  762 Jan 14 06:33 schema.rb
ubuntu@ip-172-31-18-68:~/rails/task_manager$ rails db:migrate VERSION=20230114054521
== 20230114054521 DoNothingYet: migrating =====================================
== 20230114054521 DoNothingYet: migrated (0.0000s) ============================

ubuntu@ip-172-31-18-68:~/rails/task_manager$ rails db:migrate:status

database: task_manager_development

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20230114054521  Do nothing yet
  down    20230114055102  Create tasks

ubuntu@ip-172-31-18-68:~/rails/task_manager$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 52
Server version: 8.0.31-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------------+
| Database                 |
+--------------------------+
| information_schema       |
| mysql                    |
| performance_schema       |
| sys                      |
| task_manager_development |
| task_manager_test        |
+--------------------------+
6 rows in set (0.00 sec)

mysql> use task_manager_test;
Database changed
mysql> show tables;
Empty set (0.00 sec)

mysql> exit
Bye
ubuntu@ip-172-31-18-68:~/rails/task_manager$ 


ubuntu@ip-172-31-18-68:~/rails/task_manager$ rails db:migrate:status

database: task_manager_development

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20230114054521  Do nothing yet
  down    20230114055102  Create tasks

ubuntu@ip-172-31-18-68:~/rails/task_manager$ rails db:migrate
== 20230114055102 CreateTasks: migrating ======================================
-- create_table(:tasks)
   -> 0.0363s
== 20230114055102 CreateTasks: migrated (0.0364s) =============================

ubuntu@ip-172-31-18-68:~/rails/task_manager$ rails db:migrate:status

database: task_manager_development

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20230114054521  Do nothing yet
   up     20230114055102  Create tasks

ubuntu@ip-172-31-18-68:~/rails/task_manager$ 

```

