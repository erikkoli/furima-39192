FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {Faker::Japanese::Name.last_name}
    first_name            {Faker::Japanese::Name.name}
    last_name_kana        {person.last.katakana}
    first_name_kana       {person.first.katakana}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2023-5-4')}
  end
end 