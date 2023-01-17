# Delete Records

2 step process
- find
- call destroy

```
irb(main):017:0> task=Task.create(name:'remove me',position:4)
  TRANSACTION (0.3ms)  BEGIN
  Task Create (0.5ms)  INSERT INTO `tasks` (`name`, `description`, `position`, `completed`, `created_at`, `updated_at`) VALUES ('remove me', NULL, 4, NULL, '2023-01-14 16:54:39.181139', '2023-01-14 16:54:39.181139')                 
  TRANSACTION (6.4ms)  COMMIT                                        
=>                                                                   
#<Task:0x000055a867b2daa8                                            
...                                                                  
irb(main):018:0> task4=Task.find(4)
  Task Load (0.5ms)  SELECT `tasks`.* FROM `tasks` WHERE `tasks`.`id` = 4 LIMIT 1
=>                                                                    
#<Task:0x000055a867904358                                             
...                                                                   
irb(main):019:0> task4
=> 
#<Task:0x000055a867904358                                             
 id: 4,                                                               
 name: "remove me",                                                   
 description: nil,                                                    
 position: 4,                                                         
 completed: nil,                                                      
 created_at: Sat, 14 Jan 2023 16:54:39.181139000 UTC +00:00,          
 updated_at: Sat, 14 Jan 2023 16:54:39.181139000 UTC +00:00>          
irb(main):020:0> task4.destroy
  TRANSACTION (0.2ms)  BEGIN
  Task Destroy (0.4ms)  DELETE FROM `tasks` WHERE `tasks`.`id` = 4
  TRANSACTION (4.5ms)  COMMIT                                    
=>                                                               
#<Task:0x000055a867904358                                        
 id: 4,                                                          
 name: "remove me",                                              
 description: nil,                                               
 position: 4,                                                    
 completed: nil,                                                 
 created_at: Sat, 14 Jan 2023 16:54:39.181139000 UTC +00:00,     
 updated_at: Sat, 14 Jan 2023 16:54:39.181139000 UTC +00:00>     
irb(main):021:0> 
```