class Recipe

attr_reader :recipe_name

def initialize(recipe_name)
  @recipe_name = recipe_name
end

recipe1 = Recipe.new("Pot au feu")