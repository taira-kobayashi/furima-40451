Rails.application.routes.draw do
  root to: 'items#index'
  resources :user
end
