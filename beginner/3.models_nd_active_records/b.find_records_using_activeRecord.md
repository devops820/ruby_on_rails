# Find Records using ActiveRecord

## Conditions (For Group of records) - returns an array of matching objects

- `Task.where(completed: false)`
- `Task.where("completed = 0 AND position < 10")`
- `User.where("first_name LIKE #{@query}")` # Never use an interpolated string in a query !
- `User.where(["first_name LIKE ?", @query])` # Rails will sanitize the value before it inserts 

## Using first to return single object

- `Task.where(visible: true).first` # nil if the array is empty
- `Task.find_by(visible: true)` # returning the first object that matches the condition

## Order, Limit and offset

- `Task.order('position ASC')`
- `Task.limit(20)`
- `Task.offset(100)` # skips over the first 100 records or skips over the first 10 records if offset(10)



```
ubuntu@ip-172-31-18-68:~/rails/task_manager$ rails console -e development
Loading development environment (Rails 7.0.4)
irb(main):001:0> 
irb(main):002:0> 
irb(main):003:0> 
irb(main):004:0> 
irb(main):005:0> 
irb(main):006:0> task=Task.find(2)
  Task Load (0.3ms)  SELECT `tasks`.* FROM `tasks` WHERE `tasks`.`id` = 2 LIMIT 1
=>                                                                   
#<Task:0x0000556b85619ea0                                            
...                                                                  
irb(main):007:0> task
=> 
#<Task:0x0000556b85619ea0                                            
 id: 2,                                                              
 name: "Sweep the porch",                                            
 description: nil,                                                   
 position: 2,                                                        
 completed: false,                                                   
 created_at: Sat, 14 Jan 2023 16:43:34.354346000 UTC +00:00,         
 updated_at: Sat, 14 Jan 2023 16:43:34.354346000 UTC +00:00>         
irb(main):008:0> tasks = Task.where(completed: false)
  Task Load (0.5ms)  SELECT `tasks`.* FROM `tasks` WHERE `tasks`.`completed` = FALSE
=>                                                                      
[#<Task:0x0000556b85970fe0                                              
...                                                                     
irb(main):009:0> tasks.count
  Task Count (0.5ms)  SELECT COUNT(*) FROM `tasks` WHERE `tasks`.`completed` = FALSE
=> 3                                                                    
irb(main):010:0> tasks
=> 
[#<Task:0x0000556b85970fe0                                              
  id: 1,                                                                
  name: "Fold the laundry",                                             
  description: "Fold the Laundry and put it in drawers",                
  position: 1,                                                          
  completed: false,                                                     
  created_at: Sat, 14 Jan 2023 16:41:08.291258000 UTC +00:00,
  updated_at: Sat, 14 Jan 2023 16:50:24.778384000 UTC +00:00>,
 #<Task:0x0000556b85970f18                               
  id: 2,                                                 
  name: "Sweep the porch",                               
  description: nil,        
  position: 2,             
  completed: false,        
  created_at: Sat, 14 Jan 2023 16:43:34.354346000 UTC +00:00,
  updated_at: Sat, 14 Jan 2023 16:43:34.354346000 UTC +00:00>,
 #<Task:0x0000556b85970e50
  id: 3,
  name: "Buy Vegetables",
  description: "Go to Medhahalli Market",
  position: 3,
  completed: false,
  created_at: Sat, 14 Jan 2023 16:44:11.639888000 UTC +00:00,
  updated_at: Sat, 14 Jan 2023 16:52:14.373327000 UTC +00:00>]
irb(main):011:0> tasks = Task.where('completed = 0 AND position < 3')
  Task Load (0.5ms)  SELECT `tasks`.* FROM `tasks` WHERE (completed = 0 AND position < 3)
=>                                                                                     
[#<Task:0x0000556b856a02e8                                                             
...                                                                                    
irb(main):012:0> tasks.count
  Task Count (0.5ms)  SELECT COUNT(*) FROM `tasks` WHERE (completed = 0 AND position < 3)
=> 2                                                                                   
irb(main):013:0> 
irb(main):014:0> tasks = Task.where(['name LIKE ?', '%porch%'])
  Task Load (0.4ms)  SELECT `tasks`.* FROM `tasks` WHERE (name LIKE '%porch%')
=>                                                                                     
[#<Task:0x0000556b85a083e0                                                             
...                                                                                    
irb(main):015:0> tasks.count
  Task Count (0.4ms)  SELECT COUNT(*) FROM `tasks` WHERE (name LIKE '%porch%')
=> 1        




irb(main):002:0> tasks = Task.where(["name like ?","%porch%"])
  Task Load (0.4ms)  SELECT `tasks`.* FROM `tasks` WHERE (name like '%porch%')
=>                                                                      
[#<Task:0x00007f4db484c660                                              
...                                                                     
irb(main):003:0> tasks.count
  Task Count (0.5ms)  SELECT COUNT(*) FROM `tasks` WHERE (name like '%porch%')
=> 1                                                                    
irb(main):004:0> tasks.first
=> 
#<Task:0x00007f4db484c660                                               
 id: 2,                                                                 
 name: "Sweep the porch",                                               
 description: nil,                                                      
 position: 2,                                                           
 completed: false,                                                      
 created_at: Sat, 14 Jan 2023 16:43:34.354346000 UTC +00:00,
 updated_at: Sat, 14 Jan 2023 16:43:34.354346000 UTC +00:00>
irb(main):005:0> 




```