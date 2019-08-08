class CaseloadsController < ApplicationController
    def index
    end

    def edit
        @user = User.find(params[:user_id])
        @caseload = @user.caseload
    end

    def show
        binding.pry
        @caseload = Caseload.find_by(user_id: params[:user_id])
    end
end