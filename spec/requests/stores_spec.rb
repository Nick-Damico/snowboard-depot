require 'rails_helper'

RSpec.describe 'Stores', type: :request do
    describe 'GET /stores' do
        it 'responds with success' do
            get store_index_path
            expect(response).to have_http_status(200)
        end
    end
end