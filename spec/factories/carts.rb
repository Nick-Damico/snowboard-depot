FactoryBot.define do
  # Currently carts are initialized in Concern CurrentCart
  # Add tracked via a session[:cart_id]
  factory :cart do
  end
end
