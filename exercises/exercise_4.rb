require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts 'Exercise 4'
puts '----------'

# Your code goes here ...
# create Store class and inherit Base method from ActiveRecord
class Store < ActiveRecord::Base
end

# create 3 store options
surrey_option = { name: 'Surrey', annual_revenue: 224_000, mens_apparel: false, womens_apparel: true }
whistler_option = { name: 'Whistler', annual_revenue: 1_900_000, mens_apparel: true, womens_apparel: false }
yaletown_option = { name: 'Yaletown', annual_revenue: 430_000, mens_apparel: true, womens_apparel: true }
option_lists = [surrey_option, whistler_option, yaletown_option]

option_lists.each do |option|
  Store.create(option)
end

# find stores that carry men's apparel and store the results @mens_stores
@mens_stores = Store.where(mens_apparel: true)

# print out each of @mens_stores store name and annual_revenue
@mens_stores.each do |store|
  puts "#{store[:name]}'s annual_revenue: #{store[:annual_revenue]}'"
end

# find stores that carry women's apparel and generate less than $1M in annual_revenue
@womens_stores = Store.where(['womens_apparel = ? and annual_revenue < ?', true, 1_000_000])
pp @womens_stores
