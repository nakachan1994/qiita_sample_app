FactoryBot.define do
  factory :comment do
    # アソシエーションを定義
    association :post
    association :user
    comment { Faker::Lorem.characters(number: 10) }
  end
end
