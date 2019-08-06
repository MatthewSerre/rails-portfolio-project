class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def logged_in?
        if session[:user_id]
        end
    end

    def require_login
        unless logged_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to new_session_url # halts request cycle
        end
    end

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
