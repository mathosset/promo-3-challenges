class Order
  attr_reader :delivered, :meals, :customer, :delivery_guy, :id
  attr_accessor :restaurant
  def initialize(meals, customer, delivery_guy)
    @delivered = false
    @customer = customer
    @meals = meals
    @delivery_guy = delivery_guy
    @@id_order ||= 0
    increment
    @id = @@id_order
  end

  def foot_the_bill
    @meals.reduce(0) do |bill, meal|
      bill += restaurant.menu[meal.to_sym]
    end
  end

  def to_s
    "#{@id} #{delivery_guy.id} : #{meals.join(", ")}  - #{customer.id} - BILL: $#{foot_the_bill}"
  end

  def increment
    @@id_order += 1
  end

end


