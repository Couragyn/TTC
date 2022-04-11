module TokenValidator
  module V1
    class Tokens < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :tokens do
        desc 'Validates a token'
        params do
          requires :token, allow_blank: false, type: Integer, regexp: /[9]+\d{8}$/
        end

        get '/:token' do
          if Token.is_valid?(params[:token])
            status 200
          else
            status 204
          end
        end
      end
    end
  end
end