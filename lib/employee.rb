# create a class called 'Employee' and inherit Base Method from ActiveRecord
class Employee < ActiveRecord::Base
  # an employee `belongs_to` a store
  belongs_to :store

  # check if store, first_name, last_name, and hourly_rate are provided
  validates :store, :first_name, :last_name, :hourly_rate, presence: true
  # check if hourly_rate is 40 <= integer <= 200
  validates :hourly_rate, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 40,
    less_than_or_equal_to: 200
  }
end