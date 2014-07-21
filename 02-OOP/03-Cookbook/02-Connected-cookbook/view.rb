require 'csv'
require_relative "cookbook"
require_relative "controller"
require_relative "router"


class View

  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index} - #{recipe.name} - #{recipe.description}"
    end
  end

  def get_recipe_name_to_add
    puts "what is the name of the new recipe:"
    return gets.chomp
  end

  def get_recipe_description_to_add
    puts "what is the description of the new recipe:"
    return gets.chomp
  end

  def get_recipe_id_to_remove
    puts "which recipe would you like to remove:"
    return gets.chomp.to_i
  end

  def import_from_marmiton
    puts "what is the theme of the recipees you want to import from marmitton:"
    return gets.chomp
  end

end