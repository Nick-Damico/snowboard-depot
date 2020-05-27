require 'rails_helper'

RSpec.describe LineItem, type: :model do
  include ActionView::Helpers::NumberHelper
  let(:product) {
    Product.create!(
      title: 'Burton Snowboard',
      description: 'Best all mountain board',
      price: 10.00,
      image_url: 'burton_board.jpg'
    )
  }
  let(:cart) { Cart.create! }
  subject { LineItem.create!(product_id: product.id, cart_id: cart.id) }

  describe '#total_price' do
    it 'should return the total sum of a line item' do
      subject.update(quantity: 2)
      expect(number_to_currency(subject.total_price)).to eq('$20.00')
    end
  end
end
