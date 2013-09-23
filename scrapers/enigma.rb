class Enigma

  def initialize
    @ingredients = ["whiskey","vermouth","van der hum","tequila",
                         "sherry","rum","port","pastis","pernod",
                         "orange curacao","guiness","grand marnier",
                         "gin","dubonnet","drambuie","creme de menthe",
                         "creme de cacao","cointreau","cognac","cherry liqueur",
                         "champagne","campari","burgandy","brandy","benedictine",
                         "beer","apricot liqueur","anisette","absinthe"]
    @code_string = ""
  end

  def encode(contents)
    index = 0
    @code_string == ""
    @ingredients.each do |ingredient|
      if ingredient == contents[index]
        @code_string += "1"
        index += 1
      else
        @code_string += "0"
      end
    end
    puts @code_string
  end

  def decode
  end

  def verify(user_code, drink_code)
    user_code & drink_code == drink_code
  end

end
