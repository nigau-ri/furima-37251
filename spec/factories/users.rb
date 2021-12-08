FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'貴史'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タカシ'}
    birth_date            {Faker::Date.between(from: '1930-01-01', to: '2010-12-31')}
  end
end
