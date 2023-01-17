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
