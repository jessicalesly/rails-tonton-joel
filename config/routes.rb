Rails.application.routes.draw do
  root to: 'rums#index'
  resources :rums, only: [:index, :show, :new, :create, :edit, :update] do
    resources :orders, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :orders, only: [:index, :update]
  get 'orders/:id/cancel', to: 'orders#cancel', as: 'cancel_order'
  get 'orders/:id/refuse', to: 'orders#refuse', as: 'refuse_order'
  get 'orders/:id/accept', to: 'orders#accept', as: 'accept_order'
  get 'rums/:id/update_status', to: 'rums#update_status', as: 'update_rum'
  get 'orders/:id/pay', to: 'orders#pay', as: 'pay_order'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'rums#index' #
end
