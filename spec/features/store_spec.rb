require 'rails_helper'

describe 'Shopper vists store page' do
    let(:product) { create(:product, title: 'Burton Snowboard', price: 200) }
    before do
        product
    end
    describe 'without login or signup' do
        it 'displays a product title and formatted price' do
            visit store_index_path
            price_html = find("span.product_price")
            expect(page).to have_content 'Store' 
            expect(page).to have_content product.title
            expect(price_html.text).to match(/^\$\d+\.\d{2}/)
            expect(price_html.text).to have_content "#{product.price}"
        end
    end
end