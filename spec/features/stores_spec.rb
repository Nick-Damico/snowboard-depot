# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Store', type: :feature do
  describe 'Store Page' do
    it 'displays the app name' do
      visit store_index_url

      expect(page).to have_content('The Pragmatic Bookshelf')
    end

    it 'lists products' do
      visit '/store'
      sleep(10)
      expect(page).to have_content('Rails, Angular, Postgres, and Bootstrap')
    end
  end
end
