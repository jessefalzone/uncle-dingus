class Enigma
  def initialize
  end

  def encode
  end

  def decode
  end

  def verify(user_code, drink_code)
    user_code & drink_code == drink_code
  end

end
