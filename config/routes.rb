Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  
  authenticate :user do
    resources :listings, only: [:new, :create]
  end
  resources :listings, only: [:index, :show]
  
end
