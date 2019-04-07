class InsertPriceToLineItems < ActiveRecord::Migration[5.2]
  def up
    Cart.all.each do |cart|
      cart.line_items.where("price IS ?", nil).each do |line_item|
        product = line_item.product

        cart.line_items.create!(
          product_id: product.id,
          quantity: line_item.quantity,
          price: product.price
        )

        line_item.destroy
      end
    end
  end

  def down
    Cart.all.each do |cart|
      cart.line_items.each do |line_item|
        product = line_item.product

        cart.line_item.create!(
          product_id: product.id,
          quantity: line_item.quantity,
          price: nil
        )

        line_item.destroy
      end
    end
  end
end
