require 'nokogiri'
require 'rest-client'
require 'mongoid'

class EsquireScraper
  def run
    doc = Nokogiri::HTML(RestClient.get('http://www.esquire.com/drinks/drinks-full-list/'))

    names = doc.css(".result_content h2")
    name_array = Array.new
    names.each { |name| name_array << name.text }

    recipes = doc.css(".result_content ul")
    recipe_array = Array.new

    recipes.each do |recipe|
      recipe_string = ""
      items = recipe.css("li")
      items.each do |item|
        recipe_string += "#{item.text.strip}\n"
      end
      recipe_array << recipe_string
    end

    name_array.each_with_index do |name, i|
      puts "#{name}\n\n#{recipe_array[i]}\n\n"
    end
  end

end
