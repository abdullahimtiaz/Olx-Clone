module UserHelper
    def current_user
        @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
      end
    
      def is_logged_in?
        !!current_user
      end
  end