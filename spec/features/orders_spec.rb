# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders', type: :feature do
  scenario 'user visits store page' do
    visit root_path
    expect(page).to have_content('The Pragmatic Bookshelf')
  end

  scenario 'user adds item to cart', :js => true do
    visit root_path

    first('.catalog li').click_on('Add to Cart')
    expect(page).to have_content('Total: $45.00')
    click_button('Checkout')
    expect(page).to have_current_path(new_order_path)
    expect(page).to have_content('Please Enter Your Details')
  end
end
