class ApplicationController < ActionController::API
    def authorize
        auth_header = request.headers['Authorization']
        token = auth_header.split(" ")[1]
        secret = Rails.application.secrets.secret_key_base
        begin
            payload = JWT.decode(token, secret)[0]
            @user_id = payload["user_id"]
        rescue
            render json: {error: "Please log in for access"}, status: :unauthorized
        end
    end
end
