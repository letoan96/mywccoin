Rails.application.routes.draw do
  root 'index#index'

  get '/about_us', to: 'index#about_us', as: 'about_us'
  get '/top100', to: 'index#top_100', as: 'top_100'
  get 'how_to_bet', to: 'index#how_to_bet', as: 'how_to_bet'

  resources :users, only: [:new, :create]
  scope module: 'clearance', path: 'admin' do
    resource 'sessions', only: [:new, :create, :destroy]
  end

  scope path: 'admin' do
    resources 'matches', only: [:create, :update, :index]
    resources 'dashboards', only: [:index]
  end

  get '/betting', to: 'users#betting', as: 'betting'

end
