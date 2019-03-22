User.create!(name:  "Vũ Hải Sơn",
             email: "vuhaison@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true,
             )

99.times do |n|
  name  = Faker::Games::LeagueOfLegends.quote
  email = Faker::Internet.email
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end