class Token < ApplicationRecord
  def self.generate_unique_token
    unique = false
    token = Luhn.generate(9)

    while unique == false
      # Quick and dirty solution to get Luhn starting with 9. Stretch goal is to return and write out generation script myself
      if (token[0].to_s != "9") || User.find_by(token: token)
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
