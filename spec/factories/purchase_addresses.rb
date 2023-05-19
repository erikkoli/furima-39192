FactoryBot.define do
  factory :purchase_address do
    
    post_code     { '123-4567' }
    prefecture_id { 2 }
    city          { '札幌市' }
    house_number  { '中央区1-2-3' }
    building      { '海鮮ビル' }
    phone_number  { Faker::Number.number(digits: 11) }

    association :user
    association :exhibit
  end
end