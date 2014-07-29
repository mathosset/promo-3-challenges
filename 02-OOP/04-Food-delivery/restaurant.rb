require_relative 'order'

class Restaurant
  attr_reader :name, :location, :phone_number, :customers, :delivery_guys, :manager, :menu, :orders
  def initialize(name, location, phone_number)
    @name = name
    @location = location
    @phone_number = phone_number
    @customers = []
    @delivery_guys = []
    @manager = nil
    @orders = []
    @menu = {
      marguaritta: 10,
      calzon: 12,
      regina: 11,
      qfromaggi: 10
    }
  end

  def add_manager(manager)
    @manager = manager
  end

  def add_delivery_guy(delivery_guy)
    @delivery_guys << delivery_guy
  end

  def add_customer(customer)
    @customers << customer
  end

  def add_order(order)
    @orders << order
    order.restaurant = self
  end

  def delete_order(id_order)
    @orders.delete_if do |order|
      id_order == order.id
    end
  end
end
