require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should have_many(:line_items) }

  describe '#add_product' do
    it 'creates a line_item in cart' do
      cart = create(:cart)
      product = create(:product)
      cart.add_product(product)
      cart.save!
      expect(cart.line_items.where(product_id: product.id).count).to eq(1)
    end
  end
end
