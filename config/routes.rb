Rails.application.routes.draw do
  root to: 'pages#home'
  resources :rums, only: [:index, :show, :new, :create, :edit, :update] do
    resources :orders, only: [:create]
  end
  resources :orders, only: [:index, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'rums#index' #
end
