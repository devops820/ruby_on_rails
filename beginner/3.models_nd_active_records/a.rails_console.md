# Rails Console

Rails console provides command line access to rails project from the command line.
- `rails console -e development`
- interacts with the same project database as the web browser
- `reload!` - to reload the project code
- To turn off autocomplete feature - `echo 'IRB.conf[:USE_AUTOCOMPLETE] = false' >> ~/.irbrc`

```
ubuntu@ip-172-31-18-68:~/rails/task_manager$ rails console -e development
Loading development environment (Rails 7.0.4)
irb(main):001:0> 
irb(main):002:0> x="Hello"
=> "Hello"
irb(main):003:0> x.upcase.reverse!
=> "OLLEH"
irb(main):004:0> x.upcase.reverse
=> "OLLEH"
irb(main):005:0> task=Task.new
=> #<Task:0x0000561c52fa30d8 id: nil, name: nil, description: nil, position: nil, completed: nil, created_at: nil, updated_at: nil>
irb(main):006:0> task
=> #<Task:0x0000561c52fa30d8 id: nil, name: nil, description: nil, position: nil, completed: nil, created_at: nil, updated_at: nil>
irb(main):007:0> task.name="Fold laundry"
=> "Fold laundry"
irb(main):008:0> task
=> #<Task:0x0000561c52fa30d8 id: nil, name: "Fold laundry", description: nil, position: nil, completed: nil, created_at: nil, updated_at: nil>
irb(main):009:0> task.name
=> "Fold laundry"
irb(main):010:0> reload!
Reloading...
=> true                                                              
irb(main):011:0> task
=> #<Task:0x0000561c52fa30d8 id: nil, name: "Fold laundry", description: nil, position: nil, completed: nil, created_at: nil, updated_at: nil>
irb(main):012:0> 
```

