class CartsController < ApplicationController
    before_action :set_cart, only: [:show, :destroy]
    before_action :set_page_title, only: %i[show]

    def show
    end

    def destroy
      if @cart.destroy
        respond_to do |format|
          format.html { redirect_to store_index_url, notice: 'Cart has been emptied.'}
        end
      end
    end

    private

    def set_cart
      @cart = Cart.find(params[:id])
    end

    def set_page_title
      @page_title = 'Shopping Cart'
    end
end