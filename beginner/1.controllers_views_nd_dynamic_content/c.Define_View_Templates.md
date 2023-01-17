# Define View Templates using ERB

`link_to` is a helper method

## Example 1:

```
<h1>Task Manager</h1>
<p>This is an application for managing a To-Do list</p>

<a href="/tasks/index">Tasks 1</a> <br />
<%= link_to('Tasks 2', '/tasks/index') %> <br />
<%= link_to('Tasks 3', {controller: 'tasks', action: 'index'}) %> <br />
<%= link_to('Tasks 4', {controller: 'tasks', action: 'index', page:1}) %> <br />

<%= link_to('About', {action: 'about', page: 5, id: 20}) %>
```


## Example 2:

```
<%= link_to('Back to Homepage', {controller: 'main', action: 'index'}) %> <br />

<% if @page.to_i == 1 %>
  <h2>Task List</h2>
<% end %>


<ul>
<% @tasks.each do |task| %>
  <li><%= task %></li>
<% end %>
</ul>


<% link_to('Home Page', '/main/index') %> <br />
```

## Example 3:

```
<h2>About</h2>

<p>Description of task_manager.</p>
<p>created by <%= @created_by %></p>

ID=<%= @id %> <br />
Page=<%= @page %> <br />
```