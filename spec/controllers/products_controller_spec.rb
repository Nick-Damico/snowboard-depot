# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_success
    end
  end

  describe '#destroy' do
    it 'destroys a product instance' do

    end
  end
end
