require 'csv'
require 'nokogiri'
require 'open-uri'
require_relative 'recipe'


class Cookbook

  attr_reader :recipes

  def initialize(csv_file_path)
    @filepath = csv_file_path
    @recipes = []
    load_csv(@filepath)
  end

  def load_csv(file)
    CSV.foreach(file) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
    return @recipes
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
     @recipes.delete_at(recipe_id.to_i)
     save
  end

  def add_recipe_from_marmiton(keyword)
    response = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{keyword}")
    doc = Nokogiri::HTML(response)
    doc.search('.m_search_result').each do |element|
      name = element.css('.m_search_titre_recette a').inner_text
      description = element.css('.m_search_result_part4').inner_text
      @recipes << Recipe.new(name, description)
    end
    save
  end
end

