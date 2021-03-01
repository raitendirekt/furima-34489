FactoryBot.define do
  factory :purchase_address do
    postal_code        { '460-0000' }
    prefecture_id      { Faker::Number.within(range: 2..48) }
    city               { Faker::Address.city }
    house_number       { Faker::Address.street_address }
    building_name      { Faker::Address.secondary_address }
    mobile_number      { Faker::Number.leading_zero_number(digits: 11) }
  end
end
