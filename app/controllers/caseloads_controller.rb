class CaseloadsController < ApplicationController
    def index
    end

    def edit
        @user = User.find(params[:user_id])
        @caseload = @user.caseload
    end

    def update
        binding.pry
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