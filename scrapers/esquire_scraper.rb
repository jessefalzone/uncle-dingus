require 'nokogiri'
require 'rest-client'

class EsquireScraper
  def initialize
    @source = "http://www.esquire.com/drinks/drinks-full-list/"
    @response = nil
  end

  def scrape
    puts "Scraping Esquire.com"
    print "  Connecting... "

    @response = RestClient.get @source
    puts @response.description.split("|")[0]

    doc = Nokogiri::HTML(@response)
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
      #puts "#{name}\n\n#{recipe_array[i]}\n\n"
    end
    puts "  Completed."
  rescue => e
    e.response
    puts "ERROR: #{e}"
    puts "  Aborting!"
  end

end
