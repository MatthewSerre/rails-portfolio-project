class CaseloadsController < ApplicationController
    before_action :require_login

    def index
        @caseloads = Caseload.all
        respond_to do |f|
            f.html
            f.json { render json: @caseloads }
        end
    end

    def edit
        @user = User.find(params[:user_id])
        @caseload = @user.caseload
        unless authorized(@user)
            flash[:error] = "You cannot edit another user's caseload."
            redirect_to caseloads_url
        end
    end

    def update
        @user = User.find(params[:user_id])
        @caseload = @user.caseload
        client = Client.find(params[:caseload][:client_ids])
        if authorized(@user)
            client.caseload_id = @caseload.id
            client.save
            redirect_to user_caseload_url(@user, @caseload)
        else
            flash[:error] = "You cannot update another user's caseload."
            redirect_to caseloads_url
        end
    end

    def show
        @caseload = Caseload.find_by(user_id: params[:user_id])
        respond_to do |f|
            f.html
            f.json { render json: @caseload}
        end
    end
end