# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders', type: :feature do
  scenario 'user visits store page' do
    visit '/'
    expect(page).to have_content('The Pragmatic Bookshelf')
  end

  scenario 'user adds item to cart' do
    visit '/'
    save_and_open_page
    expect(page).to have_content('Rails, Angular, Postgres, and Bootstrap')
  end
end
