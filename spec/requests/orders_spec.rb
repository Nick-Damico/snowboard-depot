require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET /orders" do
    it "works! (now write some real specs)" do
      get orders_path
      expect(response).to have_http_status(200)
    end

    describe '#create' do
      context 'with valid parameters' do
        it 'creates a user' do
          post users_url, params: { user: { name: 'Johnny', password: '123456789', password_confirmation: '123456789' } }
          expect(response).to redirect_to users_url
        end
      end
    end
  end
end
