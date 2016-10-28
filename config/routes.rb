Rails.application.routes.draw do
  devise_for :donors
  root 'donors#index'

  get 'profiles/:id' => 'profiles#show'
  patch 'profiles/:id' => 'profiles#update'
end
