require 'csv'

class Cookbook

  attr_reader :recipes

  def initialize(csv_file)
    @recipes = []
    @filepath = "/Users/caroline/code/mathosset/promo-3-challenges/02-OOP/03-Cookbook/01-Cookbook-v0/#{csv_file}"
    load_csv
  end

  def load_csv
    CSV.foreach(@filepath) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save
    CSV.open(@filepath, 'w') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

  def add_recipe(recipe)
    @recipes << recipe
    save
  end

  def remove_recipe(recipe_id)
     @recipes.delete_at(recipe_id)
     save
  end
end

