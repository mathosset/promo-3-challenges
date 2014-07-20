require_relative "cookbook"
require_relative "view"
require_relative "recipe"

class Controller

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new

  end

  def list
    @view.list(@cookbook.recipes)

  end

  def create
    @cookbook.add_recipe(Recipe.new(@view.add_recipe[0], @view.add_recipe[1]))
  end

  def destroy
    @cookbook.remove_recipe(@view.destroy_recipe)
  end


end