Rails.application.routes.draw do
  resources :investments

  root to: 'investments#index'
end
