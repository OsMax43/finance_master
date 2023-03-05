# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 5.times do
#   name = Faker::Company.industry 
#   description = Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4)
#   Category.create name: name, description: description
# end

50.times do
  amount = Faker::Number.decimal(l_digits: 3, r_digits: 2)
  odate = Faker::Date.between(from: '2022-10-23', to: '2023-03-01')
  description = Faker::Commerce.product_name
  category_id = Category.pluck(:id).sample
  otype = ['витрата', 'доход'].sample
  Operation.create(amount: amount, odate: odate, description: description, otype: otype, category_id: category_id ) 
end