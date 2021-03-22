class CartsController < ApplicationController
    before_action :set_cart, only: [:show, :edit, :update, :destroy]
    before_action :set_page_title, only: %i[show]
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

    def show
    end

    def destroy
      @cart.destroy if @cart.id == session[:cart_id]
      session[:cart_id] = nil

      respond_to do |format|
        format.html { redirect_to store_index_url, notice: 'Cart has been emptied.'}
      end
    end

    private

    def set_cart
      @cart = Cart.includes(line_items: [:product]).find(params[:id])
    end

    def set_page_title
      @page_title = 'Shopping Cart'
    end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to store_index_url, notice: 'Invalid cart'
    end
end