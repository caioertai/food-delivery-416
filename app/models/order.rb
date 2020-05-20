class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(attributes = {})
    @id = attributes[:id] # Integer
    @meal = attributes[:meal] # Meal
    @customer = attributes[:customer] # Customer
    @employee = attributes[:employee] # Employee
    @delivered = attributes[:delivered] || false # true / false
  end

  def mark_as_delivered!
    @delivered = true
  end

  def delivered?
    @delivered
  end

  def to_a
    [@id, @meal.id, @customer.id, @employee.id, @delivered]
  end
end
