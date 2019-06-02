require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe '#destroy' do
    it 'should destroy a cart' do
      cart = create(:cart)
      session[:cart_id] = cart.id
      expect {
        delete :destroy, params: {id: cart.id}
      }.to change(Cart, :count).by(-1)
    end
  end
end
