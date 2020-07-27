# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = ["Vegetables", "Herbs", "Fruits", "Seeds"]

if Category.count == 0
  for i in categories
    Category.create(name: i)
  end
  puts "created #{categories.count} categories"
end  

measurement_units = ["1kg", "500g", "250g", "Each", "Bunch","half"]
if Munit.count == 0
  for i in measurement_units
    Munit.create(name: i)
  end
end
  
# if Breed.count == 0
#     Snake.names.each do |name|
#       Breed.create(name: name.downcase.strip)
#       puts "#{name} created"
#     end
# end

#   puts"---------" 
# for i in genres
#   Genre.create(name: i)
#   puts "created #{i} genre"
# end