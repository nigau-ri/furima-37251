FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name             { Gimei.unique.last }
    first_name            { Gimei.unique.first }
    last_name_kana        { last_name.katakana }
    first_name_kana       { first_name.katakana }
    birth_date            { Faker::Date.between(from: '1930-01-01', to: '2010-12-31') }
  end
end
