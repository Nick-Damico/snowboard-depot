Rails.application.routes.draw do
  get 'contacts/index'
  get 'news/index'
  get 'questions/index'
  root 'store#index', as: 'store_index'
  # get 'store/index'
  resources :products
  # resources :line_items
  # resources :carts
  # root 'store#index', as: 'store_index'
  # resources :products
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
