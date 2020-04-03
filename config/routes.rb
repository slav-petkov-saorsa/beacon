Rails.application.routes.draw do
  resources :contacts, only: [:index, :show, :edit, :update] do
    resources :needs, only: [:new, :create]
  end
  get '/contacts/:id/needs', to: 'contacts#show_needs'

  get '/needs/export', to: 'needs#export'

  resources :needs, only: [:index, :show, :edit, :update] do
    resources :notes
  end
  resources :users, only: [:index, :new, :create, :destroy]
  passwordless_for :users, at: '/', as: :auth
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'contacts#index'
end
