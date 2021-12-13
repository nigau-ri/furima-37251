FactoryBot.define do
  factory :address do
    postal_code   {Faker::Number.number(digits: 3).to_s + "-" + Faker::Number.number(digits: 4).to_s}
    prefecture_id {Faker::Number.between(from: 1, to: 47)}
    city          {Gimei.unique.city.kanji}
    addresses     {Gimei.unique.town.kanji}
    building      {Faker::Lorem.sentence}
    phone_number  {Faker::PhoneNumber.subscriber_number(length: 11)}
  end
end
