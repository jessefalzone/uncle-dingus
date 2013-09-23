class Enigma

  @@ingredients = ["whiskey","vermouth","van der hum","tequila",
    "sherry","rum","port","pastis","pernod",
    "orange curacao","guiness","grand marnier",
    "gin","dubonnet","drambuie","creme de menthe",
    "creme de cacao","cointreau","cognac","cherry liqueur",
    "champagne","campari","burgandy","brandy","benedictine",
    "beer","apricot liqueur","anisette","absinthe"]

  def initialize
    @code_string = ""
  end

  def encode(contents)
    index = 0
    @code_string == ""
    @@ingredients.each do |ingredient|
      if ingredient == contents[index]
        @code_string += "1"
        index += 1
      else
        @code_string += "0"
      end
    end
    puts @code_string
  end

  def decode(code)
    contents = Array.new
    code_array = code.split("")
    code_array.each_with_index do |bit, i|
      if bit == "1"
        contents << @@ingredients[i]
      end
    end
      puts contents
  end

  def verify(user_code, drink_code)
    user_code & drink_code == drink_code
  end

  protected

  def get_code_string
    @code_string
  end
end
