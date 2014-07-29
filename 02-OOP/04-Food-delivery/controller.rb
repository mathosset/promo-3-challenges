class Controller

  def initialize (restaurant)
    @restaurant = restaurant
    @view = View.new
  end

  def list_customers
    view.display_customers(@restaurant)
  end

  def add_customers

  end
end