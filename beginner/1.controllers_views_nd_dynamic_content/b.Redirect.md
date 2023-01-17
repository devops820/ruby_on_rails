# Redirect Controller Actions

```
class MainController < ApplicationController

  # controller action hello is being re-directed to a different action
  def hello
    redirect_to(action: 'index')
  end
end

```