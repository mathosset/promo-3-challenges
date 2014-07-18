require 'csv'

class Cookbook

  attr_reader :recipes

  def initialize
    @recipes = []
    @filepath = '/Users/caroline/code/mathosset/promo-3-challenges/02-OOP/03-Cookbook/01-Cookbook-v0/lib/recipes.csv'
    load_csv
  end

  def load_csv
    CSV.foreach(@filepath) do |row|
      @recipes << row
    end
  end

  def save
    CSV.open(@filepath, 'w') do |csv|
      csv << @recipes
    end
  end

  def add_recipe(recipe)
    @recipes << recipe
    save
  end

  def delete_recipe(recipe)
    @recipes = @recipes.delete(recipe)
    save
  end

  def return_recipe(index)
    return @recipes[index]
  end
end

cb = Cookbook.new
p cb
cb.delete_recipe("Crumpets")
p cb

