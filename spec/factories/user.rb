FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 5) }
    # Internet.emailで、実際のemailアドレスの形でデータを作成できる
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 10) }
  end
end