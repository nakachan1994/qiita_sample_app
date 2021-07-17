FactoryBot.define do
  factory :post do
    # userモデルアソシエーション
    association :user
    image_id { Faker::Lorem.characters(number: 10) }
    content { Faker::Lorem.characters(number: 10) }
  end
end