class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user
    helper_method :require_login
    helper_method :authorized?
  
    def authorized?
        current_user.id == @user.id
    end

    def note_authorized?
        current_user.id == @note.user.id
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def require_login
        if current_user
        else
          flash[:error] = "You must be signed in to view this page."
          redirect_to '/signin'
        end
    end
end
