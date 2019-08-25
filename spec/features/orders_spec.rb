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
  end
end
