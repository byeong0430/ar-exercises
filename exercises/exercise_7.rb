require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts 'Exercise 7'
puts '----------'

# Your code goes here ...
# print out any errors if there are any
class Error
  def show_error(var_instance)
    if var_instance.errors.any?
      puts "\nError!\n"
      var_instance.errors.each do |attribute, message|
        puts "Attribute: #{attribute}, Message: #{message}"
      end
      puts "\n"
    end
  end
end
error = Error.new

# first, you must get a store name from cli
puts "What is your store name?"
store_name = gets.chomp
# 1st way to insert value to table: create an instance class and use .save()
# @new_store = Store.new(name: store_name)
# @new_store.save

# 2nd way to insert value to table: use create() to Store class
@new_store = Store.create(name: store_name)

# # print out any error messages
error.show_error @new_store


# try to add a new employee for store (id = 1)
kim_k = { first_name: 'Kim', last_name: 'Kardashian', hourly_rate: 70 }
@employee = @store1.employees.create(kim_k)

error.show_error @employee
