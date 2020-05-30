require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:valid_attributes) {
    {
      title: 'Burton Snowboard',
      description: 'Best all mountain board',
      price: 10.00,
      image_url: 'burton_board.jpg'
    }
  }
  let(:product) { Product.new(valid_attributes) }

  context 'validations' do
    it "valid with title, description, image_url" do
      expect(product).to be_valid
    end

    context 'is invalid' do
      it 'without a title' do
        product.title = nil
        expect(product).to_not be_valid
        expect(product.errors[:title]).to include("can't be blank")
      end

      it "without a description" do
        product.description = nil
        expect(product).to_not be_valid
        expect(product.errors[:description]).to include("can't be blank")
      end

      it 'without a image_url' do
        product.image_url = nil
        expect(product).to_not be_valid
        expect(product.errors[:image_url]).to include("can't be blank")
      end
    end

    describe 'description' do
      it 'has min character length of 10' do
        product.description = 'snowboard'
        expect(product).to_not be_valid
        expect(product.errors[:description]).to include("is too short (minimum is 10 characters)")
      end
    end

    describe 'image_url' do
      it 'must be of format (jpg,png,gif)' do
        product.image_url = 'snowboard.ai'
        expect(product).to_not be_valid
        expect(product.errors[:image_url]).to include("must be a URL for GIF, JPG, or PNG image.")
        product.image_url = 'snowboard.jpg'
        expect(product).to be_valid
      end
    end

    describe 'title' do
      it 'must be unique and present' do
        expect(product).to be_valid
        product.save!
        product2 = Product.new(valid_attributes)
        expect(product2).to_not be_valid
        expect(product2.errors[:title]).to include("has already been taken")
      end

      it 'length must be > 10 characters' do
        product.title = 'Too Short'
        expect(product).to_not be_valid
        expect(product.errors[:title]).to include(
          'must be at least 10 characters'
        )
      end
    end

    describe 'price' do
      it 'must be a positive integer' do
        product.price = 1.00
        expect(product).to be_valid
      end

      it 'cannot be zero or negative number' do
        product.price = 0.00
        expect(product).to_not be_valid
        expect(product.errors[:price]).to include("must be greater than or equal to 0.01")
      end
    end
  end # End of context: Validations

  context 'has many LineItems' do
    let(:cart) { Cart.create! }
    before do
      product.save!
      cart.line_items.create!(product_id: product.id)
    end

    it 'cannot be destroyed if referenced by a LineItem' do
      expect{
        product.destroy
      }.to change(LineItem, :count).by(0).and change(Product, :count).by(0)
    end
  end
end
