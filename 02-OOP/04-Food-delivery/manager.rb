require_relative 'employee'

class Manager < Employee

  def create_order(meals, customer, delivery_guy)
    Order.new(meals, customer, delivery_guy)
  end
end