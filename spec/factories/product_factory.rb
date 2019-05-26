FactoryBot.define do
  factory :product do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    image_url { Faker::LoremPixel.image("172x202") + '.jpg' }
    price { Faker::Number.decimal(2) }
  end
end
