class AdminController < ApplicationController
  def index
    @total_orders = Order.count
  end

  def new
    redirect_to sessions_new_url
  end
end
