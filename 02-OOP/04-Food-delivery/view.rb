class View
  def display_customers(restaurant)
    restaurant.customers.each do |customer|
      puts "#{customer.id} - #{customer.address}"
    end
  end

  def display_employees(restaurant)
    puts "MANAGER:"
    puts "- #{restaurant.manager.id}"
    puts "DELIVERY GUY:"
    restaurant.delivery_guys.each do |delivery_guy|
      puts "- #{delivery_guy.id}"
    end
  end

  def display_orders(restaurant)
    restaurant.orders.each do |order|
      order
    end
  end

end