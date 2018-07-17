require_relative '../setup'

puts 'Exercise 1'
puts '----------'

# Your code goes below here ...
# create a class called 'Store' and inherit (<) Base method from ActiveRecord
class Store < ActiveRecord::Base
end

# create option array of hashes
burnaby_options = { name: 'Bunaby', annual_revenue: 300_000, mens_apparel: true, womens_apparel: true }
richmond_options = { name: 'Richmond', annual_revenue: 1_260_000, mens_apparel: false, womens_apparel: true }
gastown_options = { name: 'Gastown', annual_revenue: 190_000, mens_apparel: true, womens_apparel: false }
option_lists = [burnaby_options, richmond_options, gastown_options]

# loop through option lists and save them into tables
# .create() saves data into tables
option_lists.each do |option_list|
  store = Store.create(option_list)
end
