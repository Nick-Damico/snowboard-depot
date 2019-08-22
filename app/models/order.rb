# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :pay_type
  has_many :line_items, dependent: :destroy

  validates :name, :address, :email, presence: true
  validate  :pay_type_match

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  private

  def pay_type_match
    unless (pay_type = PayType.find_by(id: pay_type_id))
      errors.add(:pay_type, "Not permitted")
    end
  end
end
