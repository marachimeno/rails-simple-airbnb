# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Flat.destroy_all

ADJECTIVES = %w[amazing bright small big cozy ideal exclusive modern].freeze

puts 'Creating 5 fake flats...'
5.times do
  flat = Flat.create!(
    name: "#{ADJECTIVES.sample} flat in #{Faker::Address.city}",
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    price_per_night: Faker::Number.decimal(l_digits: 2),
    number_of_guests: Faker::Number.between(from: 1, to: 10)
  )
  flat.save!
end
puts 'Finished!'
