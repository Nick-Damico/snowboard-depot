# # frozen_string_literal: true
#
# require 'rails_helper'
#
# RSpec.describe 'Store', type: :feature do
#   include ActiveJob::TestHelper
#
#   let(:user) {
#     {
#       name: 'Johnny Appleseed',
#       address: '123 Apple Orchard Rd',
#       email: 'johhny_apple@orchard.com'
#     }
#   }
#
#   after do
#     Order.delete_all
#     LineItem.delete_all
#   end
#
#   scenario 'user visits store page' do
#     visit root_path
#     expect(page).to have_content('The Pragmatic Bookshelf')
#   end
#
#   scenario 'user adds item to cart', js: true do
#     visit root_path
#
#     first('.catalog li').click_on('Add to Cart')
#     expect(page).to have_content('Total: $45.00')
#   end
#
#   scenario 'user selects check as payment type', js: true do
#     visit root_path
#
#     first('.catalog li').click_on('Add to Cart')
#     expect(page).to have_content('Total: $45.00')
#     click_button('Checkout')
#     expect(page).to have_current_path(new_order_path)
#     expect(page).to have_content('Please Enter Your Details')
#
#     fill_in 'order_name', with: user[:name]
#     fill_in 'order_address', with: user[:address]
#     fill_in 'order_email', with: user[:email]
#     assert_no_selector '#order_routing_number'
#     select('Check', from: 'pay_type')
#     assert_selector '#order_routing_number'
#   end
#
#   scenario 'user selects credit card as payment type', js: true do
#     visit root_path
#
#     first('.catalog li').click_on('Add to Cart')
#     expect(page).to have_content('Total: $45.00')
#     click_button('Checkout')
#     expect(page).to have_current_path(new_order_path)
#     expect(page).to have_content('Please Enter Your Details')
#
#     fill_in 'order_name', with: user[:name]
#     fill_in 'order_address', with: user[:address]
#     fill_in 'order_email', with: user[:email]
#     assert_no_selector '#order_credit_card_number'
#     assert_no_selector '#order_expiration_date'
#     select('Credit Card', from: 'pay_type')
#     assert_selector '#order_credit_card_number'
#     assert_selector '#order_expiration_date'
#   end
#
#   scenario 'user selects PO as payment type', js: true do
#     visit root_path
#
#     first('.catalog li').click_on('Add to Cart')
#     expect(page).to have_content('Total: $45.00')
#     click_button('Checkout')
#     expect(page).to have_current_path(new_order_path)
#     expect(page).to have_content('Please Enter Your Details')
#
#     fill_in 'order_name', with: user[:name]
#     fill_in 'order_address', with: user[:address]
#     fill_in 'order_email', with: user[:email]
#     assert_no_selector '#order_po_number'
#     select('Purchase Order', from: 'pay_type')
#     assert_selector '#order_po_number'
#   end
#
#   scenario 'checkout with "check"', js: true do
#     visit root_path
#
#     # Place Order
#     first('.catalog li').click_on('Add to Cart')
#     click_button('Checkout')
#     fill_in 'order_name', with: user[:name]
#     fill_in 'order_address', with: user[:address]
#     fill_in 'order_email', with: user[:email]
#     select('Check', from: 'pay_type')
#     fill_in 'Routing #', with: '054321'
#     fill_in 'Acct #', with: '123456789'
#
#     # Expect Order, LineItem to update.
#     perform_enqueued_jobs do
#       click_button 'Place Order'
#     end
#
#     expect(Order.count).to eq(1)
#     expect(LineItem.count).to eq(1)
#     # Check Order info is correct
#     order = Order.first
#     expect(order.name).to eq(user[:name])
#     expect(order.address).to eq(user[:address])
#     expect(order.email).to eq(user[:email])
#     expect(order.pay_type.name).to eq('Check')
#
#     # Check Email was sent.
#     mail = ActionMailer::Base.deliveries.last
#     expect(mail.to.first).to eq(user[:email])
#     expect(mail.from).to eq('RailsDepotAdmin admin@rails-depot.com')
#     expect(mail.subject).to eq('Pragmatic Store Order Confirmation')
#   end
#
#   scenario 'checkout with "credit card"', js: true do
#     visit root_path
#
#     first('.catalog li').click_on('Add to Cart')
#     click_button('Checkout')
#     fill_in 'order_name', with: user[:name]
#     fill_in 'order_address', with: user[:address]
#     fill_in 'order_email', with: user[:email]
#     select('Credit Card', from: 'pay_type')
#     fill_in 'CC #', with: '1234 2341 3214 4321'
#     select('01 - January', from: 'order_expiration_month')
#     select('2024', from: 'order_expiration_year')
#
#     perform_enqueued_jobs do
#       click_button 'Place Order'
#     end
#
#     order = Order.first
#     expect(order.name).to eq(user[:name])
#     expect(order.address).to eq(user[:address])
#     expect(order.email).to eq(user[:email])
#     expect(order.pay_type.name).to eq('Credit Card')
#
#     # Check Email was sent.
#     mail = ActionMailer::Base.deliveries.last
#     expect(mail.to.first).to eq(user[:email])
#     expect(mail.from).to eq('RailsDepotAdmin admin@rails-depot.com')
#     expect(mail.subject).to eq('Pragmatic Store Order Confirmation')
#   end
#
#   scenario 'checkout with "Purchase Order"', js: true do
#     visit root_path
#
#     first('.catalog li').click_on('Add to Cart')
#     click_button('Checkout')
#     fill_in 'order_name', with: user[:name]
#     fill_in 'order_address', with: user[:address]
#     fill_in 'order_email', with: user[:email]
#     select('Purchase Order', from: 'pay_type')
#     fill_in 'PO #', with: '12343214'
#
#
#     perform_enqueued_jobs do
#       click_button 'Place Order'
#     end
#
#     order = Order.first
#     expect(order.name).to eq(user[:name])
#     expect(order.address).to eq(user[:address])
#     expect(order.email).to eq(user[:email])
#     expect(order.pay_type.name).to eq('Purchase Order')
#
#     # Check Email was sent.
#     mail = ActionMailer::Base.deliveries.last
#     expect(mail.to.first).to eq(user[:email])
#     expect(mail.from).to eq('RailsDepotAdmin admin@rails-depot.com')
#     expect(mail.subject).to eq('Pragmatic Store Order Confirmation')
#   end
# end
