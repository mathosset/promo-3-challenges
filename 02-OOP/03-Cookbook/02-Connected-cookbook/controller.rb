require_relative "cookbook"
require_relative "view"
require_relative "recipe"

class Controller

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes = @cookbook.recipes
    @view.display_recipes(recipes)

  end

  def create
    name = @view.get_recipe_name_to_add
    description = @view.get_recipe_description_to_add
    new_recipe = Recipe.new(name, description)
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    recipe_to_destroy = @view.get_recipe_id_to_remove
    @cookbook.remove_recipe(recipe_to_destroy)
  end

  def marmiton
    keyword = @view.import_from_marmiton
    @cookbook.add_recipe_from_marmiton(keyword)
  end

end