class CombineLineItemsInCart < ActiveRecord::Migration[5.2]
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          cart.line_items.where(product_id: product_id).destroy_all

          item = cart.line_items.build(
            product_id: product_id,
            quantity: quantity
          )

          item.save!
        end
      end
    end
  end

  def down
    LineItem.all.where("quantity>1").each do |line_item|
      line_item.quantity.times do
        LineItem.create(
          product_id: line_item.product_id,
          cart_id: line_item.cart_id,
          quantity: 1
        )

        line_item.delete
      end
    end
  end
end
