require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) { create(:cart) }
  let(:product) { create(:product) }
  describe '#add_product' do
    it 'builds a line_item for a given product' do
      expect(cart.products).to be_empty
      current_item = cart.add_product(product)
      expect(current_item.quantity).to eq 1
      expect(current_item.product_id).to eq product.id
    end

    it 'increases quantity if product already has a line_item' do
      expect(cart.products).to be_empty
      cart.add_product(product)
      cart.save!
      current_item = cart.add_product(product)
      expect(current_item.quantity).to eq 2
    end
  end
end
