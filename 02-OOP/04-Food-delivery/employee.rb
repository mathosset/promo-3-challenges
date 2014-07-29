class Employee
  attr_reader :id
  def initialize(id, password)
    @id = id
    @password = password
  end
end