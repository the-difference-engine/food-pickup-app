Rails.application.routes.draw do
  devise_for :donors
  root 'donors#index'
end
