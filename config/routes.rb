Rails.application.routes.draw do
  resources :posts
  root to: "users#index"
  devise_for :users
  # get 'billing/index', to: 'billing#index'
  get '/card/new' => 'billings#new_card', as: :add_payment_method
  resources :billings
  resources :money_donators
  post "/card" => "billings#create_card", as: :create_payment_method
  get '/success' => 'billings#success', as: :success
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
