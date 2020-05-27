# This makes the methods below available to as methods,
# Private keeps them from being confused with controller actions.
module CurrentCart
  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create!
    session[:cart_id] = @cart.id
  end

  def clear_cart
    session[:cart_id] = nil
  end
end
