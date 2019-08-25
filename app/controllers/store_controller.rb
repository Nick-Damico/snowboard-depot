class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:index]

  def index
    @page_title = 'The Pragmatic Bookshelf'
    @products = Product.order(:title)
  end
end
