# frozen_string_literal: true

# create_table "line_items", force: :cascade do |t|
#   t.integer "product_id"
#   t.integer "cart_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.integer "quantity", default: 1
#   t.decimal "price", precision: 8, scale: 2
#   t.index ["cart_id"], name: "index_line_items_on_cart_id"
#   t.index ["product_id"], name: "index_line_items_on_product_id"
# end
class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  after_update :delete_item, if: :quantity_zero?

  def total_price
    product.price * quantity
  end

  def decrease_quantity
    self.update_attribute(:quantity, self.quantity - 1)
  end

  private
  def quantity_zero?
    quantity <= 0
  end

  def delete_item
    self.destroy
  end
end
