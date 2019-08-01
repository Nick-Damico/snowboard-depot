Rails.application.routes.draw do
  resources :line_items
  resources :carts
  patch 'update_count/:id' => 'line_items#update_count', as: 'update_count'
  root 'store#index', as: 'store_index'
  get 'store' => 'store#index'
  get 'store/index'
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
