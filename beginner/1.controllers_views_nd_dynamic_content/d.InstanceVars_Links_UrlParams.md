# Using Instance Variables to set values in Templates

## Example 1:

```
class MainController < ApplicationController
  def index
    # render('index') is the default behaviour
    # render('index')
  end

  def about
    # render('main/about')
    @created_by = 'sai pavan marlakunta'
    @id = params['id']
    @page = params[:page]
    render('about')
  end

  def hello
    redirect_to(action: 'index')
  end
end

```


## Example 2:

```
class TasksController < ApplicationController
  def index
    @tasks = ['Post an Ad on Olx', 'Verify the leakages', 'Arrange Maid', 'Check on Kuhu']
    @page = params[:page] 
  end

  def new
  end

  def edit
  end
end

```