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
      end
    end
  end
end