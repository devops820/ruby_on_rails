Rails.application.routes.draw do

  # root route
  root "main#index"


  #get 'categories/index'
  #get 'categories/show'
  #get 'categories/new'
  #get 'categories/edit'
  #get 'categories/delete'
 
  resources :tasks
  resources :categories

  resources :tasks do
    member do
      get :delete
    end
  end

  resources :categories do
    member do
      get :delete
    end
  end


  # adding a custom route with match
  # anytime we see a /about, we send it to main controller, index action via a GET request
  match 'about', to: "main#about", via: :get
  match 'hello', to: "main#hello", via: :get

  # default routes - Rails routing examines the URL to determine which controller and action should be called. get `:controller/(/:action(/:id))` 
  #get 'main/index'
  #get 'tasks/index'
  #get 'tasks/new'
  #get 'tasks/edit'
  #get 'tasks/show'
  #get 'tasks/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
