module UsersHelper
    def logged_in?
        if session[:user_id]
        end
    end

    def current_user
        if logged_in?
            current_user ||= User.find(session[:user_id])
            return current_user
        end
    end
end
