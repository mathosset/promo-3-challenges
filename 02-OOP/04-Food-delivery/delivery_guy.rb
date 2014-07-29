require_relative 'employee'
class DeliveryGuy < Employee
  attr_reader :orders, :id
  def initialize(id, password)
    super(id, password)
    @orders = []
  end
end