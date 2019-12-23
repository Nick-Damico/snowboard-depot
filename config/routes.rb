Rails.application.routes.draw do
  resources :users
  resources :pay_types
  resources :orders
  get '/orders/new', to: 'orders#create', as: 'checkout'
  resources :line_items
  resources :carts
  root 'store#index'
  get 'store' => 'store#index'
  get 'store/index'
  resources :products do
    get :who_bought, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
