require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Your code goes here ...
# calculate the sum of annual_revenue
@total_revenue = Store.sum('annual_revenue')
pp @total_revenue

@avg_revenue = Store.average('annual_revenue')
# convert big decimal to float
pp @avg_revenue.to_f