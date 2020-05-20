require_relative "app/repositories/order_repository"
require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/repositories/employee_repository"

MEALS_CSV_FILE = File.join(__dir__, "data/meals.csv")
CUSTOMERS_CSV_FILE = File.join(__dir__, "data/customers.csv")
EMPLOYEES_CSV_FILE = File.join(__dir__, "data/employees.csv")
meal_repository = MealRepository.new(MEALS_CSV_FILE)
customer_repository = CustomerRepository.new(CUSTOMERS_CSV_FILE)
employee_repository = EmployeeRepository.new(EMPLOYEES_CSV_FILE)

order_repository = OrderRepository.new("data/orders.csv", meal_repository, customer_repository, employee_repository)

p order_repository
