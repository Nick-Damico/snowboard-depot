# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_successful
    end
  end

  describe '#destroy' do
    before do
      @product = create(:product)
    end

    it 'should destroy a product' do
      expect do
        delete :destroy, params: { id: @product.id }
      end.to change(Product, :count).by(-1)
    end

    context 'has a line_item' do
      it 'should not destroy' do
        @cart = create(:cart)
        create(:line_item, product_id: @product.id, cart_id: @cart.id)
        expect do
          delete :destroy, params: { id: @product.id }
        end.to change(Product, :count).by(0)
      end
    end

    it 'should redirect to products_url' do
      delete :destroy, params: { id: @product.id }
      expect(response).to redirect_to products_url
    end
  end
end
