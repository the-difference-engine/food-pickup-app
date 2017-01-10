Rails.application.routes.draw do


  devise_for :donors
  root 'donors#index'
  resources :food_pickups
  get '/admin' => 'donors#admin_index'
  get 'profiles' => 'profiles#index'
  get 'profiles/:id' => 'profiles#show'
  patch 'profiles/:id' => 'profiles#update'

  resources :volunteers

  resources :charges

  namespace :api do
    namespace :v1 do
      resources :profiles, only: [:index, :update]
      resources :food_pickups, only: [:index, :update]
      resources :shelters
    end
  end

  get '/agreement' => 'food_pickups#agreement'
  get '/generate_pdf' => 'food_pickups#generate_pdf'
  get "/donors/payment" => 'donors#new_payment'
  post "/donors/payment" => 'donors#create_customer'
end
