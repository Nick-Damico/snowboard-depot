class CombineItemsInCart < ActiveRecord::Migration[5.2]
  def up
    Cart.all.each do |cart|
      if cart.line_items.empty?
        cart.destroy
        next
      end

      query = cart.line_items.group(:product_id).sum(:quantity)
      query.each do |product_id, ct|
        next unless ct > 1

        cart.line_items.where(product_id: product_id).destroy_all
        cart.line_items.build(product_id: product_id, quantity: ct)
        cart.save
      end
    end
  end

  def down
    LineItem.where('quantity > 1').each do |li|
      line_item.quantity.times do
        LineItem.create(
          product_id: li.product_id,
          cart_id: li.cart_id,
          quantity: 1
        )
      end
      li.destory
    end
  end
end
