# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.create!(
  content: 'てすとほげ',
  user_id: 1
)

# 一括で10個のユーザーデータを作成
# 10回繰り返し処理を行う
10.times do |n|
  User.create!(
    # n + 1で数字が重複しないようにする
    email: "test#{n + 1}@test.com",
    name: "テストユーザー#{n + 1}",
    password: 'testhoge'
  )
end
