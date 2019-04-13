User.create!(name:  "Vũ Hải Sơn",
             email: "vuhaison@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true,
             )

99.times do |n|
  name  = Faker::Games::LeagueOfLegends.champion
  email = Faker::Internet.email
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Games::LeagueOfLegends.quote
  users.each { |user| user.microposts.create!(content: content) }
end

50.times do |n|
  name  = Faker::Device.model_name
  price = 15000000
  descripetion = Faker::Lorem.sentence(10)
  ram = "10G"
  monitor= "15.6 inch"
  weight= "1.5 kg"
  company = Faker::Device.manufacturer

  Laptop.create!(name:  name,
              price: price,
              descripetion: descripetion,
              ram: ram,
              monitor: monitor,
              weight: weight,
              company: company)
end