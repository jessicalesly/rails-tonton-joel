Rails.application.routes.draw do
  root to: 'pages#home'
  resources :rums, only: [:index, :show, :new, :create, :edit, :update] do
    resources :orders, only: [:create]
  end
  resources :orders, only: [:index, :update]
  get 'orders/:id/cancel', to: 'orders#cancel', as: 'cancel_order'
  get 'orders/:id/refuse', to: 'orders#refuse', as: 'refuse_order'
  get 'orders/:id/accept', to: 'orders#accept', as: 'accept_order'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
end
