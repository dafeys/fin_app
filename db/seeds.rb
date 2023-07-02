require 'faker'

Category.create(name: "ATB", description:"Shopping for groceries at ATB")
Category.create(name: "Silpo", description:"Shopping for groceries at Silpo")
Category.create(name: "Market", description:"Shopping for groceries at Marker")
Category.create(name: "Epicenter", description:"Shopping for different things at Epicentr")
Category.create(name: "Rozetka", description:"Online Shopping at Razetka")
Category.create(name: "OLX", description:"Online Shopping at Razetka")
Category.create(name: "Utilities", description:"Payment for the apartment")


30.times do |operation|
  Operation.create(
    amount: rand(1..50),
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


