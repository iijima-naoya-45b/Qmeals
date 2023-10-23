# db/seeds/users.seed.rb

require 'faker'

# 生成するユーザーの数を指定
# db/seeds/users.seed.rb

# 生成するユーザーの数を指定
num_users = 10

num_users.times do |n|
  email = "xxxx@example.com#{n}"
  name = "test#{n}"

  User.create!(
    name:,
    email:
  )
end
