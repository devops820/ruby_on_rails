# Controllers, Views and Dynamic Content 

Most controller actions will either render a template or redirect somewhere else.
We can use instance variables to allow controllers to provide data to the template.

## Rail link with Parameters
When the request is sent to rails, all of the parameters will be put inside an object called params.
params are accessible in controllers and views
contains all GET and POST values
All values are strings.
```
<%= link_to('Link',

{
    controller: 'main',
    action: 'hello',
    id: 20,
    page: 5
}
)
%>
```
