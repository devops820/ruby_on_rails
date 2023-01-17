# Controllers And CRUD

## Form helpers on RubyOnRails

### Traditional HTML Form

```
<form action="/tasks" method="post">
    <input type="text" name="name">
    <input type="text" name="position">
    <input type="checkbox" name="completed">
    <textarea name="description"></textarea>
    <input type="submit" value="Create Task">
</form>

Controller Action
params[:name]
params[:position]
params[:completed]
params[:description]
```

### Rails Form Helper

- Form parameters are grouped
- Form inputs are easier and more consistent
- Fields are pre-populated with object attributes
- Form action/method checks object.new_record?

```
<%= form_for(@task) do |f| %>
    <%= f.text_field(:name) %>
    <%= f.text_field(:position) %>
    <%= f.check_box(:completed) %>
    <%= f.text_area(:description) %>
    <%= f.submit("Create Task") %>
<% end %>


params[:task][:name]
params[:task][:position]
params[:task][:completed]
params[:task][:description]


```

## Update Form Processing

- Find an existing object using its ID
- Update the object using form parameters
- If update succeeds, redirect to the show action
- If update fails, redisplay the form so user can fix problems

## Using partials to organize the code
- Better code organization
- Don't repeat yourself
- Partials are partial templates (meant to be shared by other templates)
- the form helpers used for edit & creating a new task uses the same code, so, we could re-use the code & avoid duplication.
- so create a  `_form.html.erb`. Using `_` at the beginning suggests rails that it is a partial code & not a full template

```

<%= link_to("Back to List", tasks_path, :class=> 'back-link') %>

<div class="tasks edit">
  <h2>Edit Task</h2>

  <%= form_for(@task) do |f| %>
     <% # url: task_path(@task) , method: 'patch' %>
    
    <%= render(partial: 'form', locals: {f: f}) %> 
    <div class="form-buttons">
      <%= f.submit("Edit Task") %>
    </div>

  <% end %>
</div>

```

## Is a Delete Form Necessary ?

- Not a default action
- Often omitted
- Link to destroy
- Link to destroy with a confirmation alert
- Link to a confirmation page


