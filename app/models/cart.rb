class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy


  def add_product(product)
    raise 'Argument must be a Product' unless product.is_a?(Product)

    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end

  def total_price
    line_items.sum(&:total_price)
  end
end
