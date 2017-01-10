Rails.application.routes.draw do


  devise_for :donors
  root 'donors#index'
<<<<<<< bc0319768bc8099254e6d2bea8f11df7589ca525
  resources :food_pickups
=======
  get '/new-pickup' => 'food_pickups#new'
  post '/new-pickup' => 'food_pickups#create'
  get '/pickup/:id' => 'food_pickups#show'
  get '/pickup/:id/edit' => 'food_pickups#edit'
  patch '/pickup/:id/edit' => 'food_pickups#update'
>>>>>>> updated admin index, added pickup edit pg for admin to approve, made changes to pickup routes and  pickups controller
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
