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

class Store < ActiveRecord::Base
  has_many :employees
  # check if store name is at least 3 characers long
  validates_length_of :name, minimum: 3, too_short: 'store name must be at least %{count} characters long'
  # check if annual_revenue is an integer >= 0
  validates :annual_revenue, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  # custom validation
  validate :carry_mens_or_womens_apparel
  def carry_mens_or_womens_apparel
    # if mens_apparel AND womens_apparel are both false, then error message
    if !self[:mens_apparel] && !self[:womens_apparel]
      errors.add(:mens_apparel, 'a store must carry at least one of the apparel types (men or women)')
      errors.add(:womens_apparel, 'a store must carry at least one of the apparel types (men or women)')
    end
  end
end

class Employee < ActiveRecord::Base
  # check if an employee has any association with a store
  belongs_to :store
  validates :store, presence: true
  # check if first_name, last name, and hourly_rate are provided
  validates :first_name, presence: true
  validates :last_name, presence: true
  # check if hourly_rate is an 40 <= integer <= 200
  validates :hourly_rate, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 40,
    less_than_or_equal_to: 200
  }
end

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
