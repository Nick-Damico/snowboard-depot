FactoryBot.define do
  factory :product do
    title { 'Burton Custom Snowboard' }
    description { 'An amazing all-mountain board' }
    price { rand(50.00..999.00).round(2) }
    image_url { 'snowboard.jpg' }
  end
end
