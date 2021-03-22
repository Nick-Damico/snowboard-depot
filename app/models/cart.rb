class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy
    has_many :products, through: :line_items


    def add_product(product)
      if (current_item = line_items.find_by(product_id: product.id))
        current_item.quantity += 1
      else
        current_item = line_items.build(product_id: product.id)
      end
      current_item
    end

    def total_price
      line_items.to_a.sum { |li| li.total_price }
    end
end
