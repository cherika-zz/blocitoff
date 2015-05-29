Rails.application.routes.draw do

  

  devise_for :users
  
  resources :users, only: [:update, :show] do
  	resources :items, only: [:create, :destroy]
    # member do 
    #  get "todos", as: "todos"
    # end
  end

  # get "/todos" => "users#show", as: "todos"

  root to: 'welcome#index'



  
end
