class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user
    helper_method :require_login
  
    def authenticate
        redirect_to "/signin" unless user_signed_in?
    end
  
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def require_login
        if session[:user_id]
        else
          flash[:error] = "You must be logged in to access this section"
          redirect_to '/signin'
        end
    end
  
    def user_signed_in?
        !!current_user
    end
end
