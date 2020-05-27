class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  delegate :price, to: :product, allow_nil: true

  def total_price
    price * quantity
  end
end
