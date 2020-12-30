class ApplicationController < ActionController::API
    # before_action :authorized
    # include ActionController::Helpers
    # helper current_user, :is_logged_in?
    

  # helper_method :current_user, :is_logged_in?
  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end

  def is_logged_in?
    # puts 'Ran'
    !!current_user
  end
  # def encode_token(payload)
  #   JWT.encode(payload, 'yourSecret')
  # end

  # def auth_header
  #   # { Authorization: 'Bearer <token>' }
  #   request.headers['Authorization']
  # end

  # def decoded_token
  #   if auth_header
  #     token = auth_header.split(' ')[1]
  #     # header: { 'Authorization': 'Bearer <token>' }
  #     beginitem_params
  #       JWT.decode(token, 'yourSecret', true, algorithm: 'HS256')
  #     rescue JWT::DecodeError
  #       nil
  #     end
  #   end
  # end

  # def logged_in_user
  #   if decoded_token
  #     user_id = decoded_token[0]['user_id']
  #     @user = User.find_by(id: user_id)
  #   end
  # end

  # def logged_in?
  #   !!logged_in_user
  # end
  # def authorized
  #   render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  # end
end