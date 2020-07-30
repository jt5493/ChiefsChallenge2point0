Rails.application.routes.draw do
#custom routes above
  root 'sessions#home'
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#delete'

  get "/auth/:provider/callback" => 'sessions#google'
  
  resources :workouts do
    resources :exercises, only: [:index, :new, :create]
  end
  resources :users do
    resources :workouts, only: [:index, :new, :create ]
  end
  resources :exercises
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
