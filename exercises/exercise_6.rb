require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts 'Exercise 6'
puts '----------'

# Your code goes here ...
# create a record of employee for a store
new_employee1 = { first_name: 'Byeong', last_name: 'Kim', hourly_rate: 60 }
new_employee2 = { first_name: 'Skye', last_name: 'Lowry', hourly_rate: 50 }
# in exercise_2.rb, we have an instance variable (var that belongs to a parent class)
# @store1 = Store.find(1). the new employee belongs to @store1
@employee1 = @store1.employees.create(new_employee1)

# find store with id = 4 and create an instance variable
# then add a new employee that `belongs_to` that store
@store4 = Store.find_by(id: 4)
@employee2 = @store4.employees.create(new_employee2)
