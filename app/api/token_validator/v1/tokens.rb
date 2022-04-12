module TokenValidator
  module V1
    class Tokens < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :tokens do
        desc 'Validates a token'
        params do
          requires :token, allow_blank: false, type: Integer, regexp: /[9]+\d{9}$/
        end

        get '/:token' do
          if Token.is_valid?(params[:token])
            status 200
          else
            status 404
          end
        end

        desc 'Return all tokens'
        get do
          tokens = User.pluck(:token)
        end

        desc 'Validates if a token is assined to a user'
        params do
          requires :email, allow_blank: false, regexp: /.+@.+/
          requires :token, allow_blank: false, type: Integer, regexp: /[9]+\d{9}$/
        end
        get '/:token/email/:email', requirements: { email: /[\s\S]*/ } do
          user = User.find_by(email: params[:email])

          if !user.present? || (user.token.to_i != params[:token])
            status 404
          else
            status 200
          end
        end
      end
    end
  end
end