class ClientsController < ApplicationController

    def index
    end

    def new
        @client = Client.new
    end

    def create
        binding.pry
        @client = Client.create(client_params)
        redirect_to client_path(@client)
    end

    def show
        @client = Client.find(params[:id])
    end

    private

    def client_params
        params.require(:client).permit(:first_name, :last_name)
    end

end
