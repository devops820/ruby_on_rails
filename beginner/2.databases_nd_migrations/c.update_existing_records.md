# Update existing records

## Find + Save
Its a 3 step process
- Find record and create a new instance from it
- Change the values on the instance
- Save

## Find + Update
- Find record
- Set values + Save

```
irb(main):001:0> task = Task.find(1)
  Task Load (0.3ms)  SELECT `tasks`.* FROM `tasks` WHERE `tasks`.`id` = 1 LIMIT 1
=>                                                                     
#<Task:0x00007f54308b2410                                              
...                                                                    
irb(main):002:0> task
=> 
#<Task:0x00007f54308b2410                                              
 id: 1,                                                                
 name: "Fold Laundry",                                                 
 description: "Fold the Laundry and put it in drawers",                
 position: 1,                                                          
 completed: false,                                                     
 created_at: Sat, 14 Jan 2023 16:41:08.291258000 UTC +00:00,           
 updated_at: Sat, 14 Jan 2023 16:41:08.291258000 UTC +00:00>           
irb(main):003:0> task.name='Fold the laundry'
=> "Fold the laundry"
irb(main):004:0> task.new_record?
=> false
irb(main):005:0> task
=> 
#<Task:0x00007f54308b2410                                       
 id: 1,                                                         
 name: "Fold the laundry",                                      
 description: "Fold the Laundry and put it in drawers",         
 position: 1,                                                   
 completed: false,                                              
 created_at: Sat, 14 Jan 2023 16:41:08.291258000 UTC +00:00,    
 updated_at: Sat, 14 Jan 2023 16:41:08.291258000 UTC +00:00>    
irb(main):006:0> task.save
  TRANSACTION (0.2ms)  BEGIN
  Task Update (0.5ms)  UPDATE `tasks` SET `tasks`.`name` = 'Fold the laundry', `tasks`.`updated_at` = '2023-01-14 16:50:24.778384' WHERE `tasks`.`id` = 1
  TRANSACTION (4.4ms)  COMMIT                                   
=> true                                                         
irb(main):007:0> 



irb(main):009:0> task=Task.find(3)
  Task Load (0.4ms)  SELECT `tasks`.* FROM `tasks` WHERE `tasks`.`id` = 3 LIMIT 1
=>                                                                   
#<Task:0x000055a8672caa50                                            
...                                                                  
irb(main):010:0> task
=> 
#<Task:0x000055a8672caa50                                            
 id: 3,                                                              
 name: "Buy Groceries",                                              
 description: nil,                                                   
 position: 3,                                                        
 completed: false,                                                   
 created_at: Sat, 14 Jan 2023 16:44:11.639888000 UTC +00:00,         
 updated_at: Sat, 14 Jan 2023 16:44:11.639888000 UTC +00:00>         
irb(main):011:0> task.update(name: 'Buy Vegetables', description: 'Go to Medhahalli Market')
  TRANSACTION (0.3ms)  BEGIN
  Task Update (0.5ms)  UPDATE `tasks` SET `tasks`.`name` = 'Buy Vegetables', `tasks`.`description` = 'Go to Medhahalli Market', `tasks`.`updated_at` = '2023-01-14 16:52:14.373327' WHERE `tasks`.`id` = 3                                                            
  TRANSACTION (4.3ms)  COMMIT                                                                      
=> true                                                                                            
irb(main):012:0> 


irb(main):013:0> task3=Task.find(3)
  Task Load (0.5ms)  SELECT `tasks`.* FROM `tasks` WHERE `tasks`.`id` = 3 LIMIT 1
=>                                                                                                 
#<Task:0x000055a866088068                                                                          
...                                                                                                
irb(main):014:0> task3
=> 
#<Task:0x000055a866088068                                                                          
 id: 3,                                                                                            
 name: "Buy Vegetables",                                              
 description: "Go to Medhahalli Market",                              
 position: 3,                                                         
 completed: false,                                                    
 created_at: Sat, 14 Jan 2023 16:44:11.639888000 UTC +00:00,          
 updated_at: Sat, 14 Jan 2023 16:52:14.373327000 UTC +00:00>          
irb(main):015:0> 
```