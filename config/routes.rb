Rails.application.routes.draw do
  resources :contacts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'contacts#index'

  match '/auth/:provider/callback', to: 'sessions#create', via: %i[get post]
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
end
