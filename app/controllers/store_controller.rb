class StoreController < ApplicationController
  include CurrentCart
  before_action :set_page_title, only: %i[index]
  before_action :set_cart, only: %i[index]

  def index
    @products = Product.order(:title)
  end
  
  private

  def set_page_title
    @page_title = 'Store'    
  end
end
