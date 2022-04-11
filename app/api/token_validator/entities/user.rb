module TokenValidator
  module Entities
    class User < Grape::Entity
      expose :email
      expose :name
      expose :token
    end
  end
end