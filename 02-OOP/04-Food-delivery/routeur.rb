class Router
  def initialize
    @running = true
  end

  def run
    puts "Welcome to ..."
    puts "----------------------"
    puts "please enter you username"
    username = gets.chomp
    puts "Please enter your password"
    password = gets.chomp

    while @running
      if username.instance_of?(Manager)
        display_task_manager
        action = gets.chomp.to_i
        case action
        when 1 then @controller.list_customers
        when 2 then @controller.add_customer
        when 3 then @controller.view_orders
        when 4 then @controller.add_order
        when 5 then @controller.remove_order
        when 6 then @controller.list_employees
        when 7 then stop
      elsif username.instance_of?(DeliveryGuy)
        display_task_delivery_guy
        action = gets.chomp.to_i
        case action
        when 1 then @controller.view_orders
        when 2 then @controller.complete_order
        when 3 then stop
      else
        "ACCESS DENIED"
      end

    end
  end

  def stop
    @running = false
  end

  def display_task_manager
    puts "1. List customers"
    puts "2. Add customers"
    puts "3. View orders <customer_id>"
    puts "4. Add order <customer_id>, <employee_id>"
    puts "5. Remove order <order_id>"
    puts "6. List employees"
    puts "7. Logout"
  end

  def display_task_delivery_guy
    puts "1. View orders"
    puts "2. Complete order <order_id>"
    puts "3. Logout"
  end

end