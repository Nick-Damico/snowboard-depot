# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Store', type: :feature do
  include ActiveJob::TestHelper

  let(:user) {
    {
      name: 'Johnny Appleseed',
      address: '123 Apple Orchard Rd',
      email: 'johhny_apple@orchard.com'
    }
  }

  before do
    Product.create! do |prod|
      prod.title = 'Burton Custom Freestyle'
      prod.description = "Burton's legendary Fresstyle Custom"
      prod.price = '425.00'
      prod.image_url = 'mn_name_drop.png'
    end
  end

  after do
    DatabaseCleaner.clean
  end

  feature 'Customer adds item to cart' do
    before { @product = Product.first }
    xscenario "via button 'Add to cart'" do
      visit store_index_path
      expect(page).to have_content(@product.title)
      expect(page).to have_content("$#{@product.price}")
      first('ul.catalog li').click_button('Add to cart')
      expect(page).to have_content('item was successfully added to your cart.')
    end

    scenario 'multiple times, displayed with single line item in cart' do
      visit store_index_path
      first('ul.catalog li').click_button('Add to cart')
      expect(page).to have_content("1 × #{@product.title}")
      visit store_index_path
      first('ul.catalog li').click_button('Add to cart')
      expect(page).to have_content("2 \u00d7 #{@product.title}")
    end
  end

  feature 'Customer empties cart' do
    before { @product = Product.first }
    scenario 'via Empty Cart button' do
      visit store_index_path
      first('ul.catalog li').click_button('Add to cart')
      expect(page).to have_content("1 × #{@product.title}")
      click_button('Empty Cart')
      expect(page).to have_content('Your cart is currently empty.')
    end
  end
end
