module TokenValidator
  module V1
    class Users < Grape::API
      require "luhn"

      version 'v1', using: :path
      format :json
      prefix :api

      resource :users do
        desc 'Return list of users'
        get do
          users = User.all
          present users, with: TokenValidator::Entities::User
        end

        desc 'Add a user'
        post do
          user = User.new(
            email: params[:email],
            name: params[:name],
            token: Token.generate_token
          )
          if user.save
            present user, with: TokenValidator::Entities::User
          else
            status 400
          end
        end

        desc 'Return a user'
        params do
          requires :email, allow_blank: false, regexp: /.+@.+/
        end

        get '/:email', requirements: { url: /[\s\S]*/ } do
          user = User.find_by(email: params[:email])

          if user
            present user, with: TokenValidator::Entities::User
          else
            status 404
          end
        end
      end

    end
  end
end