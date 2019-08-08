class CaseloadsController < ApplicationController
    def index
    end

    def show
        @caseload = Caseload.find_by(user_id: params[:user_id])
    end
end