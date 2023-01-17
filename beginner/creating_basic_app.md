## Creating a test application
- `rails new hello-world; cd hello-world`
- `rails server --binding=0.0.0.0`

## Install mysql database
- `sudo apt-get install libmysqlclient-dev`
- `gem install mysql2`

## Ruby on Rails follows -  MVC Architecture
- Rails follows MVC Architecture
- Controller makes decisions
- View handles presentation
- Model stores objects/structure/data inside a database
- User interacts with the controller

## Creating a rails project (task_manager) with mysql application
- `rails new task_manager -d mysql`
- `rails db:create` or `rake db:create`

## Starting and Stopping default web server on rails
- `rails server` or `rails s`

## Generating a controller
- `rails generate controller ControllerName <actions>`
-  actions refer to methods inside the class that can be called from outside.
- `rails generate controller Tasks index new edit`
-  browser -> app -> routes -> controllers -> views -> browser

## Rails Routing
- rails uses the routes file to find the appropriate controller in action
- when we generated the controller, it added the route at the same time.
- There are several types of routes - match/root/resourceful routes.
```
match 'main/index', to: "main#index", via: :get
match 'tasks/:id', to: "tasks#show", via: :get

root "main#index"
match "/", to: "main#index", via: :get 
```

## References
- [Install Ruby on Rails on Ubuntu](https://www.vultr.com/docs/installing-ruby-on-rails-on-ubuntu-20-04?utm_source=performance-max-apac&utm_medium=paidmedia&obility_id=16876059738&utm_adgroup=&utm_campaign=&utm_term=&utm_content=&gclid=Cj0KCQiAtvSdBhD0ARIsAPf8oNkuGaEw4YhrP9O0TEnB95h_LPSyTGK8OwXh08sVz3jk1A_Pl1WuQQ8aAmFhEALw_wcB)
- [Install mysql-server on ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04)