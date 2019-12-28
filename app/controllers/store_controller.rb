class StoreController < ApplicationController
  include CurrentCart
  skip_before_action :authorize
  before_action :set_cart, only: [:index]

  def index
    @page_title = 'The Pragmatic Bookshelf'
    @products = Product.order(:title)
  end
end
