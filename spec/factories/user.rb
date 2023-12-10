FactoryBot.define do
  factory :user do
    email { Faker::Internet.email(name: first_name) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::Internet.password(min_length: 12, max_length: 20, mix_case: true, special_characters: false)}
  end
end
