module CurrentCart
  # Additionally, we mark the method as private, which prevents Rails from ever
  # making it available as an action on the controller.

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def clear_cart
    session.delete(:cart_id)
  end
end
