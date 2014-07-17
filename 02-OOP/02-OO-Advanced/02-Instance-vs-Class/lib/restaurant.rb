class Restaurant

  #TODO add relevant accessors if necessary
  attr_reader :name, :average_rating
  attr_accessor :rate, :city

  def initialize(city, name)
    #TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @average_rating = 0
    @array_rating = []
  end

  #TODO: implement #filter_by_city and #rate methods
  def rate(mark)
    @array_rating << mark
    @average_rating = @array_rating.inject(:+) / @array_rating.size
  end

  def self.filter_by_city(restaurant, city)
    sorted_restaurant = []
    restaurant.each do |restaurant|
      sorted_restaurant << restaurant if restaurant.city == city
    end
    return sorted_restaurant
  end
end


