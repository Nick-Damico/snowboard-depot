require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let(:cart) { create(:cart) }

  describe '#destroy' do
    it 'should destroy a cart' do
      session[:cart_id] = cart.id
      expect do
        delete :destroy, params: { id: cart.id }
      end.to change(Cart, :count).by(-1)
    end
  end
end
