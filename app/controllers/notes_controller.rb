class NotesController < ApplicationController
    before_action :require_login
    
    def index
    end

    def new
        @client = Client.find(params[:client_id])
        @note = Note.new
    end

    def create
        @client = Client.find(params[:client_id])
        @note = @client.notes.create(note_params)
        redirect_to client_note_url(@client, @note)
    end

    def show
        @note = Note.find(params[:id])
    end

    def edit
        @client = Client.find(params[:client_id])
        @note = Note.find(params[:client_id])
    end

    def update

    end

    private

    def note_params
        params.require(:note).permit(:date, :length_in_minutes, :content, :user_id, :client_id)
    end

end
