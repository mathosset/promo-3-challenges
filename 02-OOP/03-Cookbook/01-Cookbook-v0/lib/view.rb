require 'csv'
require_relative "cookbook"
require_relative "controller"
require_relative "router"


class View

  def list(recipes)
    recipes.each_index do |recipe, index|
      puts "#{index} - #{recipe}"
    end
  end

  def add_recipe(name, description)
    puts "what is the name and the description (separate by +) of the new recipe:"
    return gets.chomp.split("+")
  end

  def destroy_recipe(index)
    puts "which recipe would you like to remove:"
    return gest.chomp.to_i
  end

end