require 'faker'

create_users = 10

create_users.times do |n|
  email = "xxxx@example.com#{n}"
  name = "test#{n}"
  password = 'password'

  User.create!(
    name:,
    email:,
    password:
  )
end
