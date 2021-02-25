FactoryBot.define do
  factory :item do
    name                  { Faker::Commerce.product_name }
    description           { Faker::Lorem.sentence }
    category_id           { Faker::Number.within(range: 2..11) }
    condition_id          { Faker::Number.within(range: 2..7) }
    bear_shipping_id      { Faker::Number.within(range: 2..3) }
    prefecture_id         { Faker::Number.within(range: 2..48) }
    shipment_day_id       { Faker::Number.within(range: 2..4) }
    price                 { Faker::Commerce.price(range: 300..9999999, as_string: true) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
