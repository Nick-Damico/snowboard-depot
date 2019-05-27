require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  describe '#create' do
    it 'should create a line_item' do
      expect do
        @product = create(:product)
        post :create, params: { product_id: @product.id }
      end.to change(LineItem, :count).by(1)
    end

    it 'should return status 201' do
      @product = create(:product)
      post :create, params: { product_id: @product.id }
      expect(response).to have_http_status '201'
    end
  end
end
