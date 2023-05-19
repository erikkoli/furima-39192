FactoryBot.define do
  factory :exhibit do
    Faker::Config.locale = 'ja'

    product       { Faker::Commerce.product_name }
    explain       { Faker::Lorem.sentence }
    price         { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id   { Faker::Number.between(from: 2, to: 21) }
    condition_id  { Faker::Number.between(from: 2, to: 8) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    postage_id    { Faker::Number.between(from: 2, to: 3) }
    shipment_id   { Faker::Number.between(from: 2, to: 4) }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
