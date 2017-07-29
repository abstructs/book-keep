Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resources :notes 
  end   

  get '/profile', to: 'users#profile' 

  root 'books#index'
end
