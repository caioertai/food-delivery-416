require_relative "../views/meals_view"
require_relative "../views/customers_view"
require_relative "../views/employees_view"
require_relative "../views/orders_view"
require_relative "../models/order"

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository

    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
    @orders_view = OrdersView.new
  end

  def mark_as_delivered(current_user)
    # ASK ORDER REPO for undelivered orders from this guy(???)
    undelivered_orders = @order_repository.undelivered_for(current_user)
    # ASK ORDER VIEW to display
    @orders_view.display(undelivered_orders)
    # ASK VIEW for index
    order_index = @orders_view.ask_for_index
    # GET the order
    order = undelivered_orders[order_index]
    # ASK REPO to mark as delivered
    @order_repository.mark_as_delivered(order.id)
  end

  def list_my_undelivered_orders(current_user)
    # ASK ORDER REPO for undelivered orders from this guy(???)
    undelivered_orders = @order_repository.undelivered_for(current_user)
    # ASK ORDER VIEW to display
    @orders_view.display(undelivered_orders)
  end

  def list_undelivered
    # ASK ORDER REPO for undelivered orders
    undelivered_orders = @order_repository.undelivered
    # ASK ORDER VIEW to display
    @orders_view.display(undelivered_orders)
  end

  def add
    meal = ask_for_meal
    customer = ask_for_customer
    delivery_guy = ask_for_delivery_guy

    # ASK ORDER to instantiate an order
    order = Order.new(meal: meal, customer: customer, employee: delivery_guy)
    # ASK ORDER REPO to save it
    @order_repository.add(order)
  end

  private

  def ask_for_meal
    # ASK MEAL REPO for meals
    meals = @meal_repository.all
    # ASK MEAL VIEW to show them
    @meals_view.display(meals)
    # ASK VIEW for an index
    meal_index = @orders_view.ask_for_index
    # GET from meals list the meal with the given index
    meals[meal_index]
  end

  def ask_for_customer
    # ASK customer REPO for customers
    customers = @customer_repository.all
    # ASK customer VIEW to show them
    @customers_view.display(customers)
    # ASK VIEW for an index
    customer_index = @orders_view.ask_for_index
    # GET from customers list the customer with the given index
    customers[customer_index]
  end

  def ask_for_delivery_guy
    # ASK employee REPO for employees
    delivery_guys = @employee_repository.all_delivery_guys
    # ASK employee VIEW to show them
    @employees_view.display(delivery_guys)
    # ASK VIEW for an index
    delivery_guy_index = @orders_view.ask_for_index
    # GET from employees list the employee with the given index
    delivery_guys[delivery_guy_index]
  end
end
