class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_user
  
    # Define the current_user method:
    def current_user
      # Look up the current user based on user_id in the session cookie:
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorize
        redirect_to login_path, alert: 'You must be logged in to access this page. Please log in or sign up.' if current_user.nil?
    end

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to user_path(@current_user), alert: "Access denied!"
    end
end
