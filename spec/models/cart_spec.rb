require 'rails_helper'

RSpec.describe Cart, type: :model do
  include ActionView::Helpers::NumberHelper

  let(:product) { create(:product, price: 450.00) }

  describe 'add_product' do
    before { subject.save! }
    it 'raises an Error if product is not given' do
      expect { subject.add_product }.to raise_error(ArgumentError)
    end

    it 'raises exception if argument is not a Product' do
      expect { subject.add_product('not a product') }.to raise_exception('Argument must be a Product')
    end

    it 'returns an unpersisted line item for the given product' do
      expect(subject.add_product(product)).to be_an_instance_of(LineItem)
      expect(subject.add_product(product)).to_not be_persisted
    end

    it 'increase quanity if product is already in cart' do
      subject.add_product(product)
      expect { subject.save! }.to change(LineItem, :count).by(1)
      line_item = subject.add_product(product)
      expect { subject.save! }.to change(LineItem, :count).by(0)
      expect(line_item.quantity).to eq(2)
    end
  end

  describe '#total_price' do
    before { subject.save! }
    it 'should return total sum of a carts line items' do
      subject.add_product(product)
      subject.add_product(product)
      subject.save!
      expect(number_to_currency(subject.total_price)).to eq('$900.00')
    end
  end
end
