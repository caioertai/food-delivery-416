class OrdersView
  def ask_for_index
    puts "Which number?"
    gets.chomp.to_i - 1
  end

  def display(orders)
    orders.each_with_index do |order, index|
      meal_name = order.meal.name
      customer_name = order.customer.name
      customer_address = order.customer.address
      employee_name = order.employee.username
      puts "#{index + 1}. #{meal_name} for #{customer_name} at #{customer_address} (#{employee_name})"
    end
  end
end
