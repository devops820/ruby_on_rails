# Create New Records using ActiveRecord

## New + Save
- Instantiate an object
- Set values on the instance
- Save the object

## Create
- Same as new + save, but all in one step.


```
ubuntu@ip-172-31-18-68:~/rails/task_manager$ rails console -e development
Loading development environment (Rails 7.0.4)                   
irb(main):002:0> task=Task.new
=> #<Task:0x00005562b1d51e70 id: nil, name: nil, description: nil, position: nil, completed: nil, created_at: nil, updated_at: nil>
irb(main):003:0> task.name='Fold Laundry'
=> "Fold Laundry"
irb(main):004:0> task.position=1
=> 1
irb(main):005:0> task
=> #<Task:0x00005562b1d51e70 id: nil, name: "Fold Laundry", description: nil, position: 1, completed: nil, created_at: nil, updated_at: nil>
irb(main):006:0> task.description='Fold the Laundry and put it in drawers'
=> "Fold the Laundry and put it in drawers"
irb(main):007:0> task.completed=false
=> false
irb(main):008:0> task
=> 
#<Task:0x00005562b1d51e70                                                                    
 id: nil,                                                                                    
 name: "Fold Laundry",                                                                       
 description: "Fold the Laundry and put it in drawers",                                      
 position: 1,                                                                                
 completed: false,                                                                           
 created_at: nil,                                                                            
 updated_at: nil>                                                                            
irb(main):009:0> task.new_record?
=> true
irb(main):010:0> task.save
  TRANSACTION (0.3ms)  BEGIN
  Task Create (0.5ms)  INSERT INTO `tasks` (`name`, `description`, `position`, `completed`, `created_at`, `updated_at`) VALUES ('Fold Laundry', 'Fold the Laundry and put it in drawers', 1, FALSE, '2023-01-14 16:41:08.291258', '2023-01-14 16:41:08.291258')
  TRANSACTION (5.3ms)  COMMIT                                   
=> true                                                         
irb(main):011:0> task
=> 
#<Task:0x00005562b1d51e70                                       
 id: 1,                                                         
 name: "Fold Laundry",                                          
 description: "Fold the Laundry and put it in drawers",         
 position: 1,                                                   
 completed: false,                                              
 created_at: Sat, 14 Jan 2023 16:41:08.291258000 UTC +00:00,    
 updated_at: Sat, 14 Jan 2023 16:41:08.291258000 UTC +00:00>    
irb(main):012:0> task.new_record?
=> false
irb(main):013:0> 




irb(main):014:0> task2=Task.new(name:"Sweep the porch",position:2,completed:false)
=> #<Task:0x00005562b192bb20 id: nil, name: "Sweep the porch", description: nil, position: 2, completed: false, created_at: nil, updated_at: nil>
irb(main):015:0> task2
=> #<Task:0x00005562b192bb20 id: nil, name: "Sweep the porch", description: nil, position: 2, completed: false, created_at: nil, updated_at: nil>
irb(main):016:0> task2.save
  TRANSACTION (0.2ms)  BEGIN
  Task Create (0.5ms)  INSERT INTO `tasks` (`name`, `description`, `position`, `completed`, `created_at`, `updated_at`) VALUES ('Sweep the porch', NULL, 2, FALSE, '2023-01-14 16:43:34.354346', '2023-01-14 16:43:34.354346')                     
  TRANSACTION (5.9ms)  COMMIT                                                   
=> true                                                                         
irb(main):017:0> task2
=> 
#<Task:0x00005562b192bb20                                                       
 id: 2,                                                                         
 name: "Sweep the porch",                                                       
 description: nil,                                                              
 position: 2,                                                    
 completed: false,                                               
 created_at: Sat, 14 Jan 2023 16:43:34.354346000 UTC +00:00,     
 updated_at: Sat, 14 Jan 2023 16:43:34.354346000 UTC +00:00>     
irb(main):018:0> task3=Task.create(name:"Buy Groceries",position:3,completed:false)
  TRANSACTION (0.3ms)  BEGIN
  Task Create (0.3ms)  INSERT INTO `tasks` (`name`, `description`, `position`, `completed`, `created_at`, `updated_at`) VALUES ('Buy Groceries', NULL, 3, FALSE, '2023-01-14 16:44:11.639888', '2023-01-14 16:44:11.639888')                       
  TRANSACTION (4.6ms)  COMMIT                                                   
=>                                                                              
#<Task:0x00005562b0d763e8                                                       
...                                                                             
irb(main):019:0> task3.new_record?
=> false
irb(main):020:0> task2.new_record?
=> false
irb(main):021:0> 
```

