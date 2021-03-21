Rails.application.routes.draw do
  root 'store#index', as: 'store_index'
  get 'contacts/index'
  get 'news/index'
  get 'questions/index'
  # get 'store/index'
  resources :carts
  resources :line_items
  resources :products
  # root 'store#index', as: 'store_index'
  # resources :products
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
