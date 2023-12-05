module Api
  module V1
    class AuthenticationController < ApplicationController
      def secure_endpoint
        Rails.logger.info("Usuário autenticado: #{current_user.email}")
        render json: { message: 'Acesso concedido!' }
      end

      def login
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
          token = generate_token(user)
          render json: { token: token }
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

      def logout
        render json: { message: 'Logged out successfully' }
      end

      private

      def generate_token(user)
        payload = { user_id: user.id, exp: Time.now.to_i + 3600 } # Token válido por 1 hora
        JWT.encode(payload, Rails.application.secret_key_base, 'HS256')
      end
    end
  end
end
