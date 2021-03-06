require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with a title, price, and description' do
    product = build(:product)
    expect(product.title).to_not be_nil
    expect(product.description).to_not be_nil
    expect(product.price).to_not be_nil
    expect(product.image_url).to_not be_nil
    expect(product).to be_valid
  end

  it 'is invalid without a title, description, image_url or price' do
    product = build(:product, title: nil, description: nil, image_url: nil, price: nil)
    expect(product).to_not be_valid
    expect(product.errors.messages[:title]).to include("can't be blank")
    expect(product.errors.messages[:description]).to include("can't be blank")
    expect(product.errors.messages[:price]).to include("can't be blank")
    expect(product.errors.messages[:image_url]).to include("can't be blank")
  end

  it 'is invalid without a positive price value' do
    product = build(:product, price: -10.00)
    expect(product).to_not be_valid
    expect(product.errors.messages[:price]).to include('must be greater than or equal to 0.01')
  end

  it 'is invalid without a unique title' do
    product = create(:product, title: 'Burton Board')
    expect(product).to be_valid
    product2 = build(:product, title: product.title)
    expect(product2).to_not be_valid
    expect(product2.errors.messages[:title]).to include('has already been taken')
  end
end
