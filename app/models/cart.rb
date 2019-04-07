class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  # @cart.add_product(product)
  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(
        product: product,
        price: product.price
      )
    end

    current_item
  end

  def total_price
    # total of all products
    line_items.sum { |line_item| line_item.total_price }
  end
end