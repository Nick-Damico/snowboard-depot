FactoryBot.define do
  factory :product do
    title { Faker::Commerce.product_name }
    description { Faker::Company.bs }
    image_url { Faker::Placeholdit.image(size: '50x50', format: %w[gif jpg png].sample) }
    price { Faker::Commerce.price(range: 0..400.0) }
  end

  trait :with_line_item do
    after :build do |p|
      p.line_items << create(:line_item, product: p)
    end
  end
end
