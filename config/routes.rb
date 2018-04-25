Rails.application.routes.draw do
  root 'index#index'

  resources :users, only: [:new, :create]
  get '/about_us', to: 'index#about_us', as: 'about_us'
  get '/top100', to: 'index#top_100', as: 'top_100'
  get 'how_to_bet', to: 'index#how_to_bet', as: 'how_to_bet'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    get '/login', to: '/clearance/sessions#new', as: 'login'
    post '/login', to: '/clearance/sessions#create'
    get '/index', to: 'admins#index', as: 'index'
    delete '/logout', to: '/clearance/sessions#destroy', as: 'logout'
    get '/match_setup', to: 'admins#match_setup', as: 'setup'
  end
  get '/form', to: 'users#form', as: 'form'
  post '/register', to: 'users#create', as: 'register'
  get '/betting', to: 'users#betting', as: 'betting'
end
