# create a class 'Store' and inherit Base method from ActiveRecord
class Store < ActiveRecord::Base
  # a store `has_many` employees
  has_many :employees

  # check if a store name is at lesat 3 characters long
  validates_length_of :name, minimum: 3, too_short: 'store name must be at least %{count} characters long'
  # check if annual_revenue is an integer >= 0
  validates :annual_revenue, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  # custom validation
  # error when men_apparel and womens_apparel are both false
  if !self[:mens_apparel] && !self[:womens_apparel]
    errors.add(:mens_apparel,'a store must carry at least one of the apparel types (men or women)')
    errors.add(:womens_apparel, 'a store must carry at least one of the apparel types (men or women)'rel_both_false_error)
  end
end
