class Customer
  attr_reader :id, :address
  def initialize(id, address)
    @id = id
    @address = address
  end
end