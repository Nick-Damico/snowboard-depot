require 'rails_helper'

describe 'Shopper vists store page' do
    let(:cart) { create(:cart) }
    let(:product) { create(:product, title: 'Burton Snowboard', price: 200) }
    let(:line_item) { create(:line_item, product_id: product.id, cart_id: cart.id, quantity: 1) }



    describe 'customer managing items in shopping cart' do
      before { line_item }
      it 'displays item title with quantity' do
        visit cart_path(cart)
        expect(page).to have_content 'Shopping Cart'
        expect(page).to have_content product.title
        expect(page).to have_content line_item.quantity
      end

      it 'allows the customer to remove item from cart' do
        visit cart_path(cart)
        click_link 'Remove'
        expect(page).to have_content 'Item was successfully removed.'
        expect(page).to_not have_content product.title
      end
    end

    # describe 'without login or signup' do
    #     it 'displays a product title and formatted price' do
    #         visit store_index_path
    #         price_html = find("tr.product-row")
    #         expect(page).to have_content 'Store' 
    #         expect(page).to have_content product.title
    #         expect(price_html.text).to match(/^\$\d+\.\d{2}/)
    #         expect(price_html.text).to have_content "#{product.price}"
    #     end

    #     it 'adds product to cart when shopper clicks add button' do
    #         visit store_index_path
    #         add_btn = find('input.add-product')
    #         add_btn.click
    #         expect(page).to have_content 'Shopping Cart'
    #         expect(page).to have_content product.title
    #         expect(page).to have_content 'Item was successfully added to cart'
    #     end

    #     it 'adding the same item to cart increases quantity' do
    #       visit store_index_path
    #       add_btn = find('input.add-product')
    #       add_btn.click
    #       visit store_index_path
    #       add_btn.click

    #       expect(find(:css, 'li.line-item')).to have_content("#{product.title} \u00D7 2")
    #     end
    # end
end