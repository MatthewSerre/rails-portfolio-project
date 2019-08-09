class CaseloadsController < ApplicationController
    before_action :require_login

    def index
    end

    def edit
        @user = User.find(params[:user_id])
        @caseload = @user.caseload
        if authorized?
            render :edit
        else
            flash[:error] = "You cannot edit another user's caseload."
            redirect_to caseloads_url
        end
    end

    def update
        @user = User.find(params[:user_id])
        @caseload = @user.caseload
        client = Client.find(params[:caseload][:client_ids])
        client.caseload_id = @caseload.id
        client.save
        redirect_to user_caseload_url(@user, @caseload)
    end

    def show
        @caseload = Caseload.find_by(user_id: params[:user_id])
    end
end