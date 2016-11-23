Rails.application.routes.draw do
  devise_for :donors
  root 'donors#index'
  get '/new-pickup' => 'food_pickups#new'
  post '/new-pickup' => 'food_pickups#create'
  get 'profiles' => 'profiles#index'
  get 'profiles/:id' => 'profiles#show'
  patch 'profiles/:id' => 'profiles#update'

  namespace :api do
    namespace :v1 do
      resources :profiles, only: [:index, :update]
    end
  end

  get '/agreement' => 'food_pickups#agreement'
  get '/generate_pdf' => 'food_pickups#generate_pdf'
end
