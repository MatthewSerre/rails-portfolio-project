class SessionsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new
        if session[:user_id]
            redirect_to '/'
        end
    end

    # def create
    #     @user = User.find_by(name: params[:user][:name])
    #     if @user && @user.authenticate(params[:user][:password])
    #         session[:user_id] = @user.id
    #         redirect_to @user
    #     else
    #         flash[:error] = "User name or password was incorrect.  Please try again."
    #         redirect_to new_session_url
    #     end
    # end

    def create
        @user = User.find_or_create_from_auth_hash(request.env["omniauth.auth"])
        session[:user_id] = @user.id
        redirect_to @user
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def require_login
        if session[:user_id]
        else
          flash[:error] = "You must be logged in to access this section"
          redirect_to '/'
        end
    end

end
