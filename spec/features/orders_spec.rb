# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders', type: :feature do
  scenario 'user visits store page' do
    visit root_path
    expect(page).to have_content('The Pragmatic Bookshelf')
  end

  scenario 'user adds item to cart', js: true do
    visit root_path

    first('.catalog li').click_on('Add to Cart')
    expect(page).to have_content('Total: $45.00')
  end

  scenario 'user selects check as pay type', js: true do
    visit root_path

    first('.catalog li').click_on('Add to Cart')
    expect(page).to have_content('Total: $45.00')
    click_button('Checkout')
    expect(page).to have_current_path(new_order_path)
    expect(page).to have_content('Please Enter Your Details')

    fill_in 'order_name', with: 'Johnny Appleseed'
    fill_in 'order_address', with: '123 Main Street'
    fill_in 'order_email', with: 'johnny_apple@trees.com'
    assert_no_selector '#order_routing_number'
    select('Check', from: 'pay_type')
    assert_selector '#order_routing_number'
  end
end
