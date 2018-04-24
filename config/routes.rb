Rails.application.routes.draw do
  root 'index#index'
  
  match '/how-to-bet', to: 'index#how_to_bet', via: [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
  	get '/login', to: '/clearance/sessions#new', as: 'login'
  	post '/login', to: '/clearance/sessions#create'
  	get '/index', to: 'admins#index', as: 'index'
  	delete '/logout', to: '/clearance/sessions#destroy', as: 'logout'
  end

  get '/form', to: 'users#form', as: 'form'
  post '/register', to: 'users#create', as: 'register'

end
