Rails.application.routes.draw do
  root 'store#index'
  resources :admin
  resources :carts
  resources :line_items
  resources :orders
  get 'signup', to: 'users#new'
  resources :users
  resources :pay_types
  resources :products do
    get :who_bought, on: :member
  end

  controller :sessions do
    get 'login'  => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get 'store' => 'store#index'
  get 'store/index'
  get '/orders/new', to: 'orders#create', as: 'checkout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
