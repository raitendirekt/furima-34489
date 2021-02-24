FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3) }
    password_confirmation { password }
    family_name           { Gimei.name.last.kanji }
    first_name            { Gimei.name.first.kanji }
    kana_family_name      { Gimei.name.last.katakana }
    kana_first_name       { Gimei.name.first.katakana }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 70) }
  end
end
