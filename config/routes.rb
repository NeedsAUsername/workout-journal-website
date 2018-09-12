Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'

  resources :journals, :path => 'journal', only: [:new, :create, :index]

  resources :program_plans, :path => 'programs', only: [:index, :show, :new, :create] do
    resources :exercises, only: [:index, :show]
  end

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
