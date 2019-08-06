module UsersHelper
    def current_user
        current_user ||= User.find(session[:user_id])
        return current_user
    end
end
