class SessionsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new
        if current_user
            redirect_to current_user
        end
    end

    def create
        auth = request.env["omniauth.auth"]
        if !auth.nil?
            @user = User.find_or_create_from_auth_hash(auth)
            if @user.errors.any?
                render "/sessions/new"
            else
                session[:user_id] = @user.id
                redirect_to @user
            end
        else
            @user = User.find_by(email: params[:user][:email])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to @user
            else
                flash[:error] = "User name and/or password was left blank or incorrect.  Please try again."
                redirect_to signin_url
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

end
