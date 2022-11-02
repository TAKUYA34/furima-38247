Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get '/items/delivery_charge/:id', to: "items#delivery_charge"
  resources :items, only: [:index, :new, :create]
end
