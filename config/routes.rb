Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'

  resources :journals, :path => 'journal', only: [:new, :create, :index] do
    resources :entries, only: [:index, :show, :create]
  end

  resources :program_plans, :path => 'programs' do
    resources :exercises, only: [:index, :show]
  end

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'

end
