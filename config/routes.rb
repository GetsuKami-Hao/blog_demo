Rails.application.routes.draw do

  get 'articles/new'

  get 'articles/show'

	root 'articles#index'

  get 'users/show'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  get '/signup', to: 'users#new'
  patch '/update', to: 'users#update'
  post '/signup', to: 'users#create'
  post '/find_users', to: 'users#find_users'
  get '/show_find_users', to: 'users#show_find_users'
  
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'



  post '/create_article', to: "articles#create"
  get '/create_article', to: 'articles#new'
  

  patch '/create_relationship', to: 'relationships#create'

  resources :users do
    member do
      get :following, :followers, :articles

    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :articles
end
