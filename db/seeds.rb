require 'faker'

User.create(email: 'foo@bar.com', password: 'password', password_confirmation: 'password')

Category.create(name: "ATB", description:"Shopping for groceries at ATB", user_id: User.first.id)
Category.create(name: "Silpo", description:"Shopping for groceries at Silpo", user_id: User.first.id)
Category.create(name: "Market", description:"Shopping for groceries at Marker", user_id: User.first.id)
Category.create(name: "Epicenter", description:"Shopping for different things at Epicentr", user_id: User.first.id)
Category.create(name: "Rozetka", description:"Online Shopping at Razetka", user_id: User.first.id)
Category.create(name: "OLX", description:"Online Shopping at Razetka", user_id: User.first.id)
Category.create(name: "Utilities", description:"Payment for the apartment", user_id: User.first.id)


30.times do |operation|
  Operation.create(
    amount: rand(1..250),
    odate: Faker::Time.backward(days: 90, period: :all, format: nil),
    #odate: Faker::Date.between(from: '2023-01-01', to: '2023-07-01'),
    description:  "#{Faker::Food.fruits}, #{Faker::Food.vegetables} ",
    category_id: rand(1..3)
  )
end

20.times do |operation|
  Operation.create(
    amount: rand(50..1000),
    odate: Faker::Time.backward(days: 90, period: :all, format: nil),
    description: Faker::House.furniture,
    category_id: rand(4..6)
  )
end

20.times do |operation|
  Operation.create(
    amount: rand(50..2000),
    odate: Faker::Time.backward(days: 90, period: :all, format: nil),
    description: Faker::Device.model_name,
    category_id: rand(4..6)
  )
end


