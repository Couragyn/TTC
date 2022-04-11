class Token < ApplicationRecord
  def self.generate_unique_token
    unique = false
    token = Luhn.generate(9)

    while unique == false
      if User.find_by(token: token)
        token = Luhn.generate(9)
      else
        unique = true
      end
      return token
    end
  end

  def self.is_valid?(number)
    return Luhn.valid? number
  end
end
