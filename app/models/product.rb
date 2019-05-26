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
class Product < ApplicationRecord
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_items

  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, PNG, OR JPG image.'
  }

  private

  def ensure_not_referenced_by_any_line_items
    return if line_items.empty?

    errors.add(:base, 'Line Items present')
    throw :abort
  end
end
