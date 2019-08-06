class SessionsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to @user
    end

    def destroy
        session.delete :user_id
    end

    private

    def logged_in?
        if session[:user_id]
        end
    end

    def require_login
        unless logged_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to new_session_url
        end
    end

end
