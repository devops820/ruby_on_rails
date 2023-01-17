# Relational Database Associations

- We have a one-to-one relationship between 2 tables.
- one-to-many relationship
- many-to-many replationship

## Associations

- Create relationship in database
- Define relationship in models, both sides
- Use relationship

### Steps

```
rails generate model Category name:string
rails generate migration AddCategoryIdToTasks
rails db:migrate

20230116084338_add_category_id_to_tasks.rb
class AddCategoryIdToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column(:tasks, :category_id, :integer, index:true)
  end
end



task.rb
class Task < ApplicationRecord

  belongs_to :category, optional: true

end

category.rb

class Category < ApplicationRecord

    has_many :tasks

end
```


## Practice relationships

```
irb(main):001:0> 
irb(main):002:0> 
irb(main):003:0> category = Category.create(name: 'Weekly')
  TRANSACTION (0.2ms)  BEGIN
  Category Create (0.4ms)  INSERT INTO `categories` (`name`, `created_at`, `updated_at`) VALUES ('Weekly', '2023-01-16 08:55:50.767443', '2023-01-16 08:55:50.767443')                                                                            
  TRANSACTION (5.8ms)  COMMIT                                                  
=>                                                                             
#<Category:0x000055da6586cbe0                                                  
...                                                                            
irb(main):004:0> category
=> 
#<Category:0x000055da6586cbe0                                                  
 id: 1,                                                                        
 name: "Weekly",                                                               
 created_at: Mon, 16 Jan 2023 08:55:50.767443000 UTC +00:00,                   
 updated_at: Mon, 16 Jan 2023 08:55:50.767443000 UTC +00:00>                   
irb(main):005:0> category.tasks
  Task Load (0.3ms)  SELECT `tasks`.* FROM `tasks` WHERE `tasks`.`category_id` = 1
=> []                                                               
irb(main):006:0> task1 = Task.find(1)
  Task Load (0.3ms)  SELECT `tasks`.* FROM `tasks` WHERE `tasks`.`id` = 1 LIMIT 1
=>                                                                      
#<Task:0x000055da655f7e00                                               
...                                                                     
irb(main):007:0> task2 = Task.find(2)
  Task Load (0.5ms)  SELECT `tasks`.* FROM `tasks` WHERE `tasks`.`id` = 2 LIMIT 1
=>                                                                      
#<Task:0x000055da655373a8                                               
...                                                                     
irb(main):008:0> category.tasks << task1
  TRANSACTION (0.3ms)  BEGIN
  Task Update (0.5ms)  UPDATE `tasks` SET `tasks`.`updated_at` = '2023-01-16 08:57:59.918337', `tasks`.`category_id` = 1 WHERE `tasks`.`id` = 1
  TRANSACTION (4.9ms)  COMMIT                                           
=>                                                                      
[#<Task:0x000055da655f7e00                                              
  id: 1,                                                                
  name: "Fold the laundry",                                             
  description: "Fold the Laundry and put it in drawers",                
  position: 1,                                                          
  completed: false,                                                     
  created_at: Sat, 14 Jan 2023 16:41:08.291258000 UTC +00:00,       
  updated_at: Mon, 16 Jan 2023 08:57:59.918337000 UTC +00:00,       
  category_id: 1>]                                                  
irb(main):009:0> category.tasks << task2
  TRANSACTION (0.2ms)  BEGIN
  Task Update (0.4ms)  UPDATE `tasks` SET `tasks`.`updated_at` = '2023-01-16 08:59:03.735208', `tasks`.`category_id` = 1 WHERE `tasks`.`id` = 2
  TRANSACTION (4.4ms)  COMMIT
=> 
[#<Task:0x000055da655f7e00
  id: 1,
  name: "Fold the laundry",
  description: "Fold the Laundry and put it in drawers",
  position: 1,
  completed: false,
  created_at: Sat, 14 Jan 2023 16:41:08.291258000 UTC +00:00,
  updated_at: Mon, 16 Jan 2023 08:57:59.918337000 UTC +00:00,
  category_id: 1>,
 #<Task:0x000055da655373a8
  id: 2,
  name: "Sweep the porch",
  description: nil,
  position: 2,
  completed: false,
  created_at: Sat, 14 Jan 2023 16:43:34.354346000 UTC +00:00,
  updated_at: Mon, 16 Jan 2023 08:59:03.735208000 UTC +00:00,
  category_id: 1>]
irb(main):010:0> category.tasks.count
  Task Count (0.4ms)  SELECT COUNT(*) FROM `tasks` WHERE `tasks`.`category_id` = 1
=> 2                                                                                     
irb(main):011:0> 
irb(main):012:0> category.tasks.delete(task2)
  TRANSACTION (0.3ms)  BEGIN
  Task Update All (0.5ms)  UPDATE `tasks` SET `tasks`.`category_id` = NULL WHERE `tasks`.`category_id` = 1 AND `tasks`.`id` = 2
  TRANSACTION (4.9ms)  COMMIT                                                            
=>                                                                                       
[#<Task:0x000055da655373a8                                                               
  id: 2,                                                                                 
  name: "Sweep the porch",                                                               
  description: nil,                                                                      
  position: 2,                                                                           
  completed: false,                                                                      
  created_at: Sat, 14 Jan 2023 16:43:34.354346000 UTC +00:00,                            
  updated_at: Mon, 16 Jan 2023 08:59:03.735208000 UTC +00:00,                            
  category_id: 1>]                                                                       
irb(main):013:0> category.tasks.count
  Task Count (0.5ms)  SELECT COUNT(*) FROM `tasks` WHERE `tasks`.`category_id` = 1
=> 1                                                                                     
irb(main):014:0> category.tasks
=> 
[#<Task:0x000055da655f7e00                                                               
  id: 1,                                                                                 
  name: "Fold the laundry",                                                              
  description: "Fold the Laundry and put it in drawers",                                 
  position: 1,                                                                           
  completed: false,                                                                      
  created_at: Sat, 14 Jan 2023 16:41:08.291258000 UTC +00:00,                            
  updated_at: Mon, 16 Jan 2023 08:57:59.918337000 UTC +00:00,                            
  category_id: 1>]                                                                       
irb(main):015:0> category.tasks.empty?
=> false
irb(main):016:0> category.tasks.first
=> 
#<Task:0x000055da655f7e00                                                                
 id: 1,                                                                                  
 name: "Fold the laundry",                                                               
 description: "Fold the Laundry and put it in drawers",                                  
 position: 1,                                                                            
 completed: false,                                                                       
 created_at: Sat, 14 Jan 2023 16:41:08.291258000 UTC +00:00,                             
 updated_at: Mon, 16 Jan 2023 08:57:59.918337000 UTC +00:00,                             
 category_id: 1>                                                                         
irb(main):017:0> 
irb(main):018:0> task1.category
=> 
#<Category:0x000055da6586cbe0                                                            
 id: 1,                                                                                  
 name: "Weekly",                                                 
 created_at: Mon, 16 Jan 2023 08:55:50.767443000 UTC +00:00,     
 updated_at: Mon, 16 Jan 2023 08:55:50.767443000 UTC +00:00>     
irb(main):019:0> task1.category.name
=> "Weekly"
irb(main):020:0> 
                                                                                         
                                                                                         
```