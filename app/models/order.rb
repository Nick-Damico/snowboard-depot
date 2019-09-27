require 'pago'
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

  def charge!(pay_type_params)
    payment_details = {}
    payment_type = PayType.find_by(id: pay_type_params.fetch(:pay_type_id)).try(:name)

    case payment_type
    when 'Check'
      payment_method = :check
      payment_details[:routing] = pay_type_params[:routing_number]
      payment_details[:account] = pay_type_params[:account_number]
    when 'Credit Card'
      payment_method = :credit_card
      payment_details[:cc_num] = pay_type_params[:credit_card_number]
      payment_details[:expiration_month] = pay_type_params[:expiration_month]
      payment_details[:expiration_year] = pay_type_params[:expiration_year]
    when 'Purchase Order'
      payment_method = :po
      payment_details[:po_num] = pay_type_params[:po_num]
    end
    order_id:, payment_method:, payment_details:
    Pago.make_payment(order_id:, payment_method:, payment_details: )
  end

  private

  def pay_type_match
    unless (pay_type = PayType.find_by(id: pay_type_id))
      errors.add(:pay_type, "Not permitted")
    end
  end
end
