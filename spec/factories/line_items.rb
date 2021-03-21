FactoryBot.define do
  factory :line_item do
    product { create(:product) }
    cart { create(:cart) }
  end
end
