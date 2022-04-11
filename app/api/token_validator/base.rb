module TokenValidator
  class Base < Grape::API
    mount TokenValidator::V1::Users
    mount TokenValidator::V1::Tokens
  end
end