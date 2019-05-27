# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:product) { create(:product, price: 100.50) }
  let(:cart) { create(:cart) }

  describe '#index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_successful
    end
  end

  describe '#destroy' do
    it 'should destroy a product' do
      @product = product
      expect do
        delete :destroy, params: { id: @product.id }
      end.to change(Product, :count).by(-1)
    end

    context 'has a line_item' do
      it 'should not destroy' do
        create(:line_item, product_id: product.id, cart_id: cart.id)
        @product = product
        binding.pry
        expect do
          delete :destroy, params: { id: @product.id }
        end.to change(Product, :count).by(0)
      end
    end

    it 'should redirect to products_url' do
      @product = product
      delete :destroy, params: { id: @product.id }
      expect(response).to redirect_to products_url
    end
  end
end
