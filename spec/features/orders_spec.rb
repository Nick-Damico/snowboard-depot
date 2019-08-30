# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'orders', type: :feature do
  describe 'order form' do
    context 'pay type' do
      it 'has a pay type of Check' do
        visit '/'
        expect(page).to have_content('Add to Cart')
      end
    end
  scenario 'user adds item to cart' do
    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'
    expect(page).to have_content('Your Cart')
  end
end
