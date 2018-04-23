Rails.application.routes.draw do
  root 'index#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
  	get '/login', to: '/clearance/sessions#new', as: 'login'
  	post '/login', to: '/clearance/sessions#create'
  	get '/index', to: 'admins#index', as: 'index'
  	delete '/logout', to: '/clearance/sessions#destroy', as: 'logout'
  end

	get '/register', to: "users#register", as: 'register'

end
