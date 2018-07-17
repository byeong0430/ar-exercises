require_relative '../setup'
require_relative './exercise_1'

puts 'Exercise 2'
puts '----------'

# Your code goes here ...
# create class called Store and inherit Base method from ActiveRecord
class Store < ActiveRecord::Base
end

# find row with id = 1 and 2. save the results as @store1 and @storer2 (instance variables)
@store1 = Store.find(1)
@store2 = Store.find(2)

# change name to Toronto and update the change in tb
@store1.update(name: 'Toronto')
