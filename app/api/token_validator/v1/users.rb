module TokenValidator
  module V1
    class Users < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api
      resource :users do
        desc 'Return list of users'
        get do
          users = User.all
          present users
        end
      end
    end
  end
end