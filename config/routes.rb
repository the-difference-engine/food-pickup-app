Rails.application.routes.draw do
  devise_for :donors
  root 'donors#index'
  get '/new-pickup' => 'food_pickups#new'
  post '/new-pickup' => 'food_pickups#create'
  get '/profiles' => 'profiles#index'
  get 'profiles/:id' => 'profiles#show'
  patch 'profiles/:id' => 'profiles#update'
end
