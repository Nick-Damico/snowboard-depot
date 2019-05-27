# frozen_string_literal: true

FactoryBot.define do
  factory :line_item do
    quantity { 1 }
    price { Faker::Number.decimal(2) }
    product
    cart
  end
end
