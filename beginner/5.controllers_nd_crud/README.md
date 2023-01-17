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
