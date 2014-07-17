class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_reader :age, :fruits, :height

  def initialize
    @age = 0
    @height = 0
    @fruits = 0
  end

  def dead?
    if @age <= 50
      return false
    elsif @age >= 100
      return true
    else
      return [true, false].sample
    end
  end

  def one_year_passes!
    @age += 1
    fruit_production
    if @age <= 10
      @height = @age
    else
      @heigth = 10
    end
  end

  def fruit_production
    @fruits = 0
    @fruits = 100 if (6..10).cover?(@age)
    @fruits = 200 if (11..15).cover?(@age)
  end

  def pick_a_fruit!
    @fruits -= 1
  end
end

