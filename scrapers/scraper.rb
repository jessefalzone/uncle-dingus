require 'nokogiri'
require 'rest-client'
require 'mongoid'

doc = Nokogiri::HTML(RestClient.get('http://www.esquire.com/drinks/drinks-full-list/'))
names = doc.css(".result_content h2")
names.each { |name| puts "#{name.text}\n"}
puts names.length

recipes = doc.css(".result_content ul")
array = Array.new

recipes.each do |recipe|
  recipe_string = ""
  items = recipe.css("li")
  items.each do |item|
    recipe_string += "#{item.text.strip}\n"
  end
  array << recipe_string
  array << "--------------------------"
end

puts array

