# CRUD, REST, and Resourceful Routes

- Seperate controllers for each model
- controllers as resources with actions being performed on it
- Often one controller per model; uses plural names.
- allows for clear, well-structured URL's

```
rails g controller Categories index show new edit delete
```

## REST

- Representational state transfer
- Instead of performing procedures, perform state transformations on resources
- The combination of using CRUD actions with REST leads us to Resourceful routes
- Rails will do the heavy lifting for us

```
# config/routes.rb

resources :tasks
resources :categories


resources :users, except: [:show]
resources :products, only: [:index, :show]



resources :tasks do

    # for a specific task (or record)
    member do
        get :delete
    end

    # for a collection of task (or records)
    collection do
        get :export
    end

end
```


## Resourceful URL helpers

```
<%= link_to('All Tasks', tasks_path) %>
<%= link_to('Show Task', tasks_path(@task.id) ) %>
<%= link_to('Edit Task', tasks_path(@task) ) %>
```

## Create Form processing

- Instantiate new object using form parameters
- Save the object
- If save succeeds, redirect to indirect action
- If save fails, re-display the form so that user can fix problems

```
  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to tasks_path
    else
      # The 'new' action is NOT being called here
      # Assign any instance variables needed
      # @count = Task.count
      render('new')
    end
  end
```

### Usage of strong parameters are required to inculcate strong sanitization of user input.

```
params.require(:task)
# returns hash, similar to params[:task]

params.require(:task).permit(:name, :position, :completed)

```