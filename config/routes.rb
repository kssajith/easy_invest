Rails.application.routes.draw do
  resources :investments

  root to: 'investments#index'
  get 'load_schemes' => 'investments#load_schemes'
end
