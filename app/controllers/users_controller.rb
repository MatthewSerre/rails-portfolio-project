class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :new, :create]

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.errors.any?
            render :new
        else
            Caseload.create(user_id: @user.id)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def most_active_user
        @user = User.most_active_user
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
