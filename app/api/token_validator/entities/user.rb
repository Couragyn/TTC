module TokenValidator
  module Entities
    class User < Grape::Entity
      expose :email
      expose :name
      expose :token
      expose :expiry
    end
  end
end