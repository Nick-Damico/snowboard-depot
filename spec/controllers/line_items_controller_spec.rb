require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  let(:line_item) { create(:line_item) }
  let(:product) { create(:product) }

  describe '#create' do
    it 'should create a line_item' do
      expect do
        post :create, params: { product_id: product.id }
      end.to change(LineItem, :count).by(1)
    end

    it 'should return status 201' do
      post :create, params: { product_id: product.id }
      expect(response).to have_http_status '201'
    end
  end

  describe '#update' do
    it 'should update a line_item' do
      patch :update, params: {id: line_item.id, line_item: { product_id: line_item.product_id } }
      expect(response).to redirect_to line_item_url(line_item)
    end
  end
end
