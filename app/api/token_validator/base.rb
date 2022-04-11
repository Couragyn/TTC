module TokenValidator
  class Base < Grape::API
    mount TokenValidator::V1::Users
  end
end